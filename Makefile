tex = latexmk -pdfxe # -outdir="./output"

lectures = lecture0 lecture1 lecture2 lecture3 

all: $(lectures)

$(lectures):
#	$(tex) $@_note.tex
#	mv $@_note.pdf pdf
	$(tex) $@_slide.tex
	mv $@_slide.pdf pdf

clean:
	latexmk -C
