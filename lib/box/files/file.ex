defmodule Box.Files.File do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "box_files" do
    field :name, :string
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(file, attrs) do
    file
    |> cast(attrs, [:name, :type])
    |> validate_required([:name, :type])
    |> unique_constraint(:name)
  end
end
