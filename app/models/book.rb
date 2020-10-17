class Book
	attr_accessor :title, :author, :image_url

	def initialize(title, author, image)
		@title = title
		@author = author
		@image_url = image
	end
end