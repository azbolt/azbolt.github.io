# Methods defined in the helpers block are available in templates
module CustomTemplateHelpers
  def page_title
    current_page.data.title || data.site.title
  end

  def page_description
    current_page.data.description || data.site.description
  end

  def current_page_url
    "#{data.site.url}#{current_page.url}"
  end

  def page_url(page)
    "#{data.site.url}#{page.url}"
  end

  def page_twitter_card_type
    current_page.data.twitter_card_type || 'summary_large_image'
  end

  def page_image
    current_page_image = current_page.data.image
    image_url =
      if current_page_image
        image_path(current_page_image)
      else
        image_path('upstackstudio.png')
      end
    "#{data.site.url}/#{image_url}"
  end

  # Social share URLs
  def twitter_url
    "https://twitter.com/share?text=“#{page_title}”"\
    "&url=#{current_page_url}"\
    "&via=#{data.site.twitter_handle}"
  end

  def facebook_url
    "https://www.facebook.com/dialog/feed?app_id=#{data.site.facebook_app_id}"\
    "&caption=#{page_title}"\
    "&picture=#{page_image}"\
    "&name=“#{page_title}”"\
    "&description=#{page_description}"\
    '&display=popup'\
    "&link=#{current_page_url}"\
    "&redirect_uri=#{current_page_url}"
  end

  def google_plus_url
    "https://plus.google.com/share?url=#{current_page_url}"
  end

  def linkedin_url
    'http://www.linkedin.com/shareArticle?mini=true'\
    "&url=#{current_page_url}"\
    "&title=#{page_title}"\
    "&summary=#{page_description}"\
    "&source=#{data.site.url}"
  end
end
