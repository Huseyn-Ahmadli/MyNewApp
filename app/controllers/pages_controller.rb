class PagesController < ApplicationController
  def index
    @username = params[:username]
    render 'pages/index'
  end

end
