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
    until temp.next_node == nil
      temp = temp.next_node
      size += 1
    end
    size += 1
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

  def iterate 
    puts "head : #{@head.value}"
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
p linked_list.at(4)

# linked_list.prepend 3
# linked_list.iterate
# linked_list.prepend 2
# linked_list.iterate
# linked_list.prepend 1
# linked_list.iterate

# linked_list.append 1
# linked_list.iterate
# linked_list.append 2
# linked_list.iterate
# linked_list.append 3
# linked_list.iterate