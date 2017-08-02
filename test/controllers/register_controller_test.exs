defmodule BitcoinReg.RegisterControllerTest do
  use BitcoinReg.ConnCase

  alias BitcoinReg.Register
  @valid_attrs %{accept_tnc: true, btc_address: "some content", btc_sig: "some content", btc_tx_hash: "some content", contact: "some content", eth_address: "some content", referrer: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, register_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    register = Repo.insert! %Register{}
    conn = get conn, register_path(conn, :show, register)
    assert json_response(conn, 200)["data"] == %{"id" => register.id,
      "btc_address" => register.btc_address,
      "btc_tx_hash" => register.btc_tx_hash,
      "eth_address" => register.eth_address,
      "btc_sig" => register.btc_sig,
      "contact" => register.contact,
      "referrer" => register.referrer,
      "accept_tnc" => register.accept_tnc}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, register_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, register_path(conn, :create), register: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Register, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, register_path(conn, :create), register: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    register = Repo.insert! %Register{}
    conn = put conn, register_path(conn, :update, register), register: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Register, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    register = Repo.insert! %Register{}
    conn = put conn, register_path(conn, :update, register), register: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    register = Repo.insert! %Register{}
    conn = delete conn, register_path(conn, :delete, register)
    assert response(conn, 204)
    refute Repo.get(Register, register.id)
  end
end
