defmodule RobotSimulator.InputHandler do
  @valid_instruction ~w"R L A"
  def handle_input(instruction, _) when instruction not in @valid_instruction,
    do: {:error, "invalid instruction"}

  def handle_input("R", robot) do
  end

  def handle_input("L", robot) do
  end

  def handle_input("A", robot) do
  end
end
