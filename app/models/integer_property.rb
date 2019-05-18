class IntegerProperty < Property
  def getProp(val)
    tmp = IntegerValue.new
    tmp.property = self
    tmp.value = val
    tmp.type=tmp.class.name
    tmp
  end
end
