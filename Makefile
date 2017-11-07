all: *.pdf

%.pdf: %.tex build
	cd build && \
	ln -sf ../$*.tex && \
	ln -sf ../$*.pdf && \
	rubber -d --shell-escape $*

build:
	mkdir -p build
	cd build && ln -s ../img
	cd build && ln -s ../oxford.sty
	cd build && ln -s ../notes.sty
