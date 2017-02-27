defmodule Whiskydb.Repo.Migrations.AddRegionToDistillery do
  use Ecto.Migration

  def change do
    alter table(:distilleries) do
      add :region, :string, size: 100
    end
  end
end
