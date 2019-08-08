defmodule SingletonSupervisor do
  def start_link(_) do
    Supervisor.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    children = [
      {Singleton, []}
    ]
    Supervisor.init(children, strategy: :one_for_one)
  end
end
