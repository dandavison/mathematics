BUILD_DIR:=.build
LATEXRUN:=latexrun --latex-args="-shell-escape" -W no-all --max-iterations 2 -O $(BUILD_DIR)
PDFLATEX:=pdflatex -shell-escape -file-line-error
RUBBER:=cd $(BUILD_DIR) && rubber -d --shell-escape
MAKE_PDF:=$(RUBBER)


all: *.pdf


%.pdf: %.tex
	$(MAKE_PDF) $*
	osascript -e 'tell application "Preview" to activate'
	osascript -e 'tell application "System Events" to key down command'
	osascript -e 'tell application "System Events" to key down "+"'
	osascript -e 'tell application "System Events" to key up "+"'
	osascript -e 'tell application "System Events" to key up command'
	osascript -e 'tell application "Emacs" to activate'


mathematics.pdf: *.tex


build:
	mkdir -p $(BUILD_DIR)
	cd $(BUILD_DIR) && ln -sf ../img
	cd $(BUILD_DIR) && ln -sf ../mathematics.sty
	cd $(BUILD_DIR) && for f in ../*.{tex,pdf}; do ln -sf $$f; done

