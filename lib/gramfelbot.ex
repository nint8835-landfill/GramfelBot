defmodule Gramfelbot do
  use Application

  def start(_type, args) do
    Gramfelbot.Supervisor.start_link(args)
  end
end
