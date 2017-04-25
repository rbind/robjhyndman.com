all:
	Rscript -e "blogdown::serve_site()"

clean:
	rm -r blogdown
	rm -r public
