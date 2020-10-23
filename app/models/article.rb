class Article
	attr_accessor :title, :pub_date, :body, :image_url, :link

	def initialize(title, pub_date, body, image_url, link)
		@title = title
		@pub_date = pub_date
		@body = body
		@image_url = image_url
		@link = link
	end
end