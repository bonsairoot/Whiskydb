defmodule Whiskydb.Dist do
  use Whiskydb.Web, :model

  schema "distilleries" do
    field :name, :string
    field :founded, :integer
    field :status, :string
    field :lat, :float
    field :long, :float
    field :description, :string
    field :region, :string

    timestamps()
  end

  def changeset(struct, params\\ %{}) do
    struct
    |>cast(params, [:name, :founded, :status, :lat, :long, :description, :region])
    |> validate_required([:name])
  end

  defimpl Phoenix.Param, for: Whiskydb.Dist do
    def to_param(%{name: name}) do
      "#{String.downcase(name)}"
    end
  end
end
