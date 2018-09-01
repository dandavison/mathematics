BUILD_DIR:=.build
LATEXRUN:=latexrun --latex-args="-shell-escape" -W no-all --max-iterations 2 -O $(BUILD_DIR)
PDFLATEX:=pdflatex -shell-escape -file-line-error


all: *.pdf


%.pdf: %.tex
	$(LATEXRUN) $*


mathematics.pdf: *.tex


build:
	mkdir -p $(BUILD_DIR)
	cd $(BUILD_DIR) && ln -sf ../img
	cd $(BUILD_DIR) && ln -sf ../mathematics.sty
	cd $(BUILD_DIR) && for f in ../*.{tex,pdf}; do ln -sf $$f; done

