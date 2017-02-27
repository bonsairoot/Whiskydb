defmodule Whiskydb.Video do
  use Whiskydb.Web, :model

  schema "reviews" do
    field :title, :string
    field :body, :string
    field :date, :date
    field :score, :integer
    field :color, :string
    field :nose, :string
    field :palate, :string
    field :finish, :string
    field :slug, :string

    belongs_to :whisky, Whiskydb.Whisky
    belongs_to :user, Whiskydb.User
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :body, :score, :color, :nose, :palate, :finish])
    |> validate_required([:title, :body, :date])
    |> slugify_title()
    |> assoc_constraint(:whisky)
  end

  defp slugify_title(changeset) do
    if title = get_change(changeset, :title) do
      put_change(changeset, :slug, slugify(title))
    else
      changeset
    end
  end

  defp slugify(str) do
    str
    |> String.downcase()
    |> String.replace(~r/[^\w-]+/u, "-")
  end

  defimpl Phoenix.Param, for: Whiskydb.Review do
    def to_param(%{slug: slug, id: id}) do
      "#{id}-#{slug}"
    end
  end

end
