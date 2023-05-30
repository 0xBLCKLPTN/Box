defmodule BoxWeb.FileView do
  use BoxWeb, :view

  def render("index.json", _data) do
    %{"status": "ok", "roll": 4}
  end
end
