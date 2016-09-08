# frozen_string_literal: true
dato.available_locales.each do |_locale|
  create_data_file 'site.yml', :yml, dato.site.to_hash

  directory 'posts' do
    dato.blog_posts.each do |post|
      create_post "#{post.slug}.md" do
        frontmatter :yaml, title: post.title
        content post.excerpt
      end
    end
  end

  add_to_data_file 'foobar.toml', :toml, sitename: dato.site.name
end
