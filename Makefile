outdir  = output

tex = latexmk -xelatex -outdir=$(outdir)

lectures = lecture1 lecture2 lecture3 

all: $(lectures)

$(lectures):
	cd tex/ && $(tex) $@_slide
	cp tex/$(outdir)/$@_slide.pdf pdf

$(lectures:=_note):
	cd tex/ && $(tex) $@
	cp tex/$(outdir)/$@.pdf pdf

note: $(lectures:=_note)
	pdfjam pdf/*_note.pdf --angle '90' --outfile pdf/plt.pdf
	rm pdf/*_note.pdf

clean:
	cd tex && latexmk -outdir=$(outdir) -C
