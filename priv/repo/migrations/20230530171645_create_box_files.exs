defmodule Box.Repo.Migrations.CreateBoxFiles do
  use Ecto.Migration

  def change do
    create table(:box_files, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :type, :string

      timestamps()
    end

    create unique_index(:box_files, [:name])
  end
end
