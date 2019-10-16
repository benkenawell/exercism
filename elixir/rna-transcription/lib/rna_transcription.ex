defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    loop(dna, '')
  end
  
  def loop(pre, post) do
    case pre do
      [head | tail] -> loop(tail, post ++ rotate(head))
      [] -> post     
    end
  end

  def rotate(letter) do
    case to_charlist([letter]) do
      'A' -> 'U'
      'C' -> 'G'
      'T' -> 'A'
      'G' -> 'C'
    end
  end

end
