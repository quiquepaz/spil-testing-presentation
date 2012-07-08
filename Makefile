PROJECT=testing

all: clean compile

compile:
	pdflatex ${PROJECT}.tex

clean:
	rm -rf *.pdf *.log *.dvi *.out *.aux *.dvi *.nav *.snm *.toc *.ps
