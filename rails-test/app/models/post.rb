class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  validates_presence_of :title
  field :body, type: String
  field :clicks, type: Integer, default: 0

  scope :hottest, proc { where(:clicks.gt  => 5).desc(:clicks)}

  field :replies_count, type: Integer, default: 0

  belongs_to :user
  has_many :replies, dependent: :destroy
  validates_presence_of :user
end