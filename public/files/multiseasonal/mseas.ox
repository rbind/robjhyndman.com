#include <oxstd.h>
#include <oxfloat.h>
#import <maximize>
#include <oxprob.h>
//#include <oxdraw.h>
#import <database>
#include <packages/gnudraw/gnudraw.h>

/*

	Written by Phillip Gould
	Email: phillip.gould@anz.com
	This Version: 26/06/2007

	Purpose: Run the multiple seasonality model over hourly data. Estimates of smoothing parameters
	alpha, beta (only when slope is present) and mGamma.

	Seeds are estimated using the method applied in the paper (Hyndman). 

	Note: The form of the input data Excel spreadsheet is important. 1st column are data to be filtered and the
	2nd through to the 8th column contain day-of-week dummies. These dummies can also be written into the code
	using day-of-week functions for flexibility in handling new sets of data.
	

*/


// Global declarations
decl vY, mX, mX_seed, vYpred, mX2;
decl m1, m2, slength;
decl SSE;
decl iN; //sample size
decl iAssumption;
decl mGamma, alpha, beta;
decl mSeedest;
decl vLevel, vSlope, vSeasonal, vEhat;
decl dLogLik, iCycleLength, iShortCycleLength;
decl vYSeed, mXSeed;

Set_Seed(vYseed, mXseed);

CSM(vP,const adFunc, avScore, ahess)
{
	decl seeds, index, i, j, t, mXSeed, mXTemp, vYTemp;

	

	index=0;	 	// Used to set parameter vector with correct number of elements. Depends on restrictions
					// on (assumptions about) mGamma.

//************ Set model parameters *****************

	mGamma = zeros(m2,m2);
	vP = tanh(vP).*tanh(vP);
	alpha = vP[index++];
	beta = 0;

	
	if(iAssumption==0)
	{
		for(i=0;i<m2;++i)
		{
			for(j=0;j<m2;++j)
			{
				mGamma[i][j] = ((vP[index]));
				index = index+1;
				
			}
		}
	}
	if(iAssumption==1)
	{
		mGamma = ones(m2,m2)*(vP[index++]);
		index = index;
		mGamma = mGamma+vP[index++]*unit(rows(mGamma));
	}
	if(iAssumption==2)
	{
		mGamma = ones(m2,m2)*(vP[index]);
	}
	if(iAssumption==3)
	{
		mGamma = unit(m2,m2)*(vP[index]);
	}
		
	vLevel=zeros(iN+m1,1);
	vSlope=zeros(iN+m1,1);
	vEhat=zeros(iN+m1,1);
	vYpred=zeros(iN+m1,1);
	vSeasonal=zeros(iN+m1,m2);

//  ****************** Set seeds ************************
//	This could be written as a separate function or as part of Set_Seed to increase
// the speed of the CSM function. For this example this speed difference is minor.

	mXSeed = mX[0:slength-1][:];		  	// Define data for seed estimation
	vYSeed = vY[0:slength-1];
	mXTemp= mX[slength:][:];				// Define data for parameter estimation
	vYTemp=vY[slength:];
	
	mSeedest = Set_Seed(vYSeed, mXSeed);
	iN=rows(vYTemp);
	
	vLevel[0:m1-1]=mSeedest[0];
	vSlope[m1-1]=0;
	index=1;

	for(i=0;i<m2;++i)
	{
		for(j=0;j<m1;++j)
		{
			vSeasonal[j][i]=mSeedest[index++];
		}
	}

//******************** Filtering **********************
// This is the main filtering loop.
	
	for(t=m1;t<iN+m1;++t)
	{
		vYpred[t]= vLevel[t-1]+vSlope[t-1]+mXTemp[t-m1][:]*vSeasonal[t-m1][:]';	   //*
		if(vYTemp[t-m1]==-1)
		{
			vEhat[t]=0;				// If there is missing mData vY=-1, so set error=0, i.e. there is no new information to update vLevel, vSlope or vSeasonal.
		}
		else
		{
			vEhat[t]= vYTemp[t-m1] - vYpred[t];
		}
		vLevel[t]=vLevel[t-1]+vSlope[t-1]+alpha*vEhat[t];
		vSlope[t]=vSlope[t-1]+beta*vEhat[t];
		vSeasonal[t][:]=(vSeasonal[t-m1][:])+mXTemp[t-m1][:]*mGamma*vEhat[t];		  //*
	}

	SSE = sumsqrc(vEhat[m1:]);		// Sum of squared errors
	adFunc[0]=double(-SSE/rows(vEhat[m1:]));					//  Maxmimise (-SSE/iN)
	return 1;
}

