# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Whiskydb.Repo.insert!(%Whiskydb.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Whiskydb.Repo
alias Whiskydb.Dist

input = File.read!("/home/gaw/repos/whiskydb/priv/repo/wseeds.csv")
|> String.split("\n", trim: true)
|> Enum.map(&(String.split(&1, ",")))

for entry <- input do
    Repo.get_by(Dist, name: Enum.at(entry,0)) ||
      Repo.insert!(%Dist{name: Enum.at(entry,0), lat: Enum.at(entry,1) |> String.to_float, long: Enum.at(entry,2) |> String.to_float})
end

