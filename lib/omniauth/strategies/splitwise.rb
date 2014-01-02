require 'omniauth/strategies/oauth'

module OmniAuth
  module Strategies
    class Splitwise < OmniAuth::Strategies::OAuth
      option :name, "splitwise"

      option :client_options, {
        :site => 'https://secure.splitwise.com',
        :request_token_path => '/api/v3.0/get_request_token',
        :access_token_path => '/api/v3.0/get_access_token',
        :authorize_path => '/authorize',
        :http_method => :post,
        :scheme => :header
      }

      uid do
        user_data['id']
      end

      info do
        user_data
      end

private

      def user_data
        @info ||= MultiJson.decode(access_token.get('/api/v3.0/get_current_user').body)['user']
      end

      def callback_phase
        session['oauth'][name.to_s]['callback_confirmed'] = true
        super
      end
    end
  end
end
