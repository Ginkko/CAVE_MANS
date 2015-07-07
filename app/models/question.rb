class Question < ActiveRecord::Base
  attr_accessor :password
  belongs_to :user
  # has_many :answers

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :body, presence: true

end
