class List < ActiveRecord::Base
  belongs_to :user
  belongs_to :song
  has_many :songs
  has_many :users
end
