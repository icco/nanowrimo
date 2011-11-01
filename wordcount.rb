#! /usr/bin/env ruby
# This little script parses stdin or a file name and counts the words and your progress towards NanoWriMo.
# Author: Nat Welch (@icco)

WORDS_PER_DAY = 1667
DAYS_IN_NOV = 30

def help
  puts <<-help
    Usage:
      $ lessc < style.less
      $ lessc file1.less file2.less
  help
end

def count str
  date = Time.now
  count = str.split(/\S+/).size
  day = date.day
  needed = WORDS_PER_DAY * day
  remaining = needed - count

  puts "#{date.strftime("%B %e, %Y")}:"
  puts "  Words typed:  #{count}"
  puts "  Words needed: #{needed}"
  puts "  Left Today:   #{remaining}"

  return count
end

# First off, let's show help some help if no arguments and tty
if ($stdin.tty? && ARGV.empty?) || ARGV.delete('-h') || ARGV.delete('--help')
  help
else
  # Well, lets read those files
  count(ARGF.read)
end
