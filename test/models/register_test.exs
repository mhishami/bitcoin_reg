defmodule BitcoinReg.RegisterTest do
  use BitcoinReg.ModelCase

  alias BitcoinReg.Register

  @valid_attrs %{accept_tnc: true, btc_address: "some content", btc_sig: "some content", btc_tx_hash: "some content", contact: "some content", eth_address: "some content", referrer: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Register.changeset(%Register{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Register.changeset(%Register{}, @invalid_attrs)
    refute changeset.valid?
  end
end
