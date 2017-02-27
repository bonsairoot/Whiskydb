defmodule Whiskydb.Whisky do
  use Whiskydb.Web, :model

  schema "whiskies" do
    field :name, :string
    field :age, :integer
    field :avg_price, :float
    field :rating, :float


    belongs_to :distillery, Whiskydb.Dist
    has_many :reviews, Whiskydb.Review 

    timestamps()
  end

  def changeset(struct, params  \\ %{}) do
    struct
    |> cast(params, [:name, :age, :type, :maturation, :avg_price, :flavour, :rating])
    |> validate_required([:name, :type])
    |> assoc_constraint(:distillery)
  end
end
