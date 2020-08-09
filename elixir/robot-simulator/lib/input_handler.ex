defmodule RobotSimulator.InputHandler do
  @valid_instruction ~w"R L A"

  def handle_input(robot, []), do: robot

  def handle_input(robot, [instruction | remaining_instructions])
      when instruction in @valid_instruction do
    robot |> update_direction(instruction) |> handle_input(remaining_instructions)
  end

  def handle_input(_, _), do: {:error, "invalid instruction"}

  defp update_direction(robot, "R") do
    case robot.direction do
      :north -> Map.put(robot, :direction, :east)
      :east -> Map.put(robot, :direction, :south)
      :south -> Map.put(robot, :direction, :west)
      :west -> Map.put(robot, :direction, :north)
      _ -> "Invalid"
    end
  end

  defp update_direction(robot, "L") do
    case robot.direction do
      :north -> Map.put(robot, :direction, :west)
      :east -> Map.put(robot, :direction, :north)
      :south -> Map.put(robot, :direction, :east)
      :west -> Map.put(robot, :direction, :south)
      _ -> "Invalid"
    end
  end

  defp update_direction(robot, "A") do
    case robot.direction do
      :north -> Map.put(robot, :position, update_position(robot, :north))
      :east -> Map.put(robot, :position, update_position(robot, :east))
      :south -> Map.put(robot, :position, update_position(robot, :south))
      :west -> Map.put(robot, :position, update_position(robot, :west))
      _ -> "Invalid"
    end
  end

  defp update_position(%RobotSimulator{position: {x, y}}, :north), do: {x, y + 1}

  defp update_position(%RobotSimulator{position: {x, y}}, :south), do: {x, y - 1}

  defp update_position(%RobotSimulator{position: {x, y}}, :east), do: {x + 1, y}

  defp update_position(%RobotSimulator{position: {x, y}}, :west), do: {x - 1, y}
end
