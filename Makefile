### Build and deploy https://robjhyndman.com

all: serve

serve:
	Rscript -e "blogdown::serve_site()"

build:
	Rscript -e "blogdown::hugo_build()"

deploy: build
	rsync -zrvce 'ssh -p 18765' public/ robjhynd@m80.siteground.biz:public_html

clean:
	rm -rf public
	rm -rf blogdown
	rm -f content/hyndsight/*.html
	rm -f content/seminars/*.html

