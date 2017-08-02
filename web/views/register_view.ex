defmodule BitcoinReg.RegisterView do
  use BitcoinReg.Web, :view

  def render("index.json", %{register: register}) do
    %{data: render_many(register, BitcoinReg.RegisterView, "register.json")}
  end

  def render("show.json", %{register: register}) do
    %{data: render_one(register, BitcoinReg.RegisterView, "register.json")}
  end

  def render("register.json", %{register: register}) do
    %{id: register.id,
      btc_address: register.btc_address,
      btc_tx_hash: register.btc_tx_hash,
      eth_address: register.eth_address,
      btc_sig: register.btc_sig,
      contact: register.contact,
      referrer: register.referrer,
      accept_tnc: register.accept_tnc}
  end
end
