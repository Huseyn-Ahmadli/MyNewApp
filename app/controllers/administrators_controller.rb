class AdministratorsController < ApplicationController

  def new
    @administrators = Administrator.new
  end

end
