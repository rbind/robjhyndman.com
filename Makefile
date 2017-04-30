### Build and deploy http://robjhyndman.com

build:
	Rscript -e "blogdown::build_site()"

serve:
	Rscript -e "blogdown::serve_site()"

deploy:
	rsync -zrvce 'ssh -p 18765' public/ robjhynd@m80.siteground.biz:public_html

clean:
	rm -rf public

