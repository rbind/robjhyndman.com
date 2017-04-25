all:
	Rscript -e "blogdown::serve_site()"

clean:
	rm -rf blogdown
	rm -rf public
	rm -rf content/hyndsight/*.html
	rm -rf content/seminars/*.html
	rm -rf static/hyndsight

