#! /usr/bin/env ruby

require 'nokogiri'
require 'redcarpet'

options = {
  :autolink => true,
  :space_after_headers => true
}
renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
body_html = renderer.render(ARGF.read)
doc = Nokogiri::HTML(body_html)

style_node = Nokogiri::XML::Node.new("link", doc)
style_node['rel'] = "stylesheet"
style_node['type'] = "text/css"
style_node['href'] = "https://gist.github.com/andyferra/2554919/raw/2e66cabdafe1c9a7f354aa2ebf5bc38265e638e5/github.css"

doc.at_css('html') << style_node

puts doc.to_html
