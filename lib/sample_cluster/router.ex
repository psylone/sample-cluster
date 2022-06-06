defmodule SampleCluster.Router do
  use Plug.Router

  alias SampleCluster.User.AccountService

  plug :match
  plug :dispatch

  get "/:user/account" do
    %{} = AccountService.call(conn.params)

    send_resp(conn, 200, "")
  end

  match _ do
    send_resp(conn, 404, "Not Found")
  end
end
