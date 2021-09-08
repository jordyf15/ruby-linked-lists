class LinkedList 
  def initialize 
    @head = nil
    @tail = nil
  end

  def append value
    if @head == nil
      new_node = Node.new value, nil
      @head = new_node
      @tail = new_node
    else
      temp = @head
      until temp.next_node == nil
        temp = temp.next_node
      end
      new_node = Node.new value, nil
      @tail = new_node
      temp.next_node = new_node
    end
  end

  def prepend value
    if @head == nil
      new_node = Node.new value, nil
      @head = new_node
      @tail = new_node
    else
      temp = @head
      new_node = Node.new value, temp
      @head = new_node
    end
  end

  def size
    temp = @head
    size = 0
    return 0 if temp == nil
    until temp == nil
      size+=1
      temp=temp.next_node
    end
    size
  end

  def head 
    @head
  end

  def tail
    @tail
  end

  def at index
    temp = @head
    return nil if temp == nil
    return temp if index == 0
    (index).times do |idx|
      return nil if temp.next_node == nil
      temp = temp.next_node
    end 
    temp
  end

  def pop
    if @head == @tail
      @head = nil
      @tail = nil
      return
    end
    temp = @head
    until temp.next_node == @tail
      temp = temp.next_node
    end
    @tail = temp
    @tail.next_node = nil
  end

  def contains? value
    temp = @head
    contain = false
    return false if temp == nil
    until temp == nil
      contain = true if temp.value == value
      temp = temp.next_node
    end
    contain
  end
  
  def find value
    return nil if contains?(value) == false
    temp = @head
    index = 0 
    until temp == nil
      return index if temp.value == value
      index += 1
      temp = temp.next_node
    end
  end

  def to_s
    temp = @head
    str = ""
    until temp == nil
      str += "( #{temp.value} )"
      str += " -> " unless temp.next_node == nil
      str += " -> nil" if temp.next_node == nil
      temp = temp.next_node
    end
    puts str
  end

  def iterate 
    puts "head : #{@head.value}"
    puts "tail : #{@tail.value}"
    temp = @head
    if temp.next_node == nil
      puts temp.value 
      puts "\n"
      return
    end
    until temp.next_node == nil
      puts temp.value
      temp = temp.next_node
    end
    puts temp.value
    puts "\n"
  end
end

class Node
  attr_accessor :value, :next_node
  def initialize value, next_node = nil
    @value = value
    @next_node = next_node
  end
end

linked_list = LinkedList.new
linked_list.append 1
linked_list.append 2
linked_list.append 3
linked_list.append 4
linked_list.to_s
linked_list.pop
linked_list.to_s
linked_list.prepend 99
linked_list.to_s