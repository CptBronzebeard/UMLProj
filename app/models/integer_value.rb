class IntegerValue < PropertyValue
  def comp(tmp)
    value.to_i < tmp
    #PropertyValue.all.select{|e| e.value.to_i < tmp}
  end
end
