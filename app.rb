require 'rubygems'				#encoding: utf-8
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello!!! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end

post '/visit' do
											
	@username = params[:username]
	@phone    = params[:phone]
	@datetime = params[:datetime]
	@master = params[:master]
	@color = params[:color]

#	erb "Ok! user is #{@username}, #{@phone}, #{@datetime}, #{@master}"

	@title = 'Thank you!'
	if @username != nil
		@message = "Dear #{@username}, we'll be waiting for you at #{@datetime} to master #{@master}, color #{@color}"	

		f = File.open './public/users.txt', 'a'
		f.write("User: #{@username}, Phone: #{@phone}, Date and time: #{@datetime}, master #{@master}, color #{@color}")
		f.write("\r\n")
		f.close

   		erb :message
	end
end

get '/contacts' do
	erb :contacts
end

post '/contacts' do
	@email   = params[:email]
	@message = params[:message]

	@title = 'Thank you! Thank you!'
	if @email != nil
		@message = "For #{@email}, message '#{@message}'"	

		f = File.open './public/contacts.txt', 'a'
		f.write("For email: #{@email}, message: '#{@message}'")
		f.write("\r\n")
		f.close

   		erb :message
	end
end

