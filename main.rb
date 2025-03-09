require_relative 'linkedlist.rb'

list = LinkedList.new

list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')

puts list
# puts list.size
# puts list.head
# puts list.tail
# puts list.at(2)

list.insert_at('elephant', 0)
puts list
puts list.remove_at(5)
puts list


list2 = LinkedList.new

list2.append('elephant')

