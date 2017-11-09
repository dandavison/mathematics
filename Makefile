all: *.pdf

%.pdf: %.tex build
	cd build && \
	ln -sf ../$*.tex && \
	ln -sf ../$*.pdf && \
	rubber -d --shell-escape $*

notes.pdf: *.tex

build:
	mkdir -p build
	cd build && ln -sf ../img
	cd build && ln -sf ../oxford.sty
	cd build && ln -sf ../notes.sty
	cd build && for f in ../*.tex; do ln -sf $$f; done
