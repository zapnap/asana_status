AsanaStatus
===========

> Display your Asana projects &amp; their details using Panic's Statusboard app.

How it works
------------

The app grabs all projects from a specific workspace id and their project description. We treat the description as the overall status of the project. The app color codes the project based on keywords found in the description.

**Current Keywords:** queued, on hold, done, to print, waiting, proofed, comps sent

Usage
-----

Add your Asana API key to +config/prod.exs+ (or +config/dev.exs+ for local testing):

    config :asana_status, :asana_api_key, "my-api-key"

To start your application:

1. Install dependencies with `mix deps.get`
2. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit `http://localhost:4000/status/[your-workspace-id]` from your browser to see the formatted project status results.

To get this working in production, you'll want to add a new Table Widget to StatusBoard pointing to the production version of this URL.

Credits
-------

Developed by Nick Plante as an excuse to mess around with Elixir and Phoenix.
This work was originally inspired by Nick Sheck's [Asana StatusBoard](https://github.com/sheck/asana-statusboard) project.
