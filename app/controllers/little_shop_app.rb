class LittleShopApp < Sinatra::Base
  set :method_override, true

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

end
