defmodule Canvas do
  def new(contents) do
    """
    <svg
      width="100" height="200"
      xmlns="http://www.w3.org/2000/svg">
      #{draw(contents)}
    </svg>
    """
    |> Kino.Image.new(:svg)
  end

  def draw({row, col}) do
    x = (col - 1) * 10
    y = (row - 1) * 10
    width = 10

    ~s[<rect x="#{x}" y="#{y}" width="#{width}" height="#{width}" fill="black" />]
  end

  def draw(points) when is_list(points) do
    points
    |> Enum.map(&draw/1)
    |> Enum.join("\n")
  end
end
