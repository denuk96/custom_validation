require './custom_validator.rb'
require 'byebug'

class User
  extend CustomValidator
  include CustomValidator
  attr_accessor :email, :number, :owner

  validate :email, presence: true
  validate :number, format: /^\d{1,45}$/
  validate :owner, type: User

  def initialize(args)
    @email = args[:email]
    @number = args[:number]
    @owner = args[:owner]
  end
end

owner = User.new(email: 'bla2')
user = User.new(email: 'bla', number: '3011222', owner: owner)
user.validate!
p '123'
