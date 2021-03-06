class PortfolioController < ApplicationController
  require 'json'
  require 'rss'
  require 'net/http'
  require 'open-uri'

  def home
    #@feed = JSON.parse(RSS::Parser.parse(open('https://medium.com/feed/@mandigunningham').read, false).items[0..2].to_json)

    http = Net::HTTP.get(URI.parse("https://medium.com/feed/@mandigunningham"))
    data = JSON.parse(Hash.from_xml(http).to_json)
    items = data['rss']['channel']['item']
    @articles = []
    count = 0
    i = 0
    while count < 3 do
      art = items[i]
      if art['category']
        desc = Nokogiri::HTML(art['description']).css('.medium-feed-snippet').text
        image = Nokogiri::HTML(art['description']).css('img').attribute('src').value
        datetime = DateTime.parse(art['pubDate'])
        date = datetime.strftime('%a, %b %d, %Y')
        @articles.push(Article.new(art['title'], date, desc, image, art['link']))
        count = count + 1
      end
      i = i + 1
    end
  end

  def about
    user_id = ENV["GR_USER_ID"]
    gr_key = ENV["GR_KEY"]
    @reading = []

    list = Net::HTTP.get(URI.parse("https://www.goodreads.com/review/list/" + user_id + ".xml?key=" + gr_key + "&shelf=currently-reading&v=2"))
    @books = JSON.parse(Hash.from_xml(list).to_json)#, object_class: OpenStruct)
    @reading = @books['GoodreadsResponse']['reviews']['review'].map { |bk| Book.new(bk['book']['title'], bk['book']['authors']['author']['name'], bk['book']['image_url']) }
  end

  def resume
  end

  def download_resume
    send_file(
      "#{Rails.root}/app/assets/public/MG_Resume2020.pdf",
      filename: "mandi_gunningham_resume2020.pdf",
      type: "application/pdf"
    )
  end

  def projects
  end

  def contact
  end
end
