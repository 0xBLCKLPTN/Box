defmodule BoxWeb.FileController do
  use BoxWeb, :controller

  def index(conn, _params) do
    render(conn, "index.json")
  end
end
