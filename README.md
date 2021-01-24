# Task

## Using pure Ruby without Rails
## Implement custom Validation module that:

1. Contains a class method validate. This method takes two arguments: attribute
name and options with validation types and rules. These are possible validation
types (you can implement your own as well):
o presence - requires an attribute to be neither nil nor an empty string.
Usage example:
**validate :name, presence: true**
o format - requires an attribute to match the passed regular expression.
Usage example:
**validate :number, format: /A-Z{0,3}/**
o type - requires an attribute to be an instance of the passed class.
Usage example:
**validate :owner, type: User**
2.
Contains an instance method validate! which runs all checks and validations,
that added to a class via the class method validate.In case of any mismatch it raises
an exception with a message that says what exact validation failed.
3.
Contains an instance method valid? that returns true if all validations pass
and false if there is any validation fail.
Include this module to your classes and demonstrate the validation usage.

`ruby run.rb`
