require_relative './publick_methods.rb'
require_relative './class_methods.rb'

module CustomValidator
  module Base
    include PublickMethods
    extend ClassMethods
  end
end
