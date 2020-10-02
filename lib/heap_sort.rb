

# This method uses a heap to sort an array.
# Time Complexity:  ? n log(n)
# Space Complexity: ? O(n)
def heapsort(list)
  # raise NotImplementedError, "Method not implemented yet..."
  #initialize
  heap_sort = MinHeap.new()
  #loop through list
  list.each do |number|
    # add values into new heap
    heap_sort.add(number, number)
  end
  #create a new array that will be sorted
  sorted_array = Array.new
  #until the heap is empty
  until heap_sort.empty?
    #push values into sorted array while removing from heap
    sorted_array << heap_sort.remove
  end
end