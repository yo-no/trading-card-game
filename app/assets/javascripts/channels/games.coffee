App.room = App.cable.subscriptions.create "GamesChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    switch data.action
      when "attack"
        $("#attackModal#{data.card_id}").modal('show'); 
      when "end_turn"
        $('#endModal').modal('show');

        

    
  
    

