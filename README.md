Simple Ruby LRU Cache
=====================

## Approach

#### TDD the building of these key features:

- The cache should be able to contain data
- The cache should have a set method which takes two arguments, key and value.
- The set method should save the key and value into the cache container.
- The cache should have a get method which take one argument, key.
- The get method should return the value from that key.
- The cache should have a maximum length
- When at capacity the container should pop the last element when a new element is set.
- When an element is selected the element should be moved from it's current position to index 0.


## Structure


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


To use the cache class and see how it works open irb and require the app.rb file.

```
irb
require './app.rb'
```
```
cache = Cache.new
```
 - You will see the cache object which you can set and get data from with the public methods and see how the array data behaves:



**Cache methods**
```
  set
  get
```

## Screenshots
#### Running the App

![Running the App]()

#### Displaying the results
![Displaying the results]()


## Improvements

Given time to develop:
- Explore using a hash table to improve speed for large amounts of data
