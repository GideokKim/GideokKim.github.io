#!/usr/bin/env ruby
# frozen_string_literal: true

require 'yaml'

paths = YAML.load_file('_data/learning_paths.yml').fetch('paths')
category_pages = Dir['_pages/categories/*.md'].each_with_object({}) do |path, acc|
  text = File.read(path)
  permalink = text[/^permalink:\s*(.+)$/, 1]
  key = text[/site\.categories\[['"]([^'"]+)['"]\]/, 1]
  next unless permalink && key

  normalized = permalink.start_with?('/') ? permalink : "/#{permalink}"
  normalized = "#{normalized}.html" unless normalized.end_with?('/') || normalized.end_with?('.html')
  acc[key] = { path: path, url: normalized }
end

errors = []
paths.each do |learning_path|
  learning_path.fetch('categories').each do |category|
    name = category.fetch('name')
    url = category.fetch('url')
    page = category_pages[name]
    if page.nil?
      errors << "No category page renders category key #{name.inspect}"
      next
    end
    errors << "#{name}: data url #{url.inspect} does not match page url #{page[:url].inspect} (#{page[:path]})" unless url == page[:url]
  end
end

if errors.any?
  warn errors.join("\n")
  exit 1
end

puts "learning path links OK (#{paths.sum { |p| p.fetch('categories').size }} category links)"
