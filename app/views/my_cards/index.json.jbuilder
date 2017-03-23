json.array! @my_cards.each do |my_card|
  json.user_id my_card.user_id
  json.card_id my_card.card_id
  json.deck my_card.deck
  json.status my_card.status
end