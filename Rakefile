require 'bundler/gem_tasks'

require 'hpricot'
require 'yui/compressor'

desc 'Build layout'
task :layout do

  html_dir = 'lib/md2html/html/'

  # compressors
  js_compressor  = YUI::JavaScriptCompressor.new(:munge => true)
  css_compressor = YUI::CssCompressor.new

  # loading contents
  layout = Hpricot IO.read "#{html_dir}layout.html" 
  css    = css_compressor.compress IO.read "#{html_dir}bootstrap.css"
  css   += css_compressor.compress IO.read "#{html_dir}prettify.css"
  js     = js_compressor.compress  IO.read "#{html_dir}prettify.js"

  # appending css and js
  layout.at('style').inner_html  += css
  layout.at('script').inner_html += js

  # writing to file
  File.open("#{html_dir}layout.min.html", 'w'){ |f| f.write layout.to_html }
end
