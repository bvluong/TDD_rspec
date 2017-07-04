# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}

def add_two_numbers(l1, l2)
    node = l1
    node2 = l2
    arr1 = []
    arr2 = []
    until node == nil && node2 == nil
        if node
            arr1.unshift(node.val)
            node = node.next
        end
        if node2
            arr2.unshift(node2.val)
            node2 = node2.next
        end
    end
    p arr1
    p arr2
    answer = arr1.join("").to_i + arr2.join("").to_i
    ans_arr = answer.to_s.reverse.split("")
    l3 = ListNode.new(ans_arr[0].to_i)
    node = l3
    ans_arr.drop(1).each do |val|
        node.next = ListNode.new(val.to_i)
        node = node.next
    end
    return l3
end
