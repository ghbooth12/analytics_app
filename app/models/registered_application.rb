class RegisteredApplication < ActiveRecord::Base
  belongs_to :user

  validates :name, length: { minimum: 1 }, presence: true
  validates :url, length: { minimum: 3 }, presence: true
end
