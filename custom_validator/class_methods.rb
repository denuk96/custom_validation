module CustomValidator
  module ClassMethods
    def included(klass)
      klass.class_eval do
        define_singleton_method :validate do |field_name, validator|
          @validators ||= {}
          @validators[field_name] = validator
        end

        define_singleton_method :validators do
          @validators || {}
        end
      end

      klass.define_method :validate! do
        klass.validators.each do |validator|
          check(validator[0], validator[1])
        end
        true
      end

      klass.define_method :valid? do
        @errors = []
        klass.validators.each do |validator|
          check(validator[0], validator[1], false)
        end
        @errors.empty?
      end
    end
  end
end
