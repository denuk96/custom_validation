require_relative './validators.rb'
require_relative './publick_methods.rb'

module CustomValidator
  module Base
    include PublickMethods
    extend ClassMethods
  end
end
