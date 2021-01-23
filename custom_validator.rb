require './validation_methods'

module CustomValidator
  include ValidationMethods
  attr_accessor :errors

  def self.included(klass)
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
        сheck(validator[0], validator[1])
      end
    end
  end

  private

  def сheck field_name, validator, raise_error = true
    validator_name = validator.keys[0]
    valid_condition = validator[validator_name]
    field_value = get_field_value field_name
    valid_instance? field_name
    validator_exist? validator_name
    validating(field: field_name, method: validator_name, valid_condition: valid_condition, value: field_value)
  end

  def valid_instance? field_name
    raise "unknown instance #{field_name}" unless instance_variable_defined? "@#{field_name}"
  end

  def validator_exist? validator_name
    raise "unknown instance #{validator_name}" unless ValidationMethods.private_instance_methods.include? validator_name
  end

  def get_field_value field_name
    send field_name
  end

  def validating args, raise_error = true
    result_valid = send args[:method].to_s, args
    return if result_valid
    message = "#{args[:field]} is invalid, expected #{args[:method]} to mathing #{args[:valid_condition]}"
    raise_error ? raise(message) : self.errors << message
  end

  def errors
    @errors ||= []
  end
end
