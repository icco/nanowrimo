#! /usr/bin/env ruby
#
# This little script parses stdin or a file name and counts the words and your progress towards NanoWriMo.
#
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

# Puts commas in integers. Stolen from Rails:
# http://api.rubyonrails.org/classes/ActionView/Helpers/NumberHelper.html
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
  perdayn = month_rem/(DAYS_IN_NOV-day)
  perday = count/day

  puts "#{date.strftime("%B %e, %Y")}: #{count.nice} / #{TOTAL_WORDS.nice}"
  puts ""
  puts "  Count:  #{count.nice}"
  puts "  Today:  #{remaining.nice} of #{needed.nice} remaining."
  puts "  Total:  #{month_rem.nice} of #{TOTAL_WORDS.nice} remaining."
  puts "  WPDN:   #{perdayn.nice} (words per day needed to finish on time)."
  puts "  WPD:    #{perday.nice} (current words per day)."
  puts ""

  return count
end

# First off, let's show help some help if no arguments and tty
if ($stdin.tty? && ARGV.empty?) || ARGV.delete('-h') || ARGV.delete('--help')
  help
else
  # Well, lets read those files
  count(ARGF.read)
end
