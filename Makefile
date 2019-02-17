BUILD_DIR:=.build
LATEXRUN:=latexrun --latex-args="-shell-escape" -W no-all -O $(BUILD_DIR)
PDFLATEX:=cd $(BUILD_DIR) && pdflatex -shell-escape -file-line-error
RUBBER:=cd $(BUILD_DIR) && rubber -d --shell-escape
MAKE_PDF:=$(LATEXRUN)


all: *.pdf


%.pdf: %.tex
	$(MAKE_PDF) $*
	# osascript -e 'tell application "Skim" to activate'
	# osascript -e 'tell application "Emacs" to activate'


mathematics.pdf: *.tex


build:
	mkdir -p $(BUILD_DIR)
	cd $(BUILD_DIR) && ln -sf ../img
	cd $(BUILD_DIR) && ln -sf ../mathematics.sty
	cd $(BUILD_DIR) && for f in ../*.{tex,pdf}; do ln -sf $$f; done

