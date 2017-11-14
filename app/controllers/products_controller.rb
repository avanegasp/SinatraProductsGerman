require 'sinatra'

# index: listar los productos
get '/products' do
  @products = Product.all
  erb :index
end

# new: mostrar el formulario para crear el producto
get '/products/new' do
  @product = Product.new
  erb :new
end

# show: mostrar un producto
get '/products/:id' do
  @product = Product.find(params[:id])
  erb :show
end

# create: crear un producto
post '/products' do
  # Product.create(name: params[:name])
  # redirect_to '/products'

  @product = Product.new(name: params[:name])
  if @product.save
    redirect '/products'
  else
    erb :new
  end
end

# edit: mostrar el formulario para editar el producto
get '/products/:id/edit' do
  @product = Product.find(params[:id])
  erb :edit
end

# update: actualizar el producto
patch '/products/:id' do
  @product = Product.find(params[:id])
  @product.name = params[:name]
  if @product.save
    redirect '/products'
  else
    erb :edit
  end
end

# destroy: eliminar el producto
delete '/products/:id' do
  product = Product.find(params[:id])
  product.destroy
  redirect '/products'
end


# GET    /products              index
# GET    /products/:id          show
# GET    /products/new          new
# POST   /products              create
# GET    /products/:id/edit     edit
# PUT    /products/:id          update
# DELETE /products/:id          destroy
