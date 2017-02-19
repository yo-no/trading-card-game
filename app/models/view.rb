class View < ApplicationRecord

  def show_hand(player)
    player.hand.each do |card|
      puts "#{hand.index(card)}. #{card.name} cost: #{card.cost} attack: #{card.attack} "
    end
  end

  def attack_query
    puts "input the number next to the card you want to attack with or input 'end' when you are finished"
    input = gets.chomp
  end 


end
