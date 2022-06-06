defmodule SampleCluster.User.AccountService do
  alias SampleCluster.User.Account

  def call(%{"user" => user}) do
    pid =
      user
      |> String.to_atom
      |> start_user_account_process

    %{pid: pid}
  end

  defp start_user_account_process(user) do
    case Account.start_link(name: user) do
      {:ok, pid} ->
        pid

      {:error, {:already_started, pid}} ->
        pid
    end
  end
end
