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
    end
  end
end
