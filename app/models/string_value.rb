class StringValue < PropertyValue
  def comp(tmp)
    value == tmp
    #PropertyValue.all.find_by(Value: tmp)
  end
end
