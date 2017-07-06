module Mroonga
  extend ActiveSupport::Concern
  included do
    scope :mrn_search, ->(query, columns) do
      return if query.nil?
      where("MATCH(#{columns}) AGAINST(? IN BOOLEAN MODE)", "*DOR #{query}")
    end

    scope :mrn_snippet, ->(query, snippet_columns, options = {}) do
      return if query.nil? or query == ''
      keywords = mrn_extract_keywords(query)
      return if keywords.nil? or keywords == []

      keyword_prefix = options[:keyword_prefix] || "<span class=\"keyword\">"
      keyword_suffix = options[:keyword_suffix] || "</span>"
      max_bytes = options[:max_bytes] || 150
      max_count = options[:max_count] || 3
      encoding = options[:encoding] || "ascii_general_ci"
      skip_leading_spaces = options[:skip_leading_spaces] || 1
      html_escape = options[:html_escape] || 1
      snippet_prefix = options[:snippet_prefix] || "..."
      snippet_suffix = options[:snippet_suffix] || "..."

      snippet_query = keywords.collect { |keyword|
        "'#{keyword}', '#{keyword_prefix}', '#{keyword_suffix}'"
      }
      snippet_query = snippet_query.join(', ')

      snippets = snippet_columns.split(',').collect { |column|
        "mroonga_snippet(#{column},
        #{max_bytes}, #{max_count},
        '#{encoding}',
        #{skip_leading_spaces}, #{html_escape},
        '#{snippet_prefix}', '#{snippet_suffix}',
        #{snippet_query}
        ) AS #{column}"
      }

      columns = attribute_names - snippet_columns.split(',')
      columns << snippets
      Rails.logger.debug("デバッグ")
      Rails.logger.debug(columns)
      select(columns)
    end

    def self.mrn_escape_query(query)
      query = query.gsub(/"/, "\\\\\"")
      query = query.gsub(/'/, "\\\\'")
      query = query.gsub(/\(/, "\\\\\\(")
      query = query.gsub(/\)/, "\\\\\\)")
      query = query.gsub(/>/, "\\\\\\>")
      query = query.gsub(/</, "\\\\\\<")
    end

    def self.mrn_extract_keywords(query)
      return nil if query.nil?
      query = query.gsub(/'/, "''")
      phrases = query.scan(/"[^"]*"/)
      phrases = phrases.collect do |phrase|
        phrase.gsub(/"/, "")
      end
      phrases.delete("")
      query_excluded_phrases = query.gsub(/"[^"]*"/, '')
      words = query_excluded_phrases.split(/[　\s+-\\*()]+/)
      words.delete("OR")
      words.delete("")

      words + phrases
    end
  end
end