Set_Seed(vYSeed, mXSeed)
{
	//Function to set seeds using the approach of Hyndman.
	//Note that the method has been altered to allow for non-repeating cycles due to missing data etc...
	//This alteration means that indicators (mXSeed) are used so this method is now quite general.
	//For non-repeating cycles, the MS approach in the paper is required to fit models (DS and HW
	//will not work without indicator variables in such cases).

	decl mX2, vLev, mSeedest, vYSeas, vF, mS, mD, mA, mXSeed2;
	decl i;

	mX2=zeros(rows(vYSeed)/m1,m2);
	for(i=0;i<rows(vYSeed)-m1;i=i+m1)
	{
	   mX2[i/m1][:] = mXSeed[i][:];			// Use mX2 to have a regression parameter for each unique time of the week (168 for seven daily cycles of hourly data).
	}
	mXSeed = mX2**unit(m1);

	ols2c(vYSeed, ones(rows(mXSeed),1)~mXSeed, &mSeedest);	 // Initial seasonal seeds from a regression of seasonal dummies and a constant.

	vLev = zeros(rows(vYSeed)-1*168,1);
	for(i=0;i<rows(vLev);++i)
	{
		vLev[i]=meanc(vYSeed[i:i+1*168]);					// Level term taken as a rolling 168 hour average. Will not necessarily be a week, depending
	}														// on missing data.
	

	vYSeas = vYSeed[168:168+rows(vLev)-1]-vLev;


	mXSeed2 = mXSeed[168:168+rows(vLev)-1][:];
														   
	ols2c(vYSeas, mXSeed2, &mA);						   // Update seed estimates using the new rolling level.
	vF=meanr(meanc(mA));								   // Average of vA should be zero, so remove vF from mA.
	mS=mA-vF*ones(rows(mA),1);
	mD=vYSeed[168:168+rows(vLev)-1]-mXSeed2*mS;
	
	mSeedest[0]=meanc(mD);
	mSeedest[1:]=mS;


	return mSeedest;
	
}

Pred_Interval(iRep, iPeriods)
{
	//Function for generating prediction intervals by simulating iRep times.
	//Prediction intervals go iPeriods ahead.
	//Uses random normals generated with standard deviation equal to that of one-step-ahead errors.

	decl y, vLevel_s, vSlope_s, vSeasonal_s;
	decl vE_s, vYSim, vYVar;
	decl t, i;

	iN=rows(vLevel-m1); 	//rows(vY)-slength;

	vLevel_s = vLevel[:]|zeros(iPeriods,1);
	vSlope_s = vSlope[:]|zeros(iPeriods,1);
	vSeasonal_s = vSeasonal[:][:]|zeros(iPeriods,columns(vSeasonal));

	vYSim=zeros(iN+iPeriods,iRep);
	vYVar=(dLogLik)^(0.5)*ones(rows(vYSim),2);
	vYVar[:][1]=-vYVar[:][1];

	vE_s = (dLogLik)^(0.5)*rann(rows(vYSim),iRep);

	
	for(i=0;i<iRep;++i)
	{	
		
		for(t=iN;t<iN+iPeriods;++t)
		{		

			//print("\nrows(vLevel_s): ", rows(vLevel_s));
			vLevel_s[t]=vLevel_s[t-1]+vSlope_s[t-1]+alpha*vE_s[t][i];
			vSlope_s[t]=vSlope_s[t-1]+beta*vE_s[t][i];
			vSeasonal_s[t][:]=(vSeasonal_s[t-m1][:])+mX[t-m1][:]*mGamma*vE_s[t][i];
			vYSim[t][i]= vLevel_s[t-1]+vSlope_s[t-1]+mX[t-m1][:]*vSeasonal_s[t-m1][:]'+ vE_s[t][i];
		}
	}

	vYVar=vYVar|quantiler(vYSim[iN:][:]-meanr(vYSim[iN:][:]),<0.975, 0.025>);
	return vYVar;
		

}

