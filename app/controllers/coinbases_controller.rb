require 'coinbase/wallet'
class CoinbasesController < ActionController::API

  def client
    @client = Coinbase::Wallet::Client.new(api_key: ENV['CBKEY'],
                                     api_secret: ENV['CBSECRET'],
                                     CB_VERSION: 'YYYY-MM-DD')
  end

  def accounts
    client
    # render json: @client.accounts
    render json: {"id":"2c4d5b15-248e-58f9-b693-c18b84c57375","name":"LTC Wallet","primary":false,"type":"wallet","currency":"LTC","balance":{"amount":"0.00000000","currency":"LTC"},"created_at":"2017-03-31T04:59:24Z","updated_at":"2017-03-31T04:59:25Z","resource":"account","resource_path":"/v2/accounts/2c4d5b15-248e-58f9-b693-c18b84c57375","native_balance":{"amount":"0.00","currency":"USD"}},{"id":"ccf333e9-da73-50bf-9bac-54f324990457","name":"ETH Wallet","primary":false,"type":"wallet","currency":"ETH","balance":{"amount":"0.00000000","currency":"ETH"},"created_at":"2016-08-12T08:56:29Z","updated_at":"2016-09-16T17:00:31Z","resource":"account","resource_path":"/v2/accounts/ccf333e9-da73-50bf-9bac-54f324990457","native_balance":{"amount":"0.00","currency":"USD"}},{"id":"c4b5a004-8131-5a03-a458-6cdc61ab4298","name":"CoinStash USD Test","primary":false,"type":"fiat","currency":"USD","balance":{"amount":"0.00","currency":"USD"},"created_at":"2015-12-26T19:44:25Z","updated_at":"2017-10-10T15:26:36Z","resource":"account","resource_path":"/v2/accounts/c4b5a004-8131-5a03-a458-6cdc61ab4298","native_balance":{"amount":"0.00","currency":"USD"}},{"id":"d81d3213-097e-5b97-ba47-7d88077ab808","name":"BTC Wallet","primary":true,"type":"wallet","currency":"BTC","balance":{"amount":"0.00000000","currency":"BTC"},"created_at":"2015-11-27T07:52:00Z","updated_at":"2017-10-10T16:17:42Z","resource":"account","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808","native_balance":{"amount":"0.00","currency":"USD"}}
  end

  def usd_wallet
     client
     render json: @client.accounts[2]
  end

  def ltc_wallet
     client
     render json: @client.accounts[0]
  end

  def eth_wallet
     client
     render json: @client.accounts[1]
  end

  def btc_wallet
      client
      render json: @client.accounts[3]
  end

  def primary_account
    client
    render json: @client.primary_account
  end

  def btc_transactions
    client
    render json: @client.accounts[3].transactions
  end

  def eth_transactions
    client
    render json: @client.accounts[1].transactions
  end

  def ltc_transactions
    client
    render json: @client.accounts[0].transactions
  end

  def usd_transactions
    client
    render json: @client.accounts[2].transactions
  end

  def transactions
    client
    render json: @client.primary_account.transactions
  end

  def account_id
    client
    render json: @client.accounts[0].id
  end

  def payment_methods
    client
    render json: @client.payment_methods
  end

  def send_payment

    client
    primary_account = client.primary_account
    response = primary_account.send({:to => params[:to],
                           :amount => params[:amount],
                           :currency => params[:currency]})
  end

  def buyBTC
    client
    account = client.primary_account
    payment_method = client.payment_methods.first
    buy = account.buy({:amount => "1.36",
                     :currency => "USD",
                     :payment_method => payment_method.id})
  end

  def sellBTC
    client
    account = client.primary_account
    payment_method = client.payment_methods.first

    sell = account.sell({:amount => params[:amount],
                       :currency => "BTC",
                       :payment_method => payment_method.id})

  end

  def buyETH
    client
    account = client.primary_account
    payment_method = client.payment_methods.first
    buy = account.buy({:amount => "1.36",
                     :currency => "USD",
                     :payment_method => payment_method.id})
  end

  def sellETH
    client
    account = client.primary_account
    payment_method = client.payment_methods.first

    sell = account.sell({:amount => params[:amount],
                       :currency => "ETH",
                       :payment_method => payment_method.id})

  end

  def buyLTC
    client
    account = client.primary_account
    payment_method = client.payment_methods.first
    buy = account.buy({:amount => "1.36",
                     :currency => "USD",
                     :payment_method => payment_method.id})
  end

  def sellLTC
    client
    account = client.primary_account
    payment_method = client.payment_methods.first

    sell = account.sell({:amount => params[:amount],
                       :currency => "LTC",
                       :payment_method => payment_method.id})

  end

  private

  def payment_params
    params.require(:payment).permit(:to, :amount, :currency)
  end
end
