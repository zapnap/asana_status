defmodule AsanaStatus.StatusView do
  require Logger
  use AsanaStatus.View

  def project_status(project) do
    status_map = %{
      "queued" => "queued",
      "on hold" => "queued",
      "done" => "done",
      "to print" => "done",
      "waiting" => "waiting",
      "proofed" => "waiting",
      "comps sent" => "waiting"
    }
    notes = String.downcase(project.notes)
    status_match = Enum.find(Map.keys(status_map), fn(k) -> Regex.match?(~r/#{k}/, notes) end)
    if status_match do
      status_map[status_match]
    else
      nil
    end
  end

  def project_members(project, users) do
    Logger.debug "project members"
    ids = Enum.map(project.members, fn(m) -> m["id"] end)
    Enum.filter(users, fn(u) -> Enum.member?(ids, u.id) end)
  end

  def user_initials(user) do
    name = user.name
    name_parts = String.split(name)
    Enum.map(name_parts, fn(n) -> String.at(n, 0) end) |> Enum.join
  end

  def user_icon(user, size \\ "60x60") do
    Logger.debug "user icon"
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
