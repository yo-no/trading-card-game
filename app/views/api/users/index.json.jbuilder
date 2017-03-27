json.array! @users.each do |user|
  json.id user.id
  json.name user.name
  json.medium_avatar_url user.medium_avatar_url
  json.large_avatar_url user.large_avatar_url
  json.cards user.cards do |card|
    json.card_id card.id
    json.name card.name
    json.cost card.cost
    json.attack card.attack
    json.description card.description
    json.action_text card.action_text
    json.image_file_name card.image_file_name
    json.medium_image_url card.medium_image_url
    json.large_image_url card.large_image_url
  end
end