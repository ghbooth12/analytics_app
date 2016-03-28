class RegisteredApplication < ActiveRecord::Base
  belongs_to :user
  has_many :events, dependent: :destroy

  validates :name, length: { minimum: 1 }, presence: true
  validates :url, length: { minimum: 3 }, presence: true
end
