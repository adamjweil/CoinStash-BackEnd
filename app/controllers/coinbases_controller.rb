require 'coinbase/wallet'
class CoinbasesController < ActionController::API

  def client
    @client = Coinbase::Wallet::Client.new(api_key: ENV['CBKEY'],
                                     api_secret: ENV['CBSECRET'],
                                     CB_VERSION: 'YYYY-MM-DD')
  end

  def accounts
    # client
    # render json: @client.accounts
    render json:
      [{"id":"36728bs-248e-58f9-b693-d18b84c57375","name":"LiteCoin Wallet","primary":false,"type":"wallet","currency":"LTC","balance":{"amount":"777.8273464","currency":"LTC"},"created_at":"2017-03-31T04:59:24Z","updated_at":"2017-03-31T04:59:25Z","resource":"account","resource_path":"/v2/accounts/36728bs-248e-58f9-b693-d18b84c57375","native_balance":{"amount":"45,814.01","currency":"USD"}},
      {"id":"dd4333e9-f473-50bf-9bac-54f324990457","name":"Ethereum Wallet","primary":false,"type":"wallet","currency":"ETH","balance":{"amount":"223.7463384","currency":"ETH"},"created_at":"2016-08-12T08:56:29Z","updated_at":"2016-09-16T17:00:31Z","resource":"account","resource_path":"/v2/accounts/dd4333e9-f473-50bf-9bac-54f324990457","native_balance":{"amount":"72,211.45","currency":"USD"}},
      {"id":"cfgd5a004-8431-5a03-a428-6cdc61df4298","name":"USD Wallet","primary":false,"type":"fiat","currency":"USD","balance":{"amount":"722,322.22","currency":"USD"},"created_at":"2015-12-26T19:44:25Z","updated_at":"2017-10-10T15:26:36Z","resource":"account","resource_path":"/v2/accounts/cfgd5a004-8431-5a03-a428-6cdc61df4298","native_balance":{"amount":"722,322.22","currency":"USD"}},
      {"id":"d81d3213-287e-5b97-ba47-7d88033ab808","name":"BitCoin Wallet","primary":true,"type":"wallet","currency":"BTC","balance":{"amount":"34.2212334","currency":"BTC"},"created_at":"2015-11-27T07:52:00Z","updated_at":"2017-10-10T16:17:42Z","resource":"account","resource_path":"/v2/accounts/d81d3213-287e-5b97-ba47-7d88033ab808","native_balance":{"amount":"192,933.84","currency":"USD"}}]
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
    # client
    # render json: @client.primary_account.transactions
    render json:
    [{"id":"1","created_at":"Oct. 13 2017","type":"send","status":"completed","amount":{"amount":"-0.00478456","currency":"BTC"},"native_amount":{"amount":"-22.96","currency":"USD"}},    {"id":"2","created_at":"Sept. 1 2017", "type":"buy","status":"completed","amount":{"amount":"1.23273","currency":"BTC"},"native_amount":{"amount":"6763.68","currency":"USD"}}, {"id":"3","created_at":"Sept. 29 2017","type":"sell","status":"completed","amount":{"amount":"-27.8374","currency":"ETH"},"native_amount":{"amount":"-8,984.19","currency":"USD"}}, {"id":"4","created_at":"Sept. 25 2017","type":"send","status":"completed","amount":{"amount":"17.12","currency":"ETH"},"native_amount":{"amount":"5,528.44","currency":"USD"}}, {"id":"5","created_at":"Sept. 19 2017","type":"buy","status":"completed","amount":{"amount":"119.1223","currency":"LTC"},"native_amount":{"amount":"6,994.86","currency":"USD"}}, {"id":"6","created_at":"Sept. 14 2017","type":"send","status":"completed","amount":{"amount":"50","currency":"LTC"},"native_amount":{"amount":"2,936","currency":"USD"}}, {"id":"7","created_at":"Sept. 10 2017","type":"sell","status":"completed","amount":{"amount":"-3.37483","currency":"BTC"},"native_amount":{"amount":"-18,889.73","currency":"USD"}}, {"id":"8","created_at":"Sept. 1 2017","type":"buy","status":"completed","amount":{"amount":"1.12","currency":"BTC"},"native_amount":{"amount":"4,528.44","currency":"USD"}},
    {"id":"9","created_at":"Aug. 30 2017","type":"buy","status":"completed","amount":{"amount":"1.25364","currency":"BTC"},"native_amount":{"amount":"7,016.92","currency":"USD"}},
    {"id":"10","created_at":"Aug. 25 2017","type":"buy","status":"completed","amount":{"amount":"3.273647","currency":"BTC"},"native_amount":{"amount":"18,323.39","currency":"USD"}},
    {"id":"11","created_at":"Aug. 21 2017","type":"buy","status":"completed","amount":{"amount":"0.5487263","currency":"BTC"},"native_amount":{"amount":"2,071.35","currency":"USD"}},
    {"id":"12","created_at":"Aug. 17 2017","type":"buy","status":"completed","amount":{"amount":"10.2736","currency":"ETH"},"native_amount":{"amount":"3,082.08","currency":"USD"}},
    {"id":"13","created_at":"Aug. 11 2017","type":"buy","status":"completed","amount":{"amount":"22.273","currency":"ETH"},"native_amount":{"amount":"6,681.9","currency":"USD"}},
    {"id":"14","created_at":"Aug. 5 2017","type":"buy","status":"completed","amount":{"amount":"33","currency":"LTC"},"native_amount":{"amount":"1,650","currency":"USD"}},
    {"id":"15","created_at":"Aug. 1 2017","type":"buy","status":"completed","amount":{"amount":"150","currency":"LTC"},"native_amount":{"amount":"7,500","currency":"USD"}},
    {"id":"16","created_at":"July. 28 2017","type":"send","status":"completed","amount":{"amount":"-1.02394","currency":"BTC"},"native_amount":{"amount":"-4,0502.22","currency":"USD"}},
    {"id":"17","created_at":"July. 24 2017","type":"send","status":"completed","amount":{"amount":"3.2123","currency":"BTC"},"native_amount":{"amount":"17,980.01","currency":"USD"}},
    {"id":"18","created_at":"July. 24 2017","type":"send","status":"completed","amount":{"amount":"10.28374","currency":"BTC"},"native_amount":{"amount":"57,560.56","currency":"USD"}},
    {"id":"19","created_at":"July. 21 2017","type":"send","status":"completed","amount":{"amount":"-9.92","currency":"ETH"},"native_amount":{"amount":"-2,893.22","currency":"USD"}},
    {"id":"20","created_at":"July. 18 2017","type":"send","status":"completed","amount":{"amount":"22.21","currency":"BTC"},"native_amount":{"amount":"6,663.21","currency":"USD"}}]
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
