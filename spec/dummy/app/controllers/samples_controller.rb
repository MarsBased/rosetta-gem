class SamplesController < ApplicationController

  def index
    # TODO: move to an specific class to initialize proccess with the config
    # Is requires to initialize Translate Menu
    RequestStore.store[:used_phrases] = []
  end

end
