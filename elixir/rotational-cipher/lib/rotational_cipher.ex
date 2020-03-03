defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
  	String.codepoints(text) |> Enum.map(&(rotate_char(&1, shift))) |> Enum.join("")
  end

	def rotate_char(<<ch>>, shift) do
		case ch do
			x when x > 64 and x < 91 -> <<rem(ch - 64 + shift,26) + 64>>
			x when x > 96 and x < 123 -> <<rem(ch - 97 + shift,26) + 97>>
			x -> <<x>>
		end
	end

end
