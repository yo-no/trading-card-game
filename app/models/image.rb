class Image < ApplicationRecord
  belongs_to :imageable_type, polymorphic: true
  
end
