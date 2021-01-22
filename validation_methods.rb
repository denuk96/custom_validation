module ValidationMethods
  def presence
    byebug
    
    value = args[:value]
    react if value.nil? || value.empty?

  end
end
