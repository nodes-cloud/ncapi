module NCApiCache
  @cached = {}

  def self.get
    return @cached
  end

  def self.set(key, val)
    @cached["#{key}"] = val
  end
end