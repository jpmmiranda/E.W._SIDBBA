class LocaisController < ApplicationController
 def index
	  @locais = Locai.all
  end
end
