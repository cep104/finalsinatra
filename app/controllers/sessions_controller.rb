class SessionsController < ApplicationController 
    get '/login' do 
        erb :"sessions/login"
    end

    post '/login' do 
            user = User.find_by(username: params[:username])
            if user && user.authenticate(params[:password])
                session[:username] = user.username
                redirect '/distilleries'
            else 
                @errors = ["Invalid username or password"]
                erb :'/failure'
            end
    end  

    get '/logout' do
        logout
        redirect '/'
    end
end