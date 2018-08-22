class StaticPagesController < ApplicationController
  before_action :check_session, except:[:home]
  def home
  end

end
