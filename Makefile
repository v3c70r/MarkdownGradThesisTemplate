
LATEXMK=latexmk
LATEXMKOPT=-pdf -output-directory=./build -pdflatex="pdflatex -interaction=nonstopmode" -use-make

PANDOC=pandoc
PANDOC_TEMPLATE=./markdown/chapterTemplate.tex
PANDOCOP=--template=$(PANDOC_TEMPLATE)

MD_SOURCE = $(shell find ./markdown -type f -name "*.md")
TEX_SOURCE = $(subst markdown,Chapters, $(subst md,tex, $(MD_SOURCE)))

print-%  : ; @echo $* = $($*)		#Print var



MAIN=main
FIGURES := $(shell find figures/* -type f)

all: ./build/$(MAIN).pdf

./build/$(MAIN).pdf: $(MAIN).tex $(TEX_SOURCE)
	$(LATEXMK) $(LATEXMKOPT)  $(MAIN).tex

./Chapters/%.tex : ./markdown/%.md 
	$(PANDOC) $(PANDOCOP) -o $@ $<


#
#.refresh:
#    touch .refresh
#
#$(MAIN).pdf: $(MAIN).tex .refresh $(SOURCES) $(FIGURES)
#        $(LATEXMK) $(LATEXMKOPT) $(CONTINUOUS) \
#            -pdflatex="$(LATEX) $(LATEXOPT) $(NONSTOP) %O %S" $(MAIN)
#
#force:
#        touch .refresh
#        rm $(MAIN).pdf
#        $(LATEXMK) $(LATEXMKOPT) $(CONTINUOUS) \
#            -pdflatex="$(LATEX) $(LATEXOPT) %O %S" $(MAIN)
#
clean:
	$(LATEXMK) -C $(MAIN)
	rm -f $(MAIN).pdfsync
	rm -rf *~ *.tmp
	rm build/*
	rm Chapters/*.tex

#once:
#        $(LATEXMK) $(LATEXMKOPT) -pdflatex="$(LATEX) $(LATEXOPT) %O %S" $(MAIN)
#
#debug:
#        $(LATEX) $(LATEXOPT) $(MAIN)
#
.PHONY: clean all
