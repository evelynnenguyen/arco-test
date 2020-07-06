defmodule Arco do
  # Define your map function here
  def map(a_list, a_function) when length(a_list) <= 1 do
      IO.puts("list length is smaller or equal to 1")
      [head | tail] = a_list
      IO.puts(head)
      new_head = a_function.(head)
      IO.puts(new_head)
      List.replace_at(a_list, 1, new_head)
      IO.inspect a_list, charlists: :as_lists
  end
  def map(a_list, a_function) do
      IO.puts("list length is larger or equal to 2")
      [head | tail] = a_list
      map(tail, a_function)
  end
end

import ExUnit.Assertions

assert Arco.map([1], &(&1 + 2)) ==[3]
assert Arco.map([1, 2, 3], &(&1 + 1)) ==[2, 3, 4]
assert Arco.map([1, 2, 3], &(&1 * 2)) == [2, 4, 6]
assert Arco.map(["a", "b", "c"], &String.upcase/1) == ["A", "B", "C"]

IO.puts("All tests are passing!")
