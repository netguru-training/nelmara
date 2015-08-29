class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  default_scope { order(created_at: :desc) }

  acts_as_votable
  acts_as_taggable
  attr_accessor :tags

  mount_uploader :image, ImageUploader

  validates_presence_of :title
  validates :body, presence: true, length: 2..300

  def total_votes
    votes_for.up.size - votes_for.down.size
  end
end

