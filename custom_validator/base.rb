require_relative './methods.rb'
require_relative './validation_processor.rb'

module CustomValidator
  module Base
    include ValidationProcessor
    extend ClassMethods

    def errors
      @errors ||= []
    end
  end
end
