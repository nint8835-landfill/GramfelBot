defmodule Gramfelbot.Consumer do
  use Nostrum.Consumer

  alias Nosedrum.Invoker.Split, as: CommandInvoker
  alias Nosedrum.Storage.ETS, as: CommandStorage
  alias Nostrum.Api

  def start_link do
    Consumer.start_link(__MODULE__)
  end

  @commands %{
    "gramfel" => Gramfelbot.Commands.Gramfel
  }

  def handle_event({:READY, _data, _ws_state}) do
    Enum.each(@commands, fn {name, cog} -> CommandStorage.add_command([name], cog) end)
  end

  def handle_event({:MESSAGE_CREATE, msg, _ws_state}) do
    if String.downcase(msg.content) =~ "gramfel" and msg.author.id != Nostrum.Cache.Me.get().id do
      Api.create_message!(msg.channel_id, "gramfel")
    end
    CommandInvoker.handle_message(msg, CommandStorage)
  end

  def handle_event(_event) do
    :noop
  end
end
