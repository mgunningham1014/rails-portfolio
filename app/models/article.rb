class Article
	attr_accessor :title, :pub_date, :body

	def initialize(title, pub_date, body)
		@title = title
		@pub_date = pub_date
		@body = body
	end
end