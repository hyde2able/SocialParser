require 'social_parser/provider/base'

module SocialParser
  module Provider
    class Medium < Base
      URL_FORMATS = {
        full: /\A((http|https)?:\/\/)?(www\.)?medium\.com\/(?<id>@[\w\-\.]+)\/?/i
      }

      def provider
        :medium
      end

      def url
        "https://medium.com/#{username}"
      end

      private

      def parse_from_url
        URL_FORMATS.values.each do |format|
          m = format.match(url_from_attributes)
          return m[:id].sub(/\?.*/m, '') if m
        end
        nil
      end
    end
  end
end
