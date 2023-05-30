defmodule BoxWeb.FileView do
  use BoxWeb, :view
  alias BoxWeb.FileView

  def render("index.json", %{box_files: box_files}) do
    %{data: render_many(box_files, FileView, "file.json")}
  end

  def render("show.json", %{file: file}) do
    %{data: render_one(file, FileView, "file.json")}
  end

  def render("file.json", %{file: file}) do
    %{id: file.id,
      name: file.name,
      type: file.type}
  end
end
