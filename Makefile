include_dir=build
stylesheets_dir=stylesheets
chapters_dir=chapters
source=$(chapters_dir)/*.md
title="CSS: The Hard Parts"
filename='css-the-hard-parts'

# TODO: Add in pdf once pdflatex installed to verify
all: html epub rtf pdf mobi

html:
	pandoc -s chapters/*.md -t html5 -o index.html -c $(stylesheets_dir)/screen.css \
		--include-in-header $(include_dir)/head.html \
		--include-before-body $(include_dir)/author.html \
		--include-after-body $(include_dir)/stats.html \
		--title-prefix $(title) \
		--normalize \
		--section-divs \
		--smart \
		--toc

epub:
	pandoc -s $(source) --normalize --smart -t epub -o $(filename).epub \
		--epub-metadata $(include_dir)/metadata.xml \
		--epub-stylesheet $(stylesheets_dir)/epub.css \
		--epub-cover-image chapters/img/placeholder.png \
		--title-prefix $(title) \
		--normalize \
		--section-divs \
		--smart \
		--toc

rtf:
	pandoc -s $(source) -o $(filename).rtf \
		--title-prefix $(title) \
		--normalize \
		--smart


pdf:
	pandoc -s $(source) -o $(filename).pdf \
		--title-prefix $(title) \
		--normalize \
		--smart \
		--toc

mobi: epub
	kindlegen $(filename).epub
