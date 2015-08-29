class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  acts_as_votable

  validates_presence_of :title
  validates :body, presence: true, length: 2..300

end

