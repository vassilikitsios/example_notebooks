filename=example

# Open the notebook for editing
edit:
	jupyter notebook $(filename).ipynb

# Deletes the HTML and Latex files
clean:
	rm -vrf *.aux *.log *.pdf *.tex *.out *_files *.slides.html

# Produces HTML source that can be later viewed in a web browser
slides:
	jupyter nbconvert $(filename).ipynb --to slides

# Produces HTML source that is also served to the dafault web browser as a presentation
presentation:
	jupyter nbconvert $(filename).ipynb --to slides --post serve

# Produces a PDF document
doc:
	jupyter nbconvert $(filename).ipynb --to latex --template template.tplx
	cat $(filename).tex | grep -v '</style>' | grep -v 'affiliation' > $(filename)_post.tex
	mv $(filename)_post.tex $(filename).tex
	pdflatex $(filename).tex
