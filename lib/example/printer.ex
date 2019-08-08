defmodule Printer do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    {:ok, :state_does_not_matter, 1000}
  end

  def handle_info(:timeout, state) do
    IO.puts "Printer: #{inspect Node.list()}"

    {:noreply, state, 1000}
  end
end
