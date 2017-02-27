defmodule Whiskydb.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string, size: 100
      add :username, :string, null: false, size: 100
      add :password_hash, :string, size: 100

      timestamps()
    end

    create unique_index(:users, [:username])
  end
end
