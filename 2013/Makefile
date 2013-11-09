all: commit

commit: html
	@git add novel.md
	@git commit novel.* -m "`./wordcount.rb novel.md`"
	@git log -1

html:
	@./html.rb novel.md > novel.html
	@git add novel.html

clean:
	@rm -fv *pdf *html
