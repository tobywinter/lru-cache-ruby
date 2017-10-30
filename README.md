Simple Ruby LRU Cache
=====================

## Approach

#### TDD the building of these key features:

- The cache should be able to contain data
- The cache should have a set method which takes two arguments, key and value.
- The set method should save the key and value into the cache container.
- The cache should have a get method which takes one argument, key.
- The get method should return the value from that key.
- The cache should have a maximum length
- When at capacity the container should pop the last element when a new element is set.
- When an element is selected the element should be moved from it's current position to index 0.

## To Run

- clone repository

```
git clone git@github.com:tobywinter/lru-cache-ruby.git
```
- run bundler

```
bundle install
```

Once in the lru-cache-ruby directory

- run the tests

```
rspec
```

## Usage

To use the cache class and see how it works open irb and require the app.rb file.

```
irb
require './app.rb'
```

E.g.
```
cache = Cache.new

cache.set(:a, 1)
// [[:a, 1]]
cache.set(:b, 2)
// [[:b, 2], [:a, 1]]

cache.get(:a)
// returns 1
// array order becomes [[:a, 1],[:b, 2]]

//if cache.container is [[:a, 1],[:b, 2][:c, 3][:d, 4][:e, 5]] and another is set while the MAX_LENGTH is 5
cache.set(:f, 6)
// [[:f, 6],[:a, 1],[:b, 2],[:c, 3],[:d, 4]]

```

**Cache methods**
```
  set(key, value)
  // sets [key, value] into an array ordered at position 0 by unshifting it to the start of the array

  get(key)
  // returns the value related to the key from the array
  // deletes the [key, value] from it's index position in the array
  // unshifts the [key, value] into position as most recently used at index 0 in the array.
```

## Improvements

- Explore using a hash table to improve speed for large amounts of data since traversing an array will get much slower with large amounts of data.
- In Ruby 1.9 Hash is ordered which would allow for a simple use of hash lookup and key setting in much the same way the array order is used to remember LRU information.
- Using array lookup syntax ```[](key)``` the set and get methods could be rewritten to be used much more fluidly in the context of the container being an ordered hash.

So in Ruby 1.9 a more efficient LRU cache could be achieved like this
```
class HashCache
  def initialize(max_size)
    @max_size = max_size
    @container = {}
  end

  def [](key)
    found = true
    value = @container.delete(key){ found = false }
    if found
      @container[key] = value
    else
      nil
    end
  end

  def []=(key,val)
    @container.delete(key)
    @container[key] = val
    if @container.length > @max_size
      @container.delete(@container.first[0])
    end
    val
  end
end

```
