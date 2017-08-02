defmodule BitcoinReg.Register do
  use BitcoinReg.Web, :model

  schema "register" do
    field :btc_address, :string
    field :btc_tx_hash, :string
    field :eth_address, :string
    field :btc_sig, :string
    field :contact, :string
    field :referrer, :string
    field :accept_tnc, :boolean, default: false

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:btc_address, :btc_tx_hash, :eth_address, :btc_sig, :contact, :referrer, :accept_tnc])
    |> validate_required([:btc_address, :btc_tx_hash, :eth_address, :btc_sig, :contact, :referrer, :accept_tnc])
  end
end
