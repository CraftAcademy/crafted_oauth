# frozen_string_literal: true

require 'omniauth/strategies/oauth2'
require 'date'

module OmniAuth
  module Strategies
    class CraftedOauth < OmniAuth::Strategies::OAuth2
      option :name, 'crafted_oauth'

      args %i[
        client_id
        client_secret
        domain
      ]

      option :client_options,
             site:           'https://class.craftacademy.co',
             authorize_url:  'https://class.craftacademy.co/oauth2/authorize',
             token_url:      'https://class.craftacademy.co/oauth2/access_token'

      uid { raw_info['sub'] }

      info do
        {
          email: raw_info['email'],
          name: raw_info['name'],
          image_url: image_url
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def image_url
        raw_info['profile_image']['image_url_full'] if raw_info['profile_image']['has_image']
      end

      def raw_info
        @raw_info ||= access_token.get('/api/user/v1/accounts').parsed.first
      end

      def callback_url
        if @authorization_code_from_signed_request_in_cookie
          ''
        else
          # Fixes regression in omniauth-oauth2 v1.4.0 by https://github.com/intridea/omniauth-oauth2/commit/85fdbe117c2a4400d001a6368cc359d88f40abc7
          options[:callback_url] || (full_host + script_name + callback_path)
        end
      end

      # Normalize a domain to a URL.
      def domain_url
        domain_url = URI(options.domain)
        domain_url = URI("https://#{domain_url}") if domain_url.scheme.nil?
        domain_url.to_s
      end
    end
  end
end
