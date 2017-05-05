### Build and deploy http://robjhyndman.com

all: serve

serve:
	Rscript -e "blogdown::serve_site()"

build:
	Rscript -e "blogdown::build_site()"

deploy: build
	rsync -zrvce 'ssh -p 18765' public/ robjhynd@m80.siteground.biz:public_html

clean:
	rm -rf public
	rm -rf blogdown
	rm -f content/hyndsight/*.html



