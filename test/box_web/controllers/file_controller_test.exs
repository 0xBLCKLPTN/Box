defmodule BoxWeb.FileControllerTest do
  use BoxWeb.ConnCase

  alias Box.Files
  alias Box.Files.File

  @create_attrs %{
    name: "some name",
    type: "some type"
  }
  @update_attrs %{
    name: "some updated name",
    type: "some updated type"
  }
  @invalid_attrs %{name: nil, type: nil}

  def fixture(:file) do
    {:ok, file} = Files.create_file(@create_attrs)
    file
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all box_files", %{conn: conn} do
      conn = get(conn, Routes.file_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create file" do
    test "renders file when data is valid", %{conn: conn} do
      conn = post(conn, Routes.file_path(conn, :create), file: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.file_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name",
               "type" => "some type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.file_path(conn, :create), file: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update file" do
    setup [:create_file]

    test "renders file when data is valid", %{conn: conn, file: %File{id: id} = file} do
      conn = put(conn, Routes.file_path(conn, :update, file), file: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.file_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name",
               "type" => "some updated type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, file: file} do
      conn = put(conn, Routes.file_path(conn, :update, file), file: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete file" do
    setup [:create_file]

    test "deletes chosen file", %{conn: conn, file: file} do
      conn = delete(conn, Routes.file_path(conn, :delete, file))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.file_path(conn, :show, file))
      end
    end
  end

  defp create_file(_) do
    file = fixture(:file)
    %{file: file}
  end
end
