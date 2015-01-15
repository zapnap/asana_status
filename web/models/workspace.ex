defmodule AsanaStatus.Workspace do
  use HTTPoison.Base

  def projects(workspace_id) do
    json = fetch("workspaces/#{workspace_id}/projects?archived=false")
    projects = Poison.decode!(json, as: %{"data" => [AsanaStatus.Project]})["data"]
    Enum.map(projects, fn(p) -> project(p.id) end)
  end

  def project(id) do
    json = fetch("projects/#{id}")
    Poison.decode!(json, as: %{"data" => AsanaStatus.Project})["data"]
  end

  def users(projects) do
    users = Enum.map(projects, fn(p) -> p.members end) |> List.flatten |> Enum.uniq
    Enum.map(users, fn(u) -> user(u["id"]) end)
  end

  def user(id) do
    json = fetch("users/#{id}")
    Poison.decode!(json, as: %{"data" => AsanaStatus.User})["data"]
  end

  def process_url(path) do
    "https://app.asana.com/api/1.0/#{path}"
  end

  defp fetch(path, api_key \\ Application.get_env(:asana_status, :asana_api_key)) do
    headers = %{"Content-Type" => "application/json"}
    auth = [hackney: [basic_auth: {api_key, ""}]]
    get!(path, headers, auth).body
  end
end
