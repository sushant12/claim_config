defmodule ClaimConfig.Parser do
  def parse(config) do
    # {:ok, parsed_config} = YamlElixir.read_from_string(config)
    path = Path.join(File.cwd!(), "lib/demo.yml")
    {:ok, parsed_config} = YamlElixir.read_from_file(path)

    Enum.reduce(parsed_config, %{}, fn section, acc ->
      name = Map.get(section, "name")
      group = Map.get(section, "section_group")
      group_content = %{name => %{"fields" => Map.get(section, "fields")}}

      Map.update(acc, group, group_content, fn x ->
        Map.merge(
          Map.get(acc, group),
          group_content
        )
      end)
    end)
  end
end
