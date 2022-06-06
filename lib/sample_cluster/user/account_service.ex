defmodule SampleCluster.User.AccountService do
  alias SampleCluster.User.{
    Account,
    AccountSupervisor
  }

  def call(%{"user" => user}) do
    case start_user_account_process(user) do
      {:ok, pid} ->
        pid

      {:error, {:already_started, pid}} ->
        pid
    end
  end

  defp start_user_account_process(user) do
    Horde.DynamicSupervisor.start_child(
      AccountSupervisor,
      {Account, name: user}
    )
  end
end
