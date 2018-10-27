# CraftEd OmniAuth Strategy

This gem provides a simple way to authenticate to the Craft Academy LMS (based on openEdx) using OmniAuth with OAuth2.

## Installation

Add this line to your application's Gemfile:

    gem 'crafted_oauth'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install crafted_oauthy

## Usage

You'll need to register an app on Spotify, you can do this here - https://developer.spotify.com/my-applications/#!/applications

Usage of the gem is very similar to other OmniAuth strategies.
You'll need to add your app credentials to `config/initializers/devise.rb`:

```ruby
  config.omniauth :crafted_oauth,
                  'client_id',
                  'client_secret',
                  scope: 'email profile'
```

Please replace the example `scope` provided with your own.


