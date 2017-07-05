module Mroonga
  extend ActiveSupport::Concern
  included do
    scope :mrn_search, ->(query, columns) do
      return if query.nil?
      where("MATCH(#{columns}) AGAINST(? IN BOOLEAN MODE)", "*DOR #{query}")
    end
  end
end