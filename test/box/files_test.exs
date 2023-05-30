defmodule Box.FilesTest do
  use Box.DataCase

  alias Box.Files

  describe "box_files" do
    alias Box.Files.File

    @valid_attrs %{added: "some added", name: "some name", path_to_file: "some path_to_file", type: "some type", updated: "some updated"}
    @update_attrs %{added: "some updated added", name: "some updated name", path_to_file: "some updated path_to_file", type: "some updated type", updated: "some updated updated"}
    @invalid_attrs %{added: nil, name: nil, path_to_file: nil, type: nil, updated: nil}

    def file_fixture(attrs \\ %{}) do
      {:ok, file} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Files.create_file()

      file
    end

    test "list_box_files/0 returns all box_files" do
      file = file_fixture()
      assert Files.list_box_files() == [file]
    end

    test "get_file!/1 returns the file with given id" do
      file = file_fixture()
      assert Files.get_file!(file.id) == file
    end

    test "create_file/1 with valid data creates a file" do
      assert {:ok, %File{} = file} = Files.create_file(@valid_attrs)
      assert file.added == "some added"
      assert file.name == "some name"
      assert file.path_to_file == "some path_to_file"
      assert file.type == "some type"
      assert file.updated == "some updated"
    end

    test "create_file/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Files.create_file(@invalid_attrs)
    end

    test "update_file/2 with valid data updates the file" do
      file = file_fixture()
      assert {:ok, %File{} = file} = Files.update_file(file, @update_attrs)
      assert file.added == "some updated added"
      assert file.name == "some updated name"
      assert file.path_to_file == "some updated path_to_file"
      assert file.type == "some updated type"
      assert file.updated == "some updated updated"
    end

    test "update_file/2 with invalid data returns error changeset" do
      file = file_fixture()
      assert {:error, %Ecto.Changeset{}} = Files.update_file(file, @invalid_attrs)
      assert file == Files.get_file!(file.id)
    end

    test "delete_file/1 deletes the file" do
      file = file_fixture()
      assert {:ok, %File{}} = Files.delete_file(file)
      assert_raise Ecto.NoResultsError, fn -> Files.get_file!(file.id) end
    end

    test "change_file/1 returns a file changeset" do
      file = file_fixture()
      assert %Ecto.Changeset{} = Files.change_file(file)
    end
  end

  describe "box_files" do
    alias Box.Files.File

    @valid_attrs %{name: "some name", type: "some type"}
    @update_attrs %{name: "some updated name", type: "some updated type"}
    @invalid_attrs %{name: nil, type: nil}

    def file_fixture(attrs \\ %{}) do
      {:ok, file} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Files.create_file()

      file
    end

    test "list_box_files/0 returns all box_files" do
      file = file_fixture()
      assert Files.list_box_files() == [file]
    end

    test "get_file!/1 returns the file with given id" do
      file = file_fixture()
      assert Files.get_file!(file.id) == file
    end

    test "create_file/1 with valid data creates a file" do
      assert {:ok, %File{} = file} = Files.create_file(@valid_attrs)
      assert file.name == "some name"
      assert file.type == "some type"
    end

    test "create_file/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Files.create_file(@invalid_attrs)
    end

    test "update_file/2 with valid data updates the file" do
      file = file_fixture()
      assert {:ok, %File{} = file} = Files.update_file(file, @update_attrs)
      assert file.name == "some updated name"
      assert file.type == "some updated type"
    end

    test "update_file/2 with invalid data returns error changeset" do
      file = file_fixture()
      assert {:error, %Ecto.Changeset{}} = Files.update_file(file, @invalid_attrs)
      assert file == Files.get_file!(file.id)
    end

    test "delete_file/1 deletes the file" do
      file = file_fixture()
      assert {:ok, %File{}} = Files.delete_file(file)
      assert_raise Ecto.NoResultsError, fn -> Files.get_file!(file.id) end
    end

    test "change_file/1 returns a file changeset" do
      file = file_fixture()
      assert %Ecto.Changeset{} = Files.change_file(file)
    end
  end
end
