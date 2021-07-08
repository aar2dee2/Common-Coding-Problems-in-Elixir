
rows = IO.getn("Please enter the number of rows for the pascal triangle: ")

String.to_integer(rows) |> Pascal.pascal_triangle() |> IO.inspect()
# You can also write the above line as follows:
#IO.inspect(Pascal.pascal_triangle(String.to_integer(rows)))
