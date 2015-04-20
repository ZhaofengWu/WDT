class Reply
	include Mongoid::Document
	include Mongoid::Timestamps

	field :body, type: String, default: ""

	belongs_to :post
	belongs_to :user
	validates_presence_of :body
	validates_presence_of :post
	validates_presence_of :user

	after_create do
		self.post.inc(replies_count: 1)
	end

	after_destroy do
		self.post.inc(replies_count: -1)
	end
end