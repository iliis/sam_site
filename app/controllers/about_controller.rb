class AboutController < ApplicationController
  def index
  end

  def pubkey
    send_file "app/assets/data/pubkey.asc"
  end
end
