### Build and deploy https://robjhyndman.com

all: serve

serve:
	Rscript -e "rmarkdown::render('content/software.Rmd', encoding = 'UTF-8')"
	Rscript -e "blogdown::serve_site()"

build:
	Rscript -e "rmarkdown::render('content/software.Rmd', encoding = 'UTF-8')"
	Rscript -e "blogdown::build_site(build_rmd = 'md5sum')"

deploy: build
	rsync -zrvce 'ssh -p 18765' public/ u190-dvt18hap6a80@m80.siteground.biz:www/robjhyndman.com/public_html

clean:
	rm -rf public
	rm -rf blogdown
	rm -f content/hyndsight/*.html
	rm -f content/seminars/*.html
