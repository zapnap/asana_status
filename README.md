AsanaStatus
===========

> Display your Asana projects &amp; their details using Panic's Statusboard app.

How it works
------------

The simple utility app grabs all active projects from a specific Asana workspace.
We use the project description as the overall status of the project for now.
The app color codes the project based on keywords found in the description.

**Current Keywords:** queued, on hold, done, to print, waiting, proofed, comps sent

Usage
-----

To start the app locally, you'll need Elixir on your system.

1. Install dependencies with `mix deps.get`
2. Start Phoenix endpoint with `ASANA_API_KEY=[your-api-key] foreman start`

Now you can visit `http://localhost:4000/status/[your-workspace-id]` from your browser to see the formatted project status results.

Deployment
----------

Want to deploy this to [Heroku](http://heroku.com)?

1. Create a Heroku application with a custom buildpack:

    heroku create --buildpack "https://github.com/HashNuke/heroku-buildpack-elixir.git"

2. Set the required environment variables:

    heroku config:set MIX_ENV=prod
    heroku config:set ASANA_API_KEY=[your-api-key]

3. Push the application to Heroku (`git push heroku master`)
4. Try hitting the endpoint at `http://your-heroku-endpoint.herokuapp.com/status/[your-workspace-id]`
5. If everything seems to be working, add a new Table Widget in StatusBoard with the above URL

If something doesn't seem to be working, tail the Heroku logs for clues. If you're still SOL, open an issue on this project and I'll try to help you.

Notes
-----

This work was originally inspired by Nick Sheck's [Asana StatusBoard](https://github.com/sheck/asana-statusboard) (Sinatra) project.
I rewrote it in Elixir and added a few features mostly as an excuse to play around with Phoenix.
There's definitely some optimization to be done and I'm sure I've bungled a few idioms.
Also needs some tests.
