require './custom_validator/custom_validator.rb'

class User
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
valid_user = User.new(email: 'bla', number: '3011222', owner: owner)
invalid_user1 = User.new(email: '', number: '123', owner: owner)
invalid_user2 = User.new(email: 'bla@bla', number: 'invalid_namber', owner: 'invalid_type_of_owner')

p '================='
p 'validating valid_user'
p valid_user.validate!
p valid_user.valid?
p '================='

p '================='
p 'validating invalid_user1'
begin
  invalid_user1.validate!
rescue StandardError => e
  p "invalid_user1 raise: #{e}"
end
p invalid_user1.valid?
p "errors: #{invalid_user1.errors}"
p '================='

p '================='
p 'validating invalid_user2'
begin
  invalid_user2.validate!
rescue StandardError => e
  p "invalid_user2 raise: #{e}"
end
p invalid_user2.valid?
p "errors: #{invalid_user2.errors}"
p '================='
