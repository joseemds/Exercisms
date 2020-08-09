defmodule RobotSimulator.InputHandler do
  @valid_instruction ~w"R L A"

  defguard is_valid_instruction(instruction) when instruction in @valid_instruction

  def handle_input(robot, []), do: robot

  def handle_input(robot, [instruction | remaining_instructions])
      when is_valid_instruction(instruction) do
    robot |> update_direction(instruction) |> handle_input(remaining_instructions)
  end

  def handle_input(_, _), do: {:error, "invalid instruction"}

  defp update_direction(robot, "R") do
    case robot.direction do
      :north -> %{robot | direction: :east}
      :east -> %{robot | direction: :south}
      :south -> %{robot | direction: :west}
      :west -> %{robot | direction: :north}
      _ -> "Invalid"
    end
  end

  defp update_direction(robot, "L") do
    case robot.direction do
      :north -> %{robot | direction: :west}
      :east -> %{robot | direction: :north}
      :south -> %{robot | direction: :east}
      :west -> %{robot | direction: :south}
      _ -> "Invalid"
    end
  end

  defp update_direction(robot, "A") do
    case robot.direction do
      :north -> %{robot | position: update_position(robot, :north)}
      :east -> %{robot | position: update_position(robot, :east)}
      :south -> %{robot | position: update_position(robot, :south)}
      :west -> %{robot | position: update_position(robot, :west)}
      _ -> "Invalid"
    end
  end

  defp update_position(%RobotSimulator{position: {x, y}}, :north), do: {x, y + 1}

  defp update_position(%RobotSimulator{position: {x, y}}, :south), do: {x, y - 1}

  defp update_position(%RobotSimulator{position: {x, y}}, :east), do: {x + 1, y}

  defp update_position(%RobotSimulator{position: {x, y}}, :west), do: {x - 1, y}
end
