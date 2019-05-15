class IntegerProperty < Property
  def getProp(val)
    tmp = IntegerValue.new
    tmp.property = self
    tmp.value = val
    tmp
  end
end
