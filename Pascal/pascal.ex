defmodule Pascal do
  @moduledoc"""
  Code for generating a Pascal triangle as a list of lists when the number of rows in the triangle is passed as an input to the function.

  By: Sam
  Date: July 6, 2021
  """

  @vsn 0.1

  @doc"""
  The pascal_triangle function takes a positive integer as input and returns a list where each element is a list representing a row of the pascal triangle and the number of elements is equal to the input provided by the user.

  ## Examples
  
      pascal_triangle(1) returns [[1]]
      pascal_triangle(2) returns [[1], [1,1]]
      pascal_triangle(3) returns [[1], [1,1], [1,2,1]]

  Each element of the pascal triangle is sum of the corresponding element and previous element in the previous row. i.e. the 2nd element in the third row will be the sum of the 1st and 2nd elements in the second row and so on.
  """
  @spec pascal_triangle(integer()) :: list()
  def pascal_triangle(num) when num>=1 do
    pascal_recursion(1, num, [[1]])
  end

  def pascal_triangle(_num) do
    IO.puts("Please enter a positive integer.")
  end

  def pascal_recursion(counter, num, list) when counter< num do
    #IO.puts("The current final list is")
    #IO.inspect(list)
    new_row_length = counter + 1
    [previous_row | _tail] = list
    #IO.puts("current counter is #{counter}")
    #IO.puts("The previous row currently is")
    #IO.inspect(previous_row)
    new_row = row_creator(0, new_row_length, previous_row, [])
    #IO.puts("the new row currently is")
    #IO.inspect(new_row)
    new_list = [new_row] ++ list
    pascal_recursion(counter + 1, num, new_list)
  end

  def pascal_recursion(_counter, _num, list) do
    list |> Enum.reverse()
  end

  def row_creator(element, row_length, previous_row, new_row) when element<=row_length-1 do
    n1 = cond do
      element<1 -> 0
      element>=1 -> Enum.at(previous_row, element-1)
    end
    #IO.puts("n1 is #{n1}")
    
    n2 = cond do
      element<=row_length-2 -> Enum.at(previous_row, element)
      element>row_length-2 -> 0
    end
    
    #IO.puts("n2 is #{n2}")
    new_elem = n1 + n2
    updated_row = new_row ++ [new_elem]
    row_creator(element+1, row_length, previous_row, updated_row)
    
  end

  def row_creator(_element, _row_length, _previous_row, new_row) do
    new_row
  end

end
