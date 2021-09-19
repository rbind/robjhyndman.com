---
author: robjhyndman
comments: false
date: 2010-07-06 12:10:12+00:00
slug: 'expsmooth'
title: 'Forecasting with Exponential Smoothing: the State Space Approach'
mathjax: true
---

**[Rob J Hyndman](http://robjhyndman.com), [Anne B Koehler](http://www.fsb.muohio.edu/directory/koehleab), [J Keith Ord](https://gufaculty360.georgetown.edu/s/faculty-profile?netid=ordk), [Ralph D Snyder](https://research.monash.edu/en/persons/ralph-snyder)** (Springer, 2008).

<style>
.verticalhorizontal {
    display: table-cell;
    vertical-align: middle;
}
</style>

<div class="verticalhorizontal">
<table style="width: 100%; table-layout: fixed;"><tr>
  <td width="33%" style="text-align:center; padding: 0.5rem"><a href="https://www.springer.com/us/book/9783540719168"><img src="springer.png" alt="Springer"></a></td>
  <td width="33%" style="text-align:center; padding: 0.5rem"><a href="https://books.google.com/books?id=GSyzox8Lu9YC&amp;lpg=PP1&amp;pg=PP1"><img src="google_books.png" alt="Google books"></a></td>
  <td width="33%" style="text-align:center; padding: 0.5rem"><a href="https://geni.us/expsmooth"><img src="amazon.png" alt="Amazon"></a></td>
</tr></table>
</div>

<a href="https://geni.us/expsmooth"><img src='/img/expsmooth.jpg' width=20% align='left' style="margin-right: 20px; margin-bottom: 20px;"></a>

Exponential smoothing methods have been around since the 1950s, and are still the most popular forecasting methods used in business and industry. However, a modelling framework incorporating stochastic models, likelihood calculation, prediction intervals and procedures for model selection, was not developed until relatively recently. Two key papers were [Ord, Koehler and Snyder (JASA, 1997)](https://www.jstor.org/stable/2965433) and [Hyndman, Koehler, Snyder and Grose (IJF, 2002)](http://robjhyndman.com/papers/hksg) although there have been many others filling in some of the details.

As a result, the area of exponential smoothing has undergone a substantial revolution in the past ten years. The new "state space framework" for exponential smoothing is discussed in numerous journal articles but there has been no systematic explanation and development of the ideas. Furthermore, the notation used in the journal articles tends to change from paper to paper. Consequently, researchers and practitioners struggle to use the new models in applications.

In this book we try to bring together all of the important results in a coherent manner with consistent notation. We have written it for people wanting to apply the methods in their own area of interest as well as for researchers wanting to take the ideas in new directions.

The readership is assumed to have a statistical background at about honours level in the UK/Australian/NZ system and Masters level in the US system.

## R packages and data

The R packages [**forecast**](http://pkg.robjhyndman.com/forecast) and [**fable**](https://fable.tidyverts.org/) both implement the methods described in the book. The [**expsmooth**](http://pkg.robjhyndman.com/expsmooth) package contains the data for the exercises and most of the examples in the book.

You can also download [individual csv files for each data set](expsmooth_data.zip).

## Table of contents

[Preface](expsmooth_preface.pdf)

*Part I: Introduction*

 1. Basic concepts [[R code]](chap01.R)
 2. [Getting started](expsmooth_ch2.pdf) [[R code]](chap02.R) [[Exercise solutions](ch2_solutions.pdf)]

*Part II: Essentials*

 3. Linear innovations state space models [[R code]](chap03.R) [[Exercise solutions](ch3_solutions.pdf)]
 4. Non-linear and heteroscedastic innovations state space models [[Exercise solutions](ch4_solutions.pdf)]
 5. Estimation of innovations state space models [[R code]](chap05.R) [[Exercise solutions](ch5_solutions.R)]
 6. Prediction distributions and intervals [[R code]](chap06.R) [[Exercise solutions](ch6_solutions.pdf)]
 7. Selection of models

*Part III: Further topics*

 8. Normalizing seasonal components [[R code]](chap08.R)
 9. Models with regressor variables [[R code]](chap09.R)
 10. Some properties of linear models
 11. Reduced forms and relationships with ARIMA models
 12. Linear innovations state space models with random seed states
 13. Conventional state space models
 14. Time series with multiple seasonal patterns *(with Phillip Gould)* [[R code]](chap14.R)
 15. Non-linear models for positive data *(with Muhammad Akram)* [[R code]](chap15.R)
 16. Models for count data [[R code]](chap16.R)
 17. Vector exponential smoothing *(with Ashton de Silva)*

*Part IV: Applications*

 18. Inventory control application [[R code]](chap18.R)
 19. Conditional heteroscedasticity and applications in finance [[R code]](chap19.R)
 20. Economic applications: the Beveridge-Nelson decomposition *(with Chin Nam Low and Heather Anderson)*

## Reviews

 * [Review by Professor David Hand, *International Statistical Review*, 77(2), 315-316](https://doi.org/10.1111/j.1751-5823.2009.00085_17.x)
 * [Review by Lars-Erik Oller and Par Stockhammar, *International Journal of Forecasting*, 26(1), 204-205](https://doi.org/10.1016/j.ijforecast.2009.09.005)
 * [Amazon customer reviews](http://www.amazon.com/Forecasting-Exponential-Smoothing-Approach-Statistics/product-reviews/3540719164?tag=otexts-20)


## Errata

This is the list of all errors that we know about. If you think you've spotted a new one, please [let us know](mailto:Rob.Hyndman@monash.edu?Subject=Errata)!

p15
: In the heading for section 2.3.3, "A<sub>d</sub>,A" should read "A<sub>d</sub>,N"

p47
: The discount matrix for the damped local level model is $D=\phi(1-\alpha)$ and the model is stable provided $|\phi(1-\alpha)|<1$, or equivalently $|\phi|<1$ and $0 < \alpha < 2$.

p51
: Exercise 3.2. Change "stable" to "forecastable".<br>
Exercise 3.3. The variance should be $\sigma^2(1+(t-1)\alpha^2)$.

p55
: The third equation should have a plus sign:
    <div>
    $$\boldsymbol{x}_{t} = \boldsymbol{D}(\boldsymbol{x}_{t-1}) + g(\boldsymbol{x}_{t-1})\frac{y_t}{r(\boldsymbol{x}_{t-1})}.$$
    </div>
    The following equation also needs a similar correction.

p76, line4-
: Replace "Classes 1-4" with "Classes 1-5"

p85
: For the ETS(M,A<sub>d</sub>,M) model, $\boldsymbol{w}_1 = [1 ~ \phi]^\prime$  and the matrix $\boldsymbol{G}_1 = \left[\begin{array}{ll}
\alpha & \alpha\phi \\\\ \beta & \beta\phi\end{array}\right]$.

p90
: last line: the last term should be just $\varepsilon_{n+j}$ not $\varepsilon q_{n+j}$


p92
: the sum on the first line should be multiplied by $\sigma^2$.

p102
: For the ETS(M,A<sub>d</sub>,M) model, $\boldsymbol{w}_1 = [1 ~ \phi]^\prime$ and the matrix $\boldsymbol{G}_1 = \left[\begin{array}{ll}
\alpha & \alpha\phi \\\\ \beta & \beta\phi\end{array}\right]$.

p108: heading 7.2.1
: Change "Section" to "Selection".

p109: line 1
: <div>$\hat{y}_{i,n_j}^{(i,j)}$ should be $\hat{y}_{n_j}^{(i,j)}$</div>

p118: line 4
: delete first "is"

p150
: In the ETS(A,A<sub>d</sub>,N) model, $\boldsymbol{w} = [1 ~ \phi]^\prime$ and $\boldsymbol{F} = \left[\begin{array}{ll}
1 & \phi \\\\
0 & \phi
\end{array}\right]$. Similarly, in the ETS(A,A<sub>d</sub>,A) model, the second element of $\boldsymbol{w}$ should be $\phi$ and the second element of the top row of $\boldsymbol{F}$ should be $\phi$.


p154
: In the ETS(A,A<sub>d</sub>,N) model, the second column of $\boldsymbol{D}$ should contain $\phi(1-\alpha)$ and $\phi(1-\beta)$. Similarly, in the ETS(A,A<sub>d</sub>,A) model, the first two elements of the second column of $\boldsymbol{D}$ should be $\phi(1-\alpha)$ and $\phi(1-\beta)$.

p155
: In Table 10.1, the parameter range for $\phi$ should be $-1<\phi\le1$.

p158
: Last sentence: the second element of $\boldsymbol{w}$ should be $\phi$ and the second element of the top row of $\boldsymbol{F}$ should be $\phi$.

p159
: The first two elements of the second column of $\boldsymbol{D}$ should be $\phi(1-\alpha)$ and $\phi(1-\beta)$.

p280: line 10
: Change "finite" to "non-zero".
</dl>

