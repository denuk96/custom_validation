require './custom_validator.rb'
require 'byebug'

class User
  include CustomValidator
  attr_reader :email

  def initialize(args)
    @email = args[:email]
  end

  def valid?
    validate :email, presence: true
  end
end

user = User.new(email: 'bla', phone: '123')
user.valid?
