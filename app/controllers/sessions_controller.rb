class SessionsController < ApplicationController


    get '/login' do
        erb :'sessions/login'
    end

    post '/login' do
        #find the user - by username
        user = User.find_by(username: params[:username])
        # check to see if the user exists and if the password matches
        if user && user.authenticate(params[:password])
            # put the user into sessions
            session[:user_id] = user.id
            # redirect them somewhere
            redirect "/thoughts"
        # if they don't, then redirect somewhere else
        else
            flash[:notice] = "You've entered the incorrect information. Please try again."
            redirect "/login"
        end
    end


    get '/logout' do
        session.clear
        redirect "/login"
    end



end