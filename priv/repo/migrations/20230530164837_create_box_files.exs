defmodule Box.Repo.Migrations.CreateBoxFiles do
  use Ecto.Migration

  def change do
    create table(:box_files, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :path_to_file, :string
      add :updated, :string
      add :added, :string
      add :type, :string

      timestamps()
    end

  end
end
