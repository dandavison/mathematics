BUILD_DIR:=.build
LATEXRUN:=latexrun --latex-args="-shell-escape" --max-iterations 1 -O $(BUILD_DIR)
PDFLATEX:=pdflatex -shell-escape -file-line-error


all: *.pdf


%.pdf: %.tex build
	cd $(BUILD_DIR) && \
	ln -sf ../$*.tex && \
	ln -sf ../$*.pdf && \
	$(PDFLATEX) $*


mathematics.pdf: *.tex


build:
	mkdir -p $(BUILD_DIR)
	cd $(BUILD_DIR) && ln -sf ../img
	cd $(BUILD_DIR) && ln -sf ../mathematics.sty
	cd $(BUILD_DIR) && for f in ../*.{tex,pdf}; do ln -sf $$f; done

