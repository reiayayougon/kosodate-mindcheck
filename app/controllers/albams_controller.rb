class AlbamsController < ApplicationController
  def index
    if current_user.status == 0
      current_user.reset_status
      current_user.update(status: 100) 
    end
  end
end
