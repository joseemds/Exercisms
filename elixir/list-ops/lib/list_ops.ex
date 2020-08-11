defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer

  def count([]) do
    0
  end

  def count([head | tail]) do
    1 + count(tail)
  end

  defp do_reverse([], acc) do
    acc
  end

  defp do_reverse([head | tail], acc) do
    do_reverse(tail, [head | acc])
  end

  @spec reverse(list) :: list
  def reverse(l) do
    do_reverse(l, [])
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    for item <- l do
      f.(item)
    end
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    for item <- l, f.(item) do
      item
    end
  end

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce([], acc, f) do
    acc
  end

  def reduce([head | tail], acc, f) do
    f.(head, reduce(tail, acc, f))
  end

  @spec append(list, list) :: list
  def append(a, b) do
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
  end
end
