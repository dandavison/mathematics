all: *.pdf

%.pdf: %.tex build
	cd build && \
	ln -sf ../$*.tex && \
	ln -sf ../$*.pdf && \
	rubber -d --shell-escape $*

mathematics.pdf: *.tex

build:
	mkdir -p build
	cd build && ln -sf ../img
	cd build && ln -sf ../mathematics.sty
	cd build && for f in ../*.{tex,pdf}; do ln -sf $$f; done
