require 'rubygems'				#encoding: utf-8
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello!!! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
#	@error = 'something wrong!!!'
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

	# хеш, сообщения об ошибках для каждой переменной
	hh = {:username => 'Введите имя!', 
		  :phone => 'Введите номер телефона!', 
		  :datetime => 'Неправильная дата и время!'}

	# для каждой пары значение-ключ	  
	hh.each do |key, value|
		# если параметр пуст
		if params[key] == ''
			@error = hh[key]
			return erb :visit
		end
	end

	@title = 'Thank you!'

	if @username != nil && @phone != nil && @datetime != nil
		@message = "Dear #{@username}, we'll be waiting for you at #{@datetime} to master #{@master}, color #{@color}"	

		f = File.open './public/users.txt', 'a'
		f.write("User: #{@username}, Phone: #{@phone}, Date and time: #{@datetime}, master #{@master}, color #{@color}")
		f.write("\r\n")
		f.close

   		erb :message
   	else 
   		@error = 'something wrong!!!'
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

