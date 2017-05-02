### Build and deploy http://robjhyndman.com

all:
	Rscript -e "blogdown::serve_site()" &

deploy:
	Rscript -e "blogdown::build_site()"
	rsync -zrvce 'ssh -p 18765' public/ robjhynd@m80.siteground.biz:public_html

clean:
	rm -rf public

