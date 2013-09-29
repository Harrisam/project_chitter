require 'sinatra/base'
require 'data_mapper'
require './lib/maker'
require 'haml'

require_relative 'helpers/application'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

	helpers ApplicationHelpers

	get '/' do
		'this is the home page where you see the list of peeps
		a button to go to log in, for current makers, so they can peeps
		and a button to sign up for new makers. SHOULD REDIRECT TO BOTH /makers/new or '
		# redirect to('/')
	end

	get '/makers/new' do
  		haml :"makers/new"
	end

	get '/makers/login' do 
		"this is where returning makers log in"
	end

	get '/makers' do
		"This is where existing makers log in "
	end

	post '/makers' do
		maker = Maker.new(:email => params[:email], 
						:password => params[:password],
						:password_confirmation =>params[:password_confirmation],
						:handle => params[:handle],
						:name => params[:name])
		maker.save
		session[:maker_id] = maker.id
		redirect to('/') #have a loop here between homepage and new
	end

	# start the server if ruby file executed directly
	run! if app_file == $0
end