main()
{
		decl mX0, mX0_seed, mPred, vYTotal; 		//original mX structure loaded from mData - not used in this version
		decl mDayType=zeros(7,1);
		decl mDayType2;
		decl mData;
		decl dbase;
		decl nP; 					// Number of parameters to estimate
		decl init_vP;				// Initial parameter vector.
		decl sname, sname2;
		decl sfilein, sfileout;
		decl i;
		decl AIC, SBC, ir, a, b, c, tempy;
		
		
		// ***************************** Load mData and define cycle length, sample length etc... **********************************
		
		sname="traffic";						// Choose the file name for input XL files
		sname2="MS";
		sfilein="../data/"~sname~".xls"; 		// Contains path to find files
		sfileout=sname2~"_"~sname~".png";
        iCycleLength = 24*7; 					// Full weekly cycle length. Hourly mData used here (7*24=168)
        iShortCycleLength=m1=24;  				// Short daily cycle length (24)

		decl samp = 8*24*7;						// Sample length of 8 weeks.
		decl yindex = 0;  						// Row of mData containing y-series of interest.
		slength = 4*iCycleLength;				// Sample size for seed estimation (4 complete cycles of 24*7=168).
												// In this example, this means the estimation sample is 4 weeks (168 hours) long because 4 weeks
												// of sample have been removed for seed estimation.

		dbase = new Database();
		dbase.Load(sfilein);			
		mData = dbase->GetAll();
		mData = mData[:][:];					// Data needs to start at first hour of day for seed initialization to work.  												
		delete dbase;

		mX0=mData[:][1:7];
		
        mX0_seed=mX0[:slength-1][:];		  	// mX0 for seed estimation sample
		
		vY=mData[0:samp-1][yindex];

		vYTotal=mData[:][yindex];
		
		iAssumption = 1; //Assumptions on structure of mGamma: 0 = none; 1 = diag/off-diag; 2 = single value; 3 = single value diag only.
		iN=rows(vY);
		
        m2=7;								// Number of different day types.
        mDayType2=unit(7); 				// Matrix used to compress 7 day types into m2 day types. In this case there is no compression.
		
/*
		****** Sample code for assuming 5 "types" of day *****

		mDayType[0]= 1; //Sunday
		mDayType[1]= 2; //Monday
		mDayType[2]= 3; //Tuesday
		mDayType[3]= 3; //Wednesday
		mDayType[4]= 3; //Thursday
		mDayType[5]= 4; //Friday
		mDayType[6]= 5; //Saturday

		m2=maxc(mDayType);

		mDayType2[:][0] =<1;0;0;0;0;0;0>;
        mDayType2[:][1] =<0;1;0;0;0;0;0>;
 		mDayType2[:][2] =<0;0;1;1;1;0;0>;
 		mDayType2[:][3] =<0;0;0;0;0;1;0>;
        mDayType2[:][4] =<0;0;0;0;0;0;1>;

*/
		mX = mX0*mDayType2;
		
//      ********************************** Estimation *************************************
//		Set number of parameters required to fill mGamma based on which iAssumption is used.

		if(iAssumption==0)	// No restriction on mGamma
		{
			nP = 1 + m2^2;
		}
		if(iAssumption==1)	// Single diagonal and single off-diagonal term
		{
			nP = 1 + 2;
		}
		if(iAssumption==2)  	// Single value for on and off-diagonals.
		{
			nP = 2;
		}
		if(iAssumption==3)	// Single diagonal value and no off-diagonals.
		{
			nP = 2;
		}		
			
		init_vP =0.5*ones(nP,1);	 	// Starting values for parameters. Try different starting values to ensure
										// model does not converge to a local maximum.
       
	    print("\nParameter starting values: ", tanh(init_vP).*tanh(init_vP));
    
		MaxControl(100,10);		   //nuvYSeaser of iterations
		MaxControlEps(1e-6, 1e-6);
		//ir = MaxSimplex(CSM, &init_vP, &dLogLik, 0);  // Use simplex to start search (not used here).
		ir = MaxBFGS(CSM, &init_vP, &dLogLik, 0,TRUE); 	// Use MAXBFGS for final iterations.

		init_vP = tanh(init_vP).*tanh(init_vP);		  	// Transform init_vP values as done in model estimation.

		dLogLik=-dLogLik;
		AIC = iN*log(dLogLik)+2*nP;						// Calculate AIC
		SBC = iN*log(dLogLik)+log(iN)*nP;				// Calculate SBC		 
		mPred = Pred_Interval(1000,168);				// Calculate prediction intervals (based on 1000 reps going ahead 168 hours from last observation).
		
		print("\n************Output*****************");
		print("\n", sname2);
		print("\nNo. parameters: ", nP);
		print("\nSSE: ", SSE);
		print("\ninit_vP: ", init_vP);
		print("\nmGamma: ", mGamma);
		print("\nLevel Seed: ", vLevel[0]);


		// *** Graphical output of actual and predicted, vSeasonal terms, vLevel term and acf of errors. ***
		DrawTMatrix(0, vY[slength:][:]', {"Actual"}, 2000,1,1);
		DrawTMatrix(0, vYpred[m1:][:]', {"Predicted"}, 2000,1,1,2,3);
		DrawTMatrix(1, vSeasonal[0:23][:]', {"vSeasonals"}, 2000,1,1);
		DrawTMatrix(2, vY[slength:][:]'|vLevel[m1:]', {"Actual","vLevel"}, 2000,1,1);		
		DrawAcf(3, (vEhat'), "Error ACF", 168, 1, 1);
		SaveDrawWindow(sfileout);
        ShowDrawWindow();
		CloseDrawWindow();
		
}
		