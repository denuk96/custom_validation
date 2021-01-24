require_relative './validation_processor.rb'

module CustomValidator
  module PublickMethods
    include ValidationProcessor

    def errors
      @errors ||= []
    end

    def validate!
      self.class.validators.each do |validator|
        check(validator[0], validator[1])
      end
      true
    end

    def valid?
      @errors = []
      self.class.validators.each do |validator|
        check(validator[0], validator[1], false)
        @errors.empty?
      end
    end
  end
end
