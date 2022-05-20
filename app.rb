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

get '/cart' do
	@products = Product.all
	erb :cart
end

post '/cart' do
	order_new = Order.new params[:order]
	order_new.save
	redirect to '/order'
end

get '/order' do
	@orders = Order.all
	erb :order
end

