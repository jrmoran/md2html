require 'rdiscount'
require 'hpricot'
require 'md2html/version'

module Md2html
  class Parse

    def self.process_file file_name
      if file_name and File.exist? file_name
        html = RDiscount.new( IO.read file_name ).to_html
        document = Hpricot html
        document.search('pre'){ |e|
          e.inner_html = e.search('code').inner_html
          e.set_attribute 'class', 'prettyprint'
        }
        save File.basename(file_name, '.md'), document.to_html
      else
        puts "Error: file doesn't exists"
      end
    end

    def self.save title, body
      script_dir = File.dirname(__FILE__)
      template   = Hpricot IO.read "#{script_dir}/md2html/html/layout.min.html"
      template.at('title').inner_html = title.capitalize
      template.at('#content').inner_html = body

      File.open("#{title}.html", 'w') {|f| f.write(template.to_html) }
      puts "changes saved to #{title}.html"
    end

    # This processes code using CodeRay
    def process_code text
      # the first line is the lang identifier
      lang = text.lines.first.scan(/^#!+[\s+]?(\w+)/).flatten.first

      # if found remove first line from text
      if lang
        lang.downcase!
        text = text.lines.to_a[1..-1].join
      else
        lang = 'text'
      end

      # highlight and put into a `div` element
      html = CodeRay.scan(text, lang).div(:css => :class)
    end

  end
end
