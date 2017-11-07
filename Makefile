all: notes linear-algebra-oxford-A0 differential-equations-oxford-A1 iulm questions

notes:
	cd build && rubber -d --shell-escape notes.tex

iulm:
	cd build && rubber -d --shell-escape iulm.tex

linear-algebra-oxford-A0:
	cd build && rubber -d --shell-escape linear-algebra-oxford-A0.tex

differential-equations-oxford-A1:
	cd build && rubber -d --shell-escape differential-equations-oxford-A1.tex

questions:
	cd build && rubber -d --shell-escape questions.tex
