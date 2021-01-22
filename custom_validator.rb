require './validation_methods'

module CustomValidator
  include ValidationMethods

  def validate field_name, validator
    validator_name = validator.keys[0]
    valid_condition = validator[validator_name]
    field_value = get_field_value field_name
    valid_instance? field_name
    validator_exist? validator_name
    validating(field: field_name, method: validator_name, valid_condition: valid_condition, value: field_value)
  end

  private

  def valid_instance? field_name
    raise 'unknown instance' unless self.instance_variable_defined? "@#{field_name}"
  end

  def validator_exist? validator_name
    raise 'unknown validator' unless ValidationMethods.public_instance_methods.include? validator_name
  end

  def get_field_value field_name
    self.send field_name
  end

  def validating args, raise_error = true
    self.send method_name
  end
end
