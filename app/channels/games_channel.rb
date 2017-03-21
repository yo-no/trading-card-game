class GamesChannel < ApplicationCable::Channel  
  def subscribed
    stream_from 'game_channel'
  end

  def unsubscribed
    
  end

  

end 