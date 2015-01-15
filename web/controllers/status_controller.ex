defmodule AsanaStatus.StatusController do
  use Phoenix.Controller

  plug :action
  plug :render, layout: false

  alias AsanaStatus.Workspace

  def show(conn, %{"workspace_id" => workspace_id}) do
    projects = Workspace.projects(workspace_id)
    users = Workspace.users(projects)

    conn
    |> assign(:projects, projects)
    |> assign(:users, users)
  end
end
