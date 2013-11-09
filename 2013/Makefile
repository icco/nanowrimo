all: commit

commit: html
	@git add novel.md
	@git commit novel.md -m "`./wordcount.rb novel.md`"
	@git log -1

html:
	./html.rb novel.md > novel.html

clean:
	rm -v *pdf
