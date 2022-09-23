defmodule OneRepairWeb.PageController do
  use OneRepairWeb, :controller


  def index(conn, _params) do
    render(conn, "index.html")
  end
end
