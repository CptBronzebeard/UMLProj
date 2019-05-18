class StringProperty < Property
  def getProp(val)
    tmp = StringValue.new
    tmp.property = self
    tmp.value = val
    tmp.type=tmp.class.name
    tmp
  end
end
