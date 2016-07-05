tex = latexmk -pdf -outdir="./output"

lectures = lecture0 lecture1 lecture2 lecture3 

all: $(lectures)

$(lectures):
	$(tex) $@_note.tex
	cp output/$@_note.pdf pdf
	

clean:
	cd output; latexmk -C
