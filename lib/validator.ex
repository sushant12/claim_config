defmodule ClaimConfig.Validator do
  def validate(parsed_config) do
    Enum.each(parsed_config, fn {_group_name, group} ->
      Enum.each(group, fn {_section_name, section} ->
        Enum.each(Map.get(section, "fields"), fn field ->
          required_field_hidden(
            Map.get(field, "required") && Map.get(field, "hidden"),
            Map.has_key?(field, "default")
          )
        end)
      end)
    end)
  end

  defp required_field_hidden(true, false) do
    IO.puts("Hidden and Required field needs to have a default value")
  end

  defp required_field_hidden(_required_hidden, _default), do: nil
end
