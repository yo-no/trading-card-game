json.array! @cards.each do |card|
  json.name card.name
  json.cost card.cost
  json.attack card.attack
  json.description card.description
  json.action_text card.action_text
  json.image_file_name card.image_file_name
  json.medium_image_url card.medium_image_url
  json.large_image_url card.large_image_url
end