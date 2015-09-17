# MarkdownGradThesisTemplate
This template helps you to write graduate thesis in *Markdown*. This is basicly a wrapper of this [LaTeX template](http://www.latextemplates.com/template/masters-doctoral-thesis). It depends on [*pandoc*](http://pandoc.org/) to compile markdowns to tex files. 
#Getting Started
* Start writing your thesis in `markdown` directory, and name it as `ChapterX`, where `X` is the index of your chapter. 
Set chapter titles and chapter indices like this in the headers

	```
	
	---
	title: Introduction
	chapter: 1
	--- 
	
	```
* Uncomment the chapters you want to input in `main.tex` near `line 255`. (Sorry, you have to do it manually)
* Type `make` to compile your markdowns to generate PDF.
* Type `make clean` to clean compiled PDF and LaTeX files.

# Licence
According to the original work, MarkdownGradThesisTemplate is [Creative Commons licensed](http://creativecommons.org/licenses/by-nc-sa/3.0/)
