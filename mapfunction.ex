defmodule Arco do
  # Define your map function here
  '''
  When the list has only 1 item, calculate the item with the given function
  and replace the old item with the new calculated item
  '''
  def map(a_list, a_function) when length(a_list) <= 1 do
      a_list = List.replace_at(a_list, 0, a_function.(List.first(a_list)))
  end
  # When the list has more than 1 item
  def map(a_list, a_function) do
      a_list = List.replace_at(a_list, 0, a_function.(List.first(a_list)))
      [head | tail] = a_list
      a_list = Enum.take(a_list, 1) ++ map(tail, a_function)
  end
end

import ExUnit.Assertions

assert Arco.map([1], &(&1 + 2)) ==[3]
assert Arco.map([1, 2, 3], &(&1 + 1)) ==[2, 3, 4]
assert Arco.map([1, 2, 3], &(&1 * 2)) == [2, 4, 6]
assert Arco.map(["a", "b", "c"], &String.upcase/1) == ["A", "B", "C"]

IO.puts("All tests are passing!")
