defmodule BitcoinReg.Repo.Migrations.CreateRegister do
  use Ecto.Migration

  def change do
    create table(:register) do
      add :btc_address, :string
      add :btc_tx_hash, :string
      add :eth_address, :string
      add :btc_sig, :string
      add :contact, :string
      add :referrer, :string
      add :accept_tnc, :boolean, default: false, null: false

      timestamps()
    end

  end
end
