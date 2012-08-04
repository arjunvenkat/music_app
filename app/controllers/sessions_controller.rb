class SessionsController < ApplicationController
  
  def create
    
    auth_hash = env['omniauth.auth']
    if User.find_by_uid(auth_hash["uid"])
      user = User.find_by_uid(auth_hash["uid"])
    else
      user = User.new
      user.uid = auth_hash["uid"] 
      user.provider = auth_hash["provider"]
      user.name = auth_hash["info"]["name"]
      #raise user.id.inspect
      user.save
    end
    
    
    session[:user_id] = user.uid
    redirect_to root_url, notice: "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end
  
end
