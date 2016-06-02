tex = latexmk -pdf -outdir=output

lectures = lecture1 lecture2 lecture3 

all: $(lectures)

$(lectures):
	$(tex) output/$@_note.tex
	$(tex) output/$@_slide.tex
	cp output/$@_note.pdf output/$@_slide.pdf pdf
	

clean:
	cd output; latexmk -C
