outdir  = output

tex = latexmk -xelatex -outdir=$(outdir)

lectures = lecture1 lecture2 lecture3 

all: $(lectures)

$(lectures):
#	$(tex) $@_note.tex
#	mv $@_note.pdf pdf
	cd tex/ && $(tex) $@_slide
	cp tex/$(outdir)/$@_slide.pdf pdf

clean:
	latexmk -outdir=$(outdir) -C
