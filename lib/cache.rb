class Cache

  attr_accessor :container

  MAX_LENGTH = 5

  def initialize
    @container = []
  end

  def set(key, value)
    if @container.length < MAX_LENGTH
      @container.unshift([key, value])
    else
      @container.pop
      @container.unshift([key, value])
    end
  end

  def get(key)
    i = 0
    while i < @container.length do
      if @container[i][0] == key
        return @container[i][1]
      end
      i +=1
    end
  end



end
