class LittleShopApp < Sinatra::Base
  set :method_override, true

  get '/' do
    erb :'index'
  end

  get '/merchants' do
    @merchants = Merchant.all
    erb :'merchants/index'
  end

  get '/merchants/new' do
    erb :'merchants/new'
  end

  post '/merchants/new' do
    new_merchant = Merchant.create(params[:merchant])
    redirect "/merchants/#{new_merchant.id}"
  end

  get '/merchants/:id' do
    @merchant = Merchant.find(params[:id])
    erb :'merchants/show'
  end

  get '/merchants/:id/edit' do
    @merchant = Merchant.find(params[:id])
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
    erb :'items/index'
  end

  get '/items/new' do
    @merchants = Merchant.all
    erb :'items/new'
  end

  post '/items/new' do
    new_item = Item.create(params[:item])
    redirect "/items/#{new_item.id}"
  end

  get '/items/:id' do
    @item = Item.find(params[:id])
    erb :'items/show'
  end

  get '/items/:id/edit' do
    @item = Item.find(params[:id])
    @merchants = Merchant.all
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

  get '/invoices/:id/edit' do |id|
    @invoice = Invoice.find(id)
    @merchants = Merchant.all
    erb :'invoices/edit'
  end

  put '/invoices/:id/edit' do |id|
    Invoice.update(id.to_i, params[:invoice])
    redirect "/invoices/#{id}"
  end

  delete '/invoices/:id' do
    Invoice.destroy(id.to_i)
    redirect '/invoices'
  end

  helpers do
    def number_to_currency(number)
      ('$%.2f' % number).to_s
    end
  end
end
