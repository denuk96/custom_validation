module CustomValidator
  module Methods
    private

    def presence(args)
      is_present = args[:value].nil? || args[:value].empty?
      is_present != args[:valid_condition]
    end

    def format(args)
      regex = args[:valid_condition]
      !!regex.match(args[:value])
    end

    def type(args)
      args[:value].class == args[:valid_condition]
    end
  end
end
