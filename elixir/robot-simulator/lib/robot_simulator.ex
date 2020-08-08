defmodule RobotSimulator do
  defstruct [:direction, :position]

  @valid_directions ~w"north east south west"a
  @valid_instruction ~w"R L A"

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any

  def create(direction, _) when direction not in @valid_directions do
    {:error, "invalid direction"}
  end

  def create(_, position) when not is_tuple(position) do
    {:error, "invalid position"}
  end

  def create(_, position) when tuple_size(position) !== 2 do
    {:error, "invalid position"}
  end

  def create(_, {x, y}) when not is_integer(x) or not is_integer(y) do
    {:error, "invalid position"}
  end

  def create(direction \\ :north, position \\ {0, 0}) do
    %RobotSimulator{direction: direction, position: position}
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    instructions
    |> String.codepoints()
    |> handle_input
  end

  defp handle_input(instruction) when instruction not in @valid_instruction,
    do: {:error, "invalid instruction"}

  defp handle_input("R") do
  end

  defp handle_input("L") do
  end

  defp handle_input("A") do
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(robot) do
    Map.get(robot, :direction)
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(robot) do
    Map.get(robot, :position)
  end
end
