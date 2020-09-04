require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Splitwise < OmniAuth::Strategies::OAuth2
      BASE_SITE = 'https://secure.splitwise.com/'.freeze

      option :name, "splitwise"
      option :client_options, site: BASE_SITE

      uid do
        raw_info.fetch('id')
      end

      info do
        {
          'first_name' => raw_info['first_name'],
          'last_name' => raw_info['last_name'],
          'email' => raw_info['email'],
        }
      end

      extra do
        raw_info
      end

      private

      def raw_info
        @raw_info ||= access_token.get('/api/v3.0/get_current_user').parsed['user']
      end

      # We must override callback_url due to this issue:
      # https://github.com/omniauth/omniauth-oauth2/issues/93
      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end
