require 'md2html'

module Md2html
  class CLI
    def self.start
      if ARGV.empty?
        puts "Instructions: \t md2html <file.md>"
      else
        Md2html::Parse.process_file ARGV.first
      end
    end
  end
end
