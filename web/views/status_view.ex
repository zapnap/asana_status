defmodule AsanaStatus.StatusView do
  use AsanaStatus.View

  @status_map %{
    "active" => :p1,
    "hold" => :p2,
    "queued" => :p2,
    "done" => :p3,
    "cold" => :p3 }

  def project_status(project) do
    notes = String.downcase(project.notes)
    status_match = Enum.find(Map.keys(@status_map), fn(k) -> Regex.match?(~r/#{k}/, notes) end)
    if status_match do
      @status_map[status_match]
    else
      :px
    end
  end

  def sorted_by_status(projects) do
    Enum.map(projects, fn(project) -> { project_status(project), project.name, project } end) |> Enum.sort
  end

  def project_members(project, users) do
    ids = Enum.map(project.members, fn(m) -> m["id"] end)
    Enum.filter(users, fn(u) -> Enum.member?(ids, u.id) end)
  end

  def user_initials(user) do
    name = user.name
    name_parts = String.split(name)
    Enum.map(name_parts, fn(n) -> String.at(n, 0) end) |> Enum.join
  end

  def user_icon(user, size \\ "60x60") do
    name = user.name
    src = nil

    if user.photo do
      src = user.photo["image_#{size}"]
    end

    if src do
      Phoenix.HTML.safe "<img class='icon' src='#{src}' alt='#{name}'>"
    else
      Phoenix.HTML.safe "<div class='icon'>#{user_initials(user)}</div>"
    end
  end
end
