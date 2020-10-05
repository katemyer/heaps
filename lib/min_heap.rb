class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap

  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: ? O(logn)
  # Space Complexity: ? O(1)
  def add(key, value = key)
    #pushing key value of node into the store array
    @store << HeapNode.new(key, value)
    # add
    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(logn)
  # Space Complexity: O(1)
  def remove()
    #set root to first element of the store array
    root = @store[0] 
    #swpap
    swap(0, @store.length - 1)
    # take it out
    @store.pop()
    #eventually remove 
    heap_down(0)
    return root.value
  end


  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
      
    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: O(1)
  # Space complexity: O(1)
  def empty?
    return @store.length == 0
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(logn)
  # Space complexity: O(1)
  def heap_up(index)
    if index == 0
      return
    end
    parent_index = ((index -1 )/2).floor()
    if @store[index].key < @store[parent_index].key
      swap(index, parent_index)
      heap_up(parent_index)
    end
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    if index >= @store.length
      return
    end

    left_child_index = (2 * index + 1)
    right_child_index = (2 * index + 2)

    if left_child_index >= @store.length
      return
    elsif right_child_index >= @store.length
      return
    end

    if @store[index].key > @store[left_child_index].key
      swap(index, left_child_index)
      heap_down(left_child_index)
    end
    if @store[index].key > @store[right_child_index].key
      swap(index, right_child_index)
      heap_down(right_child_index)
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end