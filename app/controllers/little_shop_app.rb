class LittleShopApp < Sinatra::Base
  set :method_override, true

  get '/' do
    @merchant_time = Merchant.last_updated
    @item_time     = Item.last_updated
    @invoice_time  = Invoice.last_updated
    @title = 'Welcome to Little Shop'
    erb :'welcome'
  end

  get '/merchants' do
    @merchants = Merchant.all.order(:name)
    @title = 'Little Shop - Merchant Index'
    erb :'merchants/index'
  end

  get '/merchants/new' do
    @title = 'Little Shop - Create A New Merchant'
    erb :'merchants/new'
  end

  post '/merchants/new' do
    new_merchant = Merchant.create(params[:merchant])
    redirect "/merchants/#{new_merchant.id}"
  end

  get '/merchants/:id' do
    @merchant = Merchant.find(params[:id])
    @title    = "Little Shop - #{@merchant.name}"
    erb :'merchants/show'
  end

  get '/merchants/:id/edit' do
    @merchant = Merchant.find(params[:id])
    @title    = "Little Shop - Edit #{@merchant.name}"
    erb :'merchants/edit'
  end

  put '/merchants/:id' do |id|
    Merchant.update(id.to_i, params[:merchant])
    redirect "/merchants/#{id.to_i}"
  end

  delete '/merchants/:id' do |id|
    Merchant.destroy(id.to_i)
    redirect '/merchants'
  end

  get '/items' do
    @items = Item.all
    @title = 'Little Shop - Item Index'
    erb :'items/index'
  end

  get '/items/new' do
    @merchants = Merchant.all.order(:name)
    @title     = 'Little Shop - Create A New Item'
    erb :'items/new'
  end

  post '/items/new' do
    new_item = Item.create(params[:item])
    redirect "/items/#{new_item.id}"
  end

  get '/items/:id' do
    @item  = Item.find(params[:id])
    @title = "Little Shop - #{@item.name}"
    erb :'items/show'
  end

  get '/items/:id/edit' do
    @item = Item.find(params[:id])
    @merchants = Merchant.all
    @title     = "Little Shop - Edit #{@item.name}"
    erb :'items/edit'
  end

  put '/items/:id/edit' do |id|
    Item.update(id.to_i, params[:item])
    redirect "items/#{id}"
  end

  delete '/items/:id' do |id|
    Item.destroy(id.to_i)
    redirect '/items'
  end

  get '/invoices' do
    @invoices = Invoice.all
    erb :'invoices/index'
  end

  get '/invoices/:id' do |id|
    @invoice = Invoice.find(id)
    erb :'invoices/show'
  end

  put '/invoices/:id/edit' do |id|
    Invoice.update(id.to_i, params[:id])
    redirect "/invoices/#{id}"
  end

  helpers do
    def number_to_currency(number)
      number = (number.to_f/100)
      ('$%.2f' % number).to_s
    end
  end
end
