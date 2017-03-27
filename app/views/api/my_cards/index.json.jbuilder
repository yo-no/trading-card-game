json.array! @my_cards.each do |my_card|
  json.user_id my_card.user_id
  json.card_id my_card.card_id
  json.deck my_card.deck
  json.status my_card.status
  json.card_name my_card.card.name
  json.card_cost my_card.card.cost
  json.card_attack my_card.card.attack
  json.card_description my_card.card.description
  json.card_action_text my_card.card.action_text
  json.card_image_file_name my_card.card.image_file_name
  json.card_medium_image_url my_card.card.medium_image_url
  json.card_large_image_url my_card.card.large_image_url
end