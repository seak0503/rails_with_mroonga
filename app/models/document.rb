class Document < ApplicationRecord
  scope :full_text_search, -> (query) {
    where("MATCH(content) AGAINST(? IN BOOLEAN MODE)", "*D+ #{query}")
  }
end
