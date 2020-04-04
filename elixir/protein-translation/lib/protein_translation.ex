defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    rna
    |> String.graphemes # split apart the word into letters
    |> Enum.chunk_every(3) # group each codon
    |> Enum.map(fn codon_list -> Enum.join(codon_list) |> of_codon end)
    |> Enum.split_with(fn {a, _} -> a == :ok end)
    |> check_error
  end

  @spec check_error({list({:ok, String.t()}), list({:error, String.t()})}) :: list({atom, String.t()})
  def check_error({acid_list, error_list}) do
    if length(error_list) > 0 do
      {:error, "invalid RNA"}
    else
      codon_list = acid_list
        |> Enum.take_while(fn {:ok, x} -> x != "STOP" end)
        |> Enum.map(fn {:ok, x} -> x end)
      {:ok, codon_list}
    end
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    case codon do
      "UGU" <> _ -> {:ok, "Cysteine"}
      "UGC" <> _ -> {:ok, "Cysteine"}
      "UUA" <> _ -> {:ok, "Leucine"}
      "UUG" <> _ -> {:ok, "Leucine"}
      "AUG" <> _ -> {:ok, "Methionine"}
      "UUU" <> _ -> {:ok, "Phenylalanine"}
      "UUC" <> _ -> {:ok, "Phenylalanine"}
      "UCU" <> _ -> {:ok, "Serine"}
      "UCC" <> _ -> {:ok, "Serine"}
      "UCA" <> _ -> {:ok, "Serine"}
      "UCG" <> _ -> {:ok, "Serine"}
      "UGG" <> _ -> {:ok, "Tryptophan"}
      "UAU" <> _ -> {:ok, "Tyrosine"}
      "UAC" <> _ -> {:ok, "Tyrosine"}
      "UAA" <> _ -> {:ok, "STOP"}
      "UAG" <> _ -> {:ok, "STOP"}
      "UGA" <> _ -> {:ok, "STOP"}
      x -> {:error, "invalid codon"}
    end
  end
end
