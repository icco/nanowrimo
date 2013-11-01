all: commit

commit:
	@git add novel.md
	@git commit novel.md -m "`echo "Novel Progress...\n" && ./wordcount.rb novel.md`"
	@git log -1

# gem install kramdown
# sudo aptitude install wkhtmltopdf
pdf:
	kramdown --entity-output numeric novel.md | wkhtmltopdf -b - novel.pdf

clean:
	rm -v *pdf
