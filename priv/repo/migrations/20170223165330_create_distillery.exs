defmodule Whiskydb.Repo.Migrations.CreateDistillery do
  use Ecto.Migration

  def change do
    create table(:distilleries) do
      add :name, :string, size: 100
      add :founded, :integer
      add :status, :string, size: 100
      add :lat, :float
      add :long, :float
      add :description, :text

      timestamps()
    end

    create unique_index(:distilleries, [:name])
  end
end
