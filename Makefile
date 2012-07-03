PROJECT=testing

all: clean compile

compile:
	latex ${PROJECT}.tex && dvips -t a4 ${PROJECT}.dvi && ps2pdf ${PROJECT}.ps
clean:
	rm -rf *.pdf *.log *.dvi *.out *.aux *.dvi *.nav *.snm *.toc *.ps
