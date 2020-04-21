defmodule ClaimConfig do
  @moduledoc """
  Validate claim config and visualize it
  """

  @doc """
  Parse the yml into custom data structure
  """
  def parse(config) do
    ClaimConfig.Parser.parse(config)
  end

  @doc """
  Validate the yml
  """
  def validate(parsed_config) do
    ClaimConfig.Validator.validate(parsed_config)
  end

  @doc """
  Visualize the yml
  """
  def visualize(parsed_config) do
  end
end
