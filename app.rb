require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "pizzashop.db"}

class Product < ActiveRecord::Base

end

class Order < ActiveRecord::Base

end

get '/' do
	
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/index' do
	@products = Product.all
	erb :index
end

get '/about' do
	erb :about
end

post '/cart' do

	# Получаем список параметров и разбираем их (parse)

	@orders_input = params[:orders]
	@items = parse_orders_line(@orders_input)

	# Выводим сообщение если корзина пуста

	if @items.length == 0
		@error = "Your cart is empty"
		return erb :cart_is_empty
	end

	# Возвращаем список продуктов
	
	@items.each do |item|
		item[0] = Product.find(item[0])
	end

	erb :cart
end

post '/place_order' do
	@order_new = Order.create params[:order]


	erb :place_order
end


def parse_orders_line(orders_input)

    s1 = orders_input.split(',')

    arr = []

    s1.each do |x|
        s2 = x.split("=")
        s3 = s2[0].split("_")
        
        id = s3[1]
        cnt = s2[1]

        arr2 = [id, cnt]

        arr.push(arr2)
    end

    return arr

end
