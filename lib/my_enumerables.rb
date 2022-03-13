module Enumerable
  def my_all?
    self.my_each do |item|
      return false unless yield(item)
    end

    true
  end

  def my_any?
    self.my_each do |item|
      return true if yield(item)
    end

    false
  end

  def my_count
    return self.length unless block_given?

    count = 0

    self.my_each do |item|
      count += 1 if yield(item)
    end

    count
  end

  def my_inject(value = 0)
    self.my_each do |item|
      value = yield(value, item)
    end

    value
  end

  def my_map
    return self.dup unless block_given?

    new_arr = []

    self.my_each do |item|
      new_arr << yield(item)
    end

    new_arr
  end

  def my_none?
    self.my_each do |item|
      return false if yield(item)
    end

    true
  end

  def my_select
    new_arr = []

    self.my_each do |item|
      new_arr << item if yield(item)
    end

    new_arr
  end
end



# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end

    self
  end

  def my_each_with_index
    i = 0
    while i < self.length
      yield(self[i], i)
      i += 1
    end

    self
  end
end
