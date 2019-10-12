class Message < ApplicationRecord
  attr_accessor :name, :email, :body, :phone_number
  validates :name, :email, :body, :phone_number, presence: true
end
