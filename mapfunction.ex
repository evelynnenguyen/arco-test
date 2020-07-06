defmodule Arco do
  # Define your map function here
  def map(a_list, a_fucntion) do
    if length(a_list) >= 2 do
      IO.puts("list length is larger than 2")
    end
    else
      IO.puts("list length is smaller than 2")
    end
  end
end

import ExUnit.Assertions

assert Arco.map([1], &(&1 + 1)) ==[2]
assert Arco.map([1, 2, 3], &(&1 + 1)) ==[2, 3, 4]
assert Arco.map([1, 2, 3], &(&1 * 2)) == [2, 4, 6]
assert Arco.map(["a", "b", "c"], &String.upcase/1) == ["A", "B", "C"]

IO.puts("All tests are passing!")
