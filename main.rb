class LinkedList 
  def initialize 
    @head = nil
    @tail = nil
  end

  def append value
    if @head == nil
      new_node = Node.new value, nil
      @head = new_node
    else
      temp = @head
      until temp.next_node == nil
        temp = temp.next_node
      end
      new_node = Node.new value, nil
      temp.next_node = new_node
    end
  end

  def iterate 
    temp = @head
    puts temp.value if temp.next_node == nil
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
# linked_list.iterate
linked_list.append(1)
linked_list.iterate
linked_list.append(2)
linked_list.iterate
linked_list.append(3)
linked_list.iterate