defmodule BitcoinReg.RegisterController do
  use BitcoinReg.Web, :controller

  alias BitcoinReg.Register

  def index(conn, _params) do
    #register = Repo.all(Register)
    #render(conn, "index.json", register: register)
    render(conn, "index.json", register: %{})
  end

  def create(conn, %{"register" => register_params}) do
    changeset = Register.changeset(%Register{}, register_params)

    case Repo.insert(changeset) do
      {:ok, register} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", register_path(conn, :show, register))
        |> render("show.json", register: register)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(BitcoinReg.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    register = Repo.get!(Register, id)
    render(conn, "show.json", register: register)
  end

  def update(conn, %{"id" => id, "register" => register_params}) do
    register = Repo.get!(Register, id)
    changeset = Register.changeset(register, register_params)

    case Repo.update(changeset) do
      {:ok, register} ->
        render(conn, "show.json", register: register)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(BitcoinReg.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    register = Repo.get!(Register, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(register)

    send_resp(conn, :no_content, "")
  end
end
