#! /usr/bin/env ruby
# This little script parses stdin or a file name and counts the words and your progress towards NanoWriMo.
# Author: Nat Welch (@icco)

TOTAL_WORDS = 50000
DAYS_IN_NOV = 30
WORDS_PER_DAY = 1667

def help
  puts <<-help
    Usage:
      $ wordcount.rb < file
      $ wordcount.rb file file2
  help
end

class Integer
  def nice
    return self.to_s.gsub(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1,")
  end
end

def count str
  date = Time.now
  count = str.split(/\S+/).size
  day = date.day
  needed = WORDS_PER_DAY * day
  remaining = needed - count
  month_rem = TOTAL_WORDS-count

  puts "#{date.strftime("%B %e, %Y")}:"
  puts "  Words typed:  #{count.nice}"
  puts "  Words needed: #{needed.nice}"
  puts "  Left Today:   #{remaining.nice}"
  puts "  Left Total:   #{month_rem.nice}"

  return count
end

# First off, let's show help some help if no arguments and tty
if ($stdin.tty? && ARGV.empty?) || ARGV.delete('-h') || ARGV.delete('--help')
  help
else
  # Well, lets read those files
  count(ARGF.read)
end
