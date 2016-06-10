tex = latexmk -pdf -outdir=output

lectures = lecture0 lecture1 lecture2 lecture3 

all: $(lectures)

$(lectures):
	$(tex) $@_note.tex
	$(tex) $@_slide.tex
	cp output/$@_note.pdf output/$@_slide.pdf pdf
	

clean:
	cd output; latexmk -C
