all: commit

commit:
	@git add novel.md
	@git commit novel.md -m "`./wordcount.rb novel.md`"
	@git log -1

clean:
	rm -v *pdf
