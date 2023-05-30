defmodule BoxWeb.FileController do
  use BoxWeb, :controller

  alias Box.Files
  alias Box.Files.File

  action_fallback BoxWeb.FallbackController

  def index(conn, _params) do
    box_files = Files.list_box_files()
    render(conn, "index.json", box_files: box_files)
  end

  def create(conn, %{"file" => file_params}) do
    with {:ok, %File{} = file} <- Files.create_file(file_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.file_path(conn, :show, file))
      |> render("show.json", file: file)
    end
  end

  def show(conn, %{"id" => id}) do
    file = Files.get_file!(id)
    render(conn, "show.json", file: file)
  end

  def update(conn, %{"id" => id, "file" => file_params}) do
    file = Files.get_file!(id)

    with {:ok, %File{} = file} <- Files.update_file(file, file_params) do
      render(conn, "show.json", file: file)
    end
  end

  def delete(conn, %{"id" => id}) do
    file = Files.get_file!(id)

    with {:ok, %File{}} <- Files.delete_file(file) do
      send_resp(conn, :no_content, "")
    end
  end
end
