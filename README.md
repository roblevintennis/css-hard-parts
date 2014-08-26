# The Secret to Creating Buttons

This will be the repo for the book The Secret to Creating Buttons.

## Setup

In order to build the book on a local machine, you will need to follow the instructions below.

### Dependencies

Pandoc: https://github.com/jgm/pandoc/releases/
Download and run most recent installer dmg

Kindlegen CLI: http://www.amazon.com/gp/feature.html?docId=1000765211
- Unpack and symlink to it e.g.:

```shell
ln -s ~/bin/KindleGen_Mac_i386_v2_9/kindlegen /usr/local/bin
```
You should now have `pandoc` and `kindlegen` available in your shell.

pdflatex: In order to build out PDF files you need to install mactex which is 2.4gb!
https://tug.org/mactex/

```shell
ln -s /path/to/pdflatex /usr/local/bin
```

### Tools

#### Previewing

Kindle Previewer
http://www.amazon.com/gp/feature.html/?docId=1000765261

Adobe Epub Reader
http://www.adobe.com/products/digital-editions.html


#### Validating/Debugging

EpubCheck from https://github.com/IDPF/epubcheck/releases and run the following command after unzipping it:
java -jar ~/bin/epubcheck-v4.0.0-alpha9/epubcheck.jar ~/workspace/opensource/unicorn/buttons-book/secret-to-creating-buttons.epub

More debugging tips here:
http://puppetlabs.com/blog/automated-ebook-generation-convert-markdown-epub-mobi-pandoc-kindlegen


## Reference Materials

http://johnmacfarlane.net/pandoc/epub.html

http://puppetlabs.com/blog/automated-ebook-generation-convert-markdown-epub-mobi-pandoc-kindlegen

https://gist.github.com/sudarkoff/3956724


