all:
	@git add novel.md
	@git commit novel.md -m "`echo "Novel Progress...\n" && ./wordcount.rb novel.md`"
