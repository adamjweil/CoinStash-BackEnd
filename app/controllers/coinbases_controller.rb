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
    render json: [{"id":"36728bs-248e-58f9-b693-d18b84c57375","name":"LTC Test Wallet","primary":false,"type":"wallet","currency":"LTC","balance":{"amount":"7.8273464","currency":"LTC"},"created_at":"2017-03-31T04:59:24Z","updated_at":"2017-03-31T04:59:25Z","resource":"account","resource_path":"/v2/accounts/36728bs-248e-58f9-b693-d18b84c57375","native_balance":{"amount":"443.56","currency":"USD"}},{"id":"dd4333e9-f473-50bf-9bac-54f324990457","name":"ETH Test Wallet","primary":false,"type":"wallet","currency":"ETH","balance":{"amount":"223.7463384","currency":"ETH"},"created_at":"2016-08-12T08:56:29Z","updated_at":"2016-09-16T17:00:31Z","resource":"account","resource_path":"/v2/accounts/dd4333e9-f473-50bf-9bac-54f324990457","native_balance":{"amount":"72,211.45","currency":"USD"}},{"id":"cfgd5a004-8431-5a03-a428-6cdc61df4298","name":"USD Test Wallet","primary":false,"type":"fiat","currency":"USD","balance":{"amount":"722,322.22","currency":"USD"},"created_at":"2015-12-26T19:44:25Z","updated_at":"2017-10-10T15:26:36Z","resource":"account","resource_path":"/v2/accounts/cfgd5a004-8431-5a03-a428-6cdc61df4298","native_balance":{"amount":"722,322.22","currency":"USD"}},{"id":"d81d3213-287e-5b97-ba47-7d88033ab808","name":"BTC Test Wallet","primary":true,"type":"wallet","currency":"BTC","balance":{"amount":"34.2212334","currency":"BTC"},"created_at":"2015-11-27T07:52:00Z","updated_at":"2017-10-10T16:17:42Z","resource":"account","resource_path":"/v2/accounts/d81d3213-287e-5b97-ba47-7d88033ab808","native_balance":{"amount":"192,933.84","currency":"USD"}}}]
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

  def transactions_test
    render json:
    [{"id":"5ce9eda3-8bd0-552d-b7a5-48265c02d49a","type":"send","status":"completed","amount":{"amount":"-0.00478456","currency":"BTC"},"native_amount":{"amount":"-22.96","currency":"USD"},"description":null,"created_at":"2017-10-10T15:27:30Z","updated_at":"2017-10-10T15:29:12Z","resource":"transaction","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/transactions/5ce9eda3-8bd0-552d-b7a5-48265c02d49a","instant_exchange":false,"network":{"status":"confirmed","hash":"ae090fd53264e4b8203b94fc09151bb5c77a5a98e03f641543eca7d95cd5f547","transaction_fee":{"amount":"0.00033800","currency":"BTC"},"transaction_amount":{"amount":"0.00444656","currency":"BTC"},"confirmations":441},"to":{"resource":"bitcoin_address","address":"1LJLaR5ih7UV2qVmERHkesQ7AwWje1KacT"},"details":{"title":"Sent bitcoin","subtitle":"to Bitcoin address"}},{"id":"49303f20-4a06-58da-9f69-01d7445a4f70","type":"buy","status":"completed","amount":{"amount":"0.00254144","currency":"BTC"},"native_amount":{"amount":"13.75","currency":"USD"},"description":null,"created_at":"2017-10-10T15:26:35Z","updated_at":"2017-10-10T15:26:36Z","resource":"transaction","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/transactions/49303f20-4a06-58da-9f69-01d7445a4f70","instant_exchange":false,"buy":{"id":"9960c5ea-0a8c-5721-9ecd-a0c7c77ae568","resource":"buy","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/buys/9960c5ea-0a8c-5721-9ecd-a0c7c77ae568"},"details":{"title":"Bought bitcoin","subtitle":"using CoinStash USD Test","payment_method_name":"CoinStash USD Test"}},{"id":"502e6f8d-8036-50cc-a55c-94e7de19f27b","type":"send","status":"completed","amount":{"amount":"-0.00024000","currency":"BTC"},"native_amount":{"amount":"-1.04","currency":"USD"},"description":null,"created_at":"2017-10-06T18:53:08Z","updated_at":"2017-10-06T18:53:08Z","resource":"transaction","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/transactions/502e6f8d-8036-50cc-a55c-94e7de19f27b","instant_exchange":false,"network":{"status":"off_blockchain"},"to":{"id":"14cb41c3-0951-5cb6-8e72-61cc78ba91a6","resource":"user","resource_path":"/v2/users/14cb41c3-0951-5cb6-8e72-61cc78ba91a6"},"details":{"title":"Sent bitcoin","subtitle":"to George Schaab"}},{"id":"4bcd8ac1-9391-5317-8a22-dc640a4de386","type":"sell","status":"completed","amount":{"amount":"-0.00100000","currency":"BTC"},"native_amount":{"amount":"-3.34","currency":"USD"},"description":null,"created_at":"2017-10-06T18:51:58Z","updated_at":"2017-10-06T18:51:58Z","resource":"transaction","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/transactions/4bcd8ac1-9391-5317-8a22-dc640a4de386","instant_exchange":false,"sell":{"id":"7b56c728-4d28-5e45-a954-d1606d55cbeb","resource":"sell","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/sells/7b56c728-4d28-5e45-a954-d1606d55cbeb"},"details":{"title":"Sold bitcoin","subtitle":"using CoinStash USD Test","payment_method_name":"CoinStash USD Test"}},{"id":"941520f9-6604-51d6-9364-f81e9cf40924","type":"sell","status":"completed","amount":{"amount":"-0.00100000","currency":"BTC"},"native_amount":{"amount":"-3.35","currency":"USD"},"description":null,"created_at":"2017-10-06T17:56:29Z","updated_at":"2017-10-06T17:56:29Z","resource":"transaction","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/transactions/941520f9-6604-51d6-9364-f81e9cf40924","instant_exchange":false,"sell":{"id":"46ce17c2-dde4-5d33-a46e-a6abd1e60dd2","resource":"sell","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/sells/46ce17c2-dde4-5d33-a46e-a6abd1e60dd2"},"details":{"title":"Sold bitcoin","subtitle":"using CoinStash USD Test","payment_method_name":"CoinStash USD Test"}},{"id":"a53f16f2-e8a1-5cd8-8230-d85292199d97","type":"sell","status":"completed","amount":{"amount":"-0.00100000","currency":"BTC"},"native_amount":{"amount":"-3.38","currency":"USD"},"description":null,"created_at":"2017-10-06T17:19:08Z","updated_at":"2017-10-06T17:19:08Z","resource":"transaction","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/transactions/a53f16f2-e8a1-5cd8-8230-d85292199d97","instant_exchange":false,"sell":{"id":"f0e32cc5-ef90-5893-af14-c99bd5067b9a","resource":"sell","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/sells/f0e32cc5-ef90-5893-af14-c99bd5067b9a"},"details":{"title":"Sold bitcoin","subtitle":"using CoinStash USD Test","payment_method_name":"CoinStash USD Test"}},{"id":"37385faa-9310-5f90-b762-bf7e81098f88","type":"buy","status":"completed","amount":{"amount":"0.00030840","currency":"BTC"},"native_amount":{"amount":"2.35","currency":"USD"},"description":null,"created_at":"2017-10-06T17:18:00Z","updated_at":"2017-10-06T17:18:01Z","resource":"transaction","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/transactions/37385faa-9310-5f90-b762-bf7e81098f88","instant_exchange":false,"buy":{"id":"b2d38419-fa90-5093-a631-2452abdaebf6","resource":"buy","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/buys/b2d38419-fa90-5093-a631-2452abdaebf6"},"details":{"title":"Bought bitcoin","subtitle":"using CoinStash USD Test","payment_method_name":"CoinStash USD Test"}},{"id":"9acf2add-b771-574a-8fd0-f394008e42d9","type":"sell","status":"completed","amount":{"amount":"-0.00100000","currency":"BTC"},"native_amount":{"amount":"-3.37","currency":"USD"},"description":null,"created_at":"2017-10-06T17:05:39Z","updated_at":"2017-10-06T17:05:39Z","resource":"transaction","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/transactions/9acf2add-b771-574a-8fd0-f394008e42d9","instant_exchange":false,"sell":{"id":"fa5c96ec-ed2e-57ad-8908-b9c57ee468ca","resource":"sell","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/sells/fa5c96ec-ed2e-57ad-8908-b9c57ee468ca"},"details":{"title":"Sold bitcoin","subtitle":"using CoinStash USD Test","payment_method_name":"CoinStash USD Test"}},{"id":"44aeeee6-f94d-51ba-bec2-5b4636804be5","type":"buy","status":"completed","amount":{"amount":"0.00030862","currency":"BTC"},"native_amount":{"amount":"2.35","currency":"USD"},"description":null,"created_at":"2017-10-06T17:01:06Z","updated_at":"2017-10-06T17:01:07Z","resource":"transaction","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/transactions/44aeeee6-f94d-51ba-bec2-5b4636804be5","instant_exchange":false,"buy":{"id":"b9c7d209-fd28-5432-8646-fca95586045d","resource":"buy","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/buys/b9c7d209-fd28-5432-8646-fca95586045d"},"details":{"title":"Bought bitcoin","subtitle":"using CoinStash USD Test","payment_method_name":"CoinStash USD Test"}},{"id":"53561a7a-c73b-5b6a-8b11-5fe9ebac59af","type":"buy","status":"completed","amount":{"amount":"0.00030862","currency":"BTC"},"native_amount":{"amount":"2.35","currency":"USD"},"description":null,"created_at":"2017-10-06T17:01:04Z","updated_at":"2017-10-06T17:01:05Z","resource":"transaction","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/transactions/53561a7a-c73b-5b6a-8b11-5fe9ebac59af","instant_exchange":false,"buy":{"id":"70dc1adc-30a0-581b-bc3b-bf8e273f40aa","resource":"buy","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/buys/70dc1adc-30a0-581b-bc3b-bf8e273f40aa"},"details":{"title":"Bought bitcoin","subtitle":"using CoinStash USD Test","payment_method_name":"CoinStash USD Test"}},{"id":"28014ebb-2182-5992-b881-ad650ebf3ca0","type":"sell","status":"completed","amount":{"amount":"-0.00100000","currency":"BTC"},"native_amount":{"amount":"-3.37","currency":"USD"},"description":null,"created_at":"2017-10-06T16:32:37Z","updated_at":"2017-10-06T16:32:37Z","resource":"transaction","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/transactions/28014ebb-2182-5992-b881-ad650ebf3ca0","instant_exchange":false,"sell":{"id":"9c921a04-d65a-5fe1-abee-a84b4b05bd53","resource":"sell","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/sells/9c921a04-d65a-5fe1-abee-a84b4b05bd53"},"details":{"title":"Sold bitcoin","subtitle":"using CoinStash USD Test","payment_method_name":"CoinStash USD Test"}},{"id":"ac1840c9-bc3f-5927-9874-882aab28f791","type":"sell","status":"completed","amount":{"amount":"-0.00100000","currency":"BTC"},"native_amount":{"amount":"-3.37","currency":"USD"},"description":null,"created_at":"2017-10-06T16:31:05Z","updated_at":"2017-10-06T16:31:05Z","resource":"transaction","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/transactions/ac1840c9-bc3f-5927-9874-882aab28f791","instant_exchange":false,"sell":{"id":"d1d7fb61-456b-5653-a243-d290ec1932a6","resource":"sell","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/sells/d1d7fb61-456b-5653-a243-d290ec1932a6"},"details":{"title":"Sold bitcoin","subtitle":"using CoinStash USD Test","payment_method_name":"CoinStash USD Test"}},{"id":"59caa10f-2f93-5e0c-be9c-16862f72b7bd","type":"buy","status":"completed","amount":{"amount":"0.00030899","currency":"BTC"},"native_amount":{"amount":"2.35","currency":"USD"},"description":null,"created_at":"2017-10-06T16:14:34Z","updated_at":"2017-10-06T16:14:59Z","resource":"transaction","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/transactions/59caa10f-2f93-5e0c-be9c-16862f72b7bd","instant_exchange":false,"buy":{"id":"a7f79920-ef38-5c43-a8cb-bf5e1cfc9f78","resource":"buy","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/buys/a7f79920-ef38-5c43-a8cb-bf5e1cfc9f78"},"details":{"title":"Bought bitcoin","subtitle":"using CoinStash USD Test","payment_method_name":"CoinStash USD Test"}},{"id":"8416a7fb-71ab-58e9-b84b-41b046ffab06","type":"sell","status":"completed","amount":{"amount":"-0.00024000","currency":"BTC"},"native_amount":{"amount":"-0.05","currency":"USD"},"description":null,"created_at":"2017-10-06T16:14:31Z","updated_at":"2017-10-06T16:14:31Z","resource":"transaction","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/transactions/8416a7fb-71ab-58e9-b84b-41b046ffab06","instant_exchange":false,"sell":{"id":"bed3299d-61d9-5916-8050-6a47218c41f3","resource":"sell","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/sells/bed3299d-61d9-5916-8050-6a47218c41f3"},"details":{"title":"Sold bitcoin","subtitle":"using CoinStash USD Test","payment_method_name":"CoinStash USD Test"}},{"id":"a913a162-8fa6-50f4-894c-73aae5f1f6b4","type":"buy","status":"completed","amount":{"amount":"0.00030899","currency":"BTC"},"native_amount":{"amount":"2.35","currency":"USD"},"description":null,"created_at":"2017-10-06T16:14:25Z","updated_at":"2017-10-06T16:14:45Z","resource":"transaction","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/transactions/a913a162-8fa6-50f4-894c-73aae5f1f6b4","instant_exchange":false,"buy":{"id":"e0c06f01-0707-5a94-83e8-41829d94fbc8","resource":"buy","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/buys/e0c06f01-0707-5a94-83e8-41829d94fbc8"},"details":{"title":"Bought bitcoin","subtitle":"using CoinStash USD Test","payment_method_name":"CoinStash USD Test"}},{"id":"e2c634ef-bfc1-5e2e-acf5-a8cce8fdd745","type":"send","status":"completed","amount":{"amount":"-0.00024000","currency":"BTC"},"native_amount":{"amount":"-1.04","currency":"USD"},"description":null,"created_at":"2017-10-05T20:39:25Z","updated_at":"2017-10-05T20:39:25Z","resource":"transaction","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/transactions/e2c634ef-bfc1-5e2e-acf5-a8cce8fdd745","instant_exchange":false,"network":{"status":"off_blockchain"},"to":{"id":"c4a6215f-69b1-5e36-9d12-6c17ade35c01","resource":"user","resource_path":"/v2/users/c4a6215f-69b1-5e36-9d12-6c17ade35c01"},"details":{"title":"Sent bitcoin","subtitle":"to sarah schaab"}},{"id":"e388ac41-7b62-5984-a264-44f243daedd4","type":"buy","status":"completed","amount":{"amount":"0.00031100","currency":"BTC"},"native_amount":{"amount":"2.35","currency":"USD"},"description":null,"created_at":"2017-10-05T20:37:59Z","updated_at":"2017-10-05T20:38:01Z","resource":"transaction","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/transactions/e388ac41-7b62-5984-a264-44f243daedd4","instant_exchange":false,"buy":{"id":"12ae4657-ffb6-5661-9e7b-48f8d586cc23","resource":"buy","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/buys/12ae4657-ffb6-5661-9e7b-48f8d586cc23"},"details":{"title":"Bought bitcoin","subtitle":"using CoinStash USD Test","payment_method_name":"CoinStash USD Test"}},{"id":"05bb6ac1-c3af-5367-9e8b-7bb34bd2f581","type":"send","status":"completed","amount":{"amount":"-0.00024000","currency":"BTC"},"native_amount":{"amount":"-1.03","currency":"USD"},"description":null,"created_at":"2017-10-05T18:54:21Z","updated_at":"2017-10-05T18:54:21Z","resource":"transaction","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/transactions/05bb6ac1-c3af-5367-9e8b-7bb34bd2f581","instant_exchange":false,"network":{"status":"off_blockchain"},"to":{"id":"c4a6215f-69b1-5e36-9d12-6c17ade35c01","resource":"user","resource_path":"/v2/users/c4a6215f-69b1-5e36-9d12-6c17ade35c01"},"details":{"title":"Sent bitcoin","subtitle":"to sarah schaab"}},{"id":"6d512811-28f9-5981-9ef9-b7055b3fcd88","type":"sell","status":"completed","amount":{"amount":"-0.00100000","currency":"BTC"},"native_amount":{"amount":"-3.33","currency":"USD"},"description":null,"created_at":"2017-10-05T18:51:55Z","updated_at":"2017-10-05T18:51:55Z","resource":"transaction","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/transactions/6d512811-28f9-5981-9ef9-b7055b3fcd88","instant_exchange":false,"sell":{"id":"fb0e07d6-39ff-5ba7-8f7c-e5d5ae20acc9","resource":"sell","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/sells/fb0e07d6-39ff-5ba7-8f7c-e5d5ae20acc9"},"details":{"title":"Sold bitcoin","subtitle":"using CoinStash USD Test","payment_method_name":"CoinStash USD Test"}},{"id":"767fc85e-8288-5269-b227-f62344da8d97","type":"sell","status":"completed","amount":{"amount":"-0.00100000","currency":"BTC"},"native_amount":{"amount":"-3.32","currency":"USD"},"description":null,"created_at":"2017-10-05T18:44:44Z","updated_at":"2017-10-05T18:44:44Z","resource":"transaction","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/transactions/767fc85e-8288-5269-b227-f62344da8d97","instant_exchange":false,"sell":{"id":"3e695c0b-0197-5185-ac50-2f7375dfda52","resource":"sell","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/sells/3e695c0b-0197-5185-ac50-2f7375dfda52"},"details":{"title":"Sold bitcoin","subtitle":"using CoinStash USD Test","payment_method_name":"CoinStash USD Test"}},{"id":"744660f2-f892-5f74-b4fb-f37f595f84e6","type":"send","status":"completed","amount":{"amount":"-0.00024000","currency":"BTC"},"native_amount":{"amount":"-1.03","currency":"USD"},"description":null,"created_at":"2017-10-05T16:19:58Z","updated_at":"2017-10-05T16:19:58Z","resource":"transaction","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/transactions/744660f2-f892-5f74-b4fb-f37f595f84e6","instant_exchange":false,"network":{"status":"off_blockchain"},"to":{"resource":"email","email":"Adam@adam.com"},"details":{"title":"Sent bitcoin","subtitle":"to Adam@adam.com"}},{"id":"fabfe7c9-550c-5ff8-85d7-5783dccd9102","type":"send","status":"completed","amount":{"amount":"-0.00024000","currency":"BTC"},"native_amount":{"amount":"-1.03","currency":"USD"},"description":null,"created_at":"2017-10-05T16:18:34Z","updated_at":"2017-10-05T16:18:34Z","resource":"transaction","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/transactions/fabfe7c9-550c-5ff8-85d7-5783dccd9102","instant_exchange":false,"network":{"status":"off_blockchain"},"to":{"resource":"email","email":"Adam@adam.com"},"details":{"title":"Sent bitcoin","subtitle":"to Adam@adam.com"}},{"id":"50ab4065-49f3-5756-8b26-3c15c1c415a9","type":"send","status":"completed","amount":{"amount":"-0.00024000","currency":"BTC"},"native_amount":{"amount":"-1.03","currency":"USD"},"description":null,"created_at":"2017-10-05T16:12:59Z","updated_at":"2017-10-05T16:12:59Z","resource":"transaction","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/transactions/50ab4065-49f3-5756-8b26-3c15c1c415a9","instant_exchange":false,"network":{"status":"off_blockchain"},"to":{"resource":"email","email":"Adam@adam.com"},"details":{"title":"Sent bitcoin","subtitle":"to Adam@adam.com"}},{"id":"a0e958c9-cf4f-5c1f-b5a1-f226d34a13f4","type":"buy","status":"completed","amount":{"amount":"0.00031967","currency":"BTC"},"native_amount":{"amount":"2.35","currency":"USD"},"description":null,"created_at":"2017-10-05T01:38:25Z","updated_at":"2017-10-05T01:38:26Z","resource":"transaction","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/transactions/a0e958c9-cf4f-5c1f-b5a1-f226d34a13f4","instant_exchange":false,"buy":{"id":"57ae978f-bd86-5565-a05d-c3010c671449","resource":"buy","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/buys/57ae978f-bd86-5565-a05d-c3010c671449"},"details":{"title":"Bought bitcoin","subtitle":"using CoinStash USD Test","payment_method_name":"CoinStash USD Test"}},{"id":"aa065db5-6933-55cd-ab40-4cc5d500d11d","type":"buy","status":"completed","amount":{"amount":"0.00032015","currency":"BTC"},"native_amount":{"amount":"2.35","currency":"USD"},"description":null,"created_at":"2017-10-05T01:16:08Z","updated_at":"2017-10-05T01:16:09Z","resource":"transaction","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/transactions/aa065db5-6933-55cd-ab40-4cc5d500d11d","instant_exchange":false,"buy":{"id":"79d35960-4042-552d-88de-e24bea964b0e","resource":"buy","resource_path":"/v2/accounts/d81d3213-097e-5b97-ba47-7d88077ab808/buys/79d35960-4042-552d-88de-e24bea964b0e"},"details":{"title":"Bought bitcoin","subtitle":"using CoinStash USD Test","payment_method_name":"CoinStash USD Test"}}]
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
