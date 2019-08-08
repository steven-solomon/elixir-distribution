defmodule Singleton do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok, name: {:global, __MODULE__})
  end

  def init(:ok) do
    {:ok, :wibble, 1000}
  end

  def handle_info(:timeout, state) do
    IO.puts "I am singleton, hear me roar"
    {:noreply, state, 1000}
  end
end
