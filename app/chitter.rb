require 'sinatra/base'
require 'data_mapper'
require './lib/maker'
require 'haml'

require_relative 'helpers/application'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

	helpers ApplicationHelpers

	get '/' do
		'Hello Chitter!'
	end

	get '/makers/new' do
  		haml :"makers/new"
	end

	post '/makers' do
		maker = Maker.new(:email => params[:email], 
						:password => params[:password],
						:handle => params[:handle],
						:name => params[:name])
		maker.save
		session[:maker_id] = maker.id
		redirect to('/')
	end

	# start the server if ruby file executed directly
	run! if app_file == $0
end
