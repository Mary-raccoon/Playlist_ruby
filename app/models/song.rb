class Song < ActiveRecord::Base
  # belongs_to :user
  # has_many :users, through: :lists
  has_many :lists

  validates :artist, :title, presence: true, length: { :in => 2..50 }
end
