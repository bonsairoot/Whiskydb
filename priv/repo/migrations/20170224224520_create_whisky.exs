defmodule Whiskydb.Repo.Migrations.CreateWhisky do
  use Ecto.Migration

  def change do
    create table(:whiskies) do
      add :name, :string, size: 100
      add :age, :integer
      add :avg_price, :float
      add :rating, :float

      timestamps()
    end

  end
end
