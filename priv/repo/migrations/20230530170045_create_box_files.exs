defmodule Box.Repo.Migrations.CreateBoxFiles do
  use Ecto.Migration

  def change do
    create table(:box_files, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :type, :string
      add :parent_id, references(:box_files, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:box_files, [:parent_id])
  end
end
