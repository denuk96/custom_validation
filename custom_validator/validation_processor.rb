require_relative './validators.rb'

module CustomValidator
  module ValidationProcessor
    include Validators

    private

    def check(field_name, validator, raise = true)
      validator_name = validator.keys[0]
      valid_condition = validator[validator_name]
      field_value = get_field_value field_name
      valid_instance? field_name
      validator_exist? validator_name
      validating(field: field_name, method: validator_name, valid_condition: valid_condition, value: field_value, raise: raise)
    end

    def valid_instance?(field_name)
      raise "unknown instance #{field_name}" unless instance_variable_defined? "@#{field_name}"
    end

    def validator_exist?(validator_name)
      raise "unknown validator #{validator_name}" unless Validators.private_instance_methods.include? validator_name
    end

    def get_field_value(field_name)
      send field_name
    end

    def validating(args)
      result_valid = send args[:method].to_s, args
      return if result_valid

      message = "#{args[:field]} is invalid, expected #{args[:method]} to matching #{args[:valid_condition]}"
      errors << message
      raise(message) if args[:raise]
    end
  end
end
