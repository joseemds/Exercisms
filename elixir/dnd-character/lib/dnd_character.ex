defmodule DndCharacter do
  @type t :: %__MODULE__{
          strength: pos_integer(),
          dexterity: pos_integer(),
          constitution: pos_integer(),
          intelligence: pos_integer(),
          wisdom: pos_integer(),
          charisma: pos_integer(),
          hitpoints: pos_integer()
        }

  defstruct ~w[strength dexterity constitution intelligence wisdom charisma hitpoints]a

  @spec modifier(pos_integer()) :: integer()
  def modifier(score) do
    score
    |> Kernel.-(10)
    |> Kernel./(2)
    |> floor()
  end

  @spec ability :: pos_integer()
  def ability do
    # list =
    #   for _ <- 1..4 do
    #     Enum.random(1..6)
    #   end

    1..4
    |> Enum.map(fn _ -> Enum.random(1..6) end)
    |> Enum.sort()
    |> Kernel.tl()
    |> Enum.sum()
  end

  @spec character :: t()
  def character do
    constitution = ability()

    %__MODULE__{
      strength: ability(),
      dexterity: ability(),
      constitution: constitution,
      intelligence: ability(),
      wisdom: ability(),
      charisma: ability(),
      hitpoints: 10 + modifier(constitution)
    }
  end
end
