page 'sitemap.html', layout: false
page 'sitemap.xml', layout: false
page 'feed.xml', layout: false
page '404.html', directory_index: false

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true

activate :automatic_image_sizes
activate :autoprefixer
activate :pry
activate :directory_indexes

activate :deploy do |deploy|
  deploy.method = :git
  deploy.branch = 'master'
  deploy.build_before = false
end

case ENV['TARGET'].to_s.downcase
when 'production'
  activate :deploy do |deploy|
    deploy.method = :git
    deploy.branch = 'master'
    deploy.build_before = false
  end
else
  activate :deploy do |deploy|
    deploy.method = :git
    deploy.remote = 'gh-pages'
    deploy.branch = 'gh-pages'
    deploy.build_before = false
  end
end

# Build-specific configuration
configure :build do
  activate :imageoptim
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :smusher
  activate :asset_host
  activate :gzip
  activate :minify_html
  activate :relative_assets
  activate :robots, rules: [
    { user_agent: '*', allow: ['/'] }
  ],
  sitemap: "#{data.site.url}/sitemap.xml"
end
