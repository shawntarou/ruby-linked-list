class LinkedList
  @head = nil

  def append(value)
    new_node = Node.new(value)

    if @head.nil? 
      @head = new_node
      return
    end

    curr_node = @head

    until curr_node.next_node.nil?
      curr_node = curr_node.next_node
    end

    curr_node.next_node = new_node

    new_node.value
  end

  def prepend(value)
    new_node = Node.new(value)

    if @head.nil?
      @head = new_node
      return
    end

    new_node.next_node = @head
    @head = new_node

    @head.value
  end

  def size
    return 0 if @head.nil?

    size_count = 0
    curr_node = @head

    until curr_node.nil?
      size_count += 1
      curr_node = curr_node.next_node
    end

    size_count
  end

  def head
    return nil if @head.nil?

    @head.value
  end
  
  def tail
    return if @head.nil?

    curr_node = @head

    until curr_node.next_node.nil?
      curr_node = curr_node.next_node
    end

    curr_node.value
  end

  def at(index)
    if index+1 > self.size || index < 0 then return -1 end

    i = 0
    curr_node = @head

    until i == index
      curr_node = curr_node.next_node
      i += 1
    end

    curr_node.value
  end

  def pop
    return if @head.nil?

    curr_node = @head

    until curr_node.next_node.next_node.nil?
      curr_node = curr_node.next_node
    end

    pop_node = curr_node.next_node
    curr_node.next_node = nil

    pop_node.value
  end

  def contains?(value)
    return false if @head.nil?

    curr_node = @head

    until curr_node.nil?
      return true if curr_node.value == value
      curr_node = curr_node.next_node
    end

    return false
  end

  def find(value)
    return nil if @head.nil?

    curr_node = @head
    i = 0

    until curr_node.nil?
      return i if curr_node.value == value
      curr_node = curr_node.next_node
      i += 1
    end
    
    return nil
  end

  def to_s
    if @head == nil
      return
    end

    curr = @head

    until curr.nil? 
      print "( #{curr.value} ) -> "
      curr = curr.next_node
    end

    print 'nil'
  end

  def insert_at(value, index)
    return if @head.nil?

    if index == 0 
      return prepend(value) 
    end
    if index == self.size 
      return append(value) 
    end
    
    return if index+1 > self.size || index < 0

    new_node = Node.new(value)
    curr_node = @head
    i = 0

    until i+1 == index
      curr_node = curr_node.next_node
      i += 1
    end

    new_node.next_node = curr_node.next_node
    curr_node.next_node = new_node

    curr_node.value
  end

  def remove_at(index)
    return if @head.nil?
    return if index+1 > self.size || index < 0

    if index == 0 
      remove_node = @head
      @head = @head.next_node 
      return remove_node.value
    end

    curr_node = @head
    i = 0

    until i+1 == index
      curr_node = curr_node.next_node
      i += 1
    end

    remove_node = curr_node.next_node
    curr_node.next_node = curr_node.next_node.next_node

    remove_node.value
  end

  class Node
    attr_accessor :value, :next_node

    def initialize(value=nil)
      @value = value
      @next_node = nil
    end
  end
end 