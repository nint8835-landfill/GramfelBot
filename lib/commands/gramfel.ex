defmodule Gramfelbot.Commands.Gramfel do
  @behaviour Nosedrum.Command

  alias Nostrum.Api

  @impl true
  def usage, do: ["gramfel"]

  @impl true
  def description, do: "Gramfel."

  @impl true
  def predicates, do: []

  @impl true
  def command(msg, _args) do
    {:ok, _msg} = Api.create_message(msg.channel_id, "Gramfel.")
  end
end
