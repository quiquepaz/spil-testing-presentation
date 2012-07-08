PROJECT=testing

all: clean compile

compile:
	rubber --pdf ${PROJECT}.tex

clean:
	rm -rf *.pdf *.log *.dvi *.out *.aux *.dvi *.nav *.snm *.toc *.ps
