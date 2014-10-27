all: commit

commit:
	@git add novel.md
	@git commit novel.* -m "`./wordcount.rb novel.md`"
	@git log -1
