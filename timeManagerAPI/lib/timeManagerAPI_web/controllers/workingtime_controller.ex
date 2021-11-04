defmodule TimeManagerAPIWeb.WorkingtimeController do
  use TimeManagerAPIWeb, :controller

  alias TimeManagerAPI.Workingtimes
  alias TimeManagerAPI.Workingtimes.Workingtime

  action_fallback TimeManagerAPIWeb.FallbackController

  def index(conn, _params) do
    workingtimes = Workingtimes.list_workingtimes()
    render(conn, "index.json", workingtimes: workingtimes)
  end

  def create(conn, %{"userID" => userID, "workingtime" => workingtime_params}) do
    with {:ok, %Workingtime{} = workingtime} <-
           Workingtimes.create_workingtime(workingtime_params, userID) do
      conn
      |> put_status(:created)
      # error ? |> put_resp_header("location", Routes.workingtime_path(conn, :show, workingtime))
      |> render("show.json", workingtime: workingtime)
    end
  end

  def show(conn, %{"id" => id}) do
    workingtime = Workingtimes.get_workingtime!(id)
    render(conn, "show.json", workingtime: workingtime)
  end

  def search(conn, %{"id" => id} = params) do
    startSearch = Map.get(params, "start", "")
    endSearch = Map.get(params, "end", "")

    cond do
      startSearch != "" && endSearch != "" ->
        render(conn, "index.json",
          workingtimes: Workingtimes.search_workingtime(id, startSearch, endSearch)
        )

      true ->
        render(conn, "show.json", workingtime: Workingtimes.get_workingtime!(id))
    end
  end

  def update(conn, %{"id" => id, "workingtime" => workingtime_params}) do
    workingtime = Workingtimes.get_workingtime!(id)

    with {:ok, %Workingtime{} = workingtime} <-
           Workingtimes.update_workingtime(workingtime, workingtime_params) do
      render(conn, "show.json", workingtime: workingtime)
    end
  end

  def delete(conn, %{"id" => id}) do
    workingtime = Workingtimes.get_workingtime!(id)

    with {:ok, %Workingtime{}} <- Workingtimes.delete_workingtime(workingtime) do
      send_resp(conn, :no_content, "")
    end
  end
end
