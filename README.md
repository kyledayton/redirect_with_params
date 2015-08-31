# Redirect With Params

Preserve query parameters through Rails routing redirects

## Installation

Add this line to your application's `Gemfile`:

```ruby
gem 'redirect_with_params', require: false
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install redirect_with_params

Add this line to your `config/routes.rb`:

```ruby
require 'redirect_with_params'
```

## Usage

Use `redirect_with_params` in place of `redirect` in your Routes file. This will perserve the query parameters in the redirect.

```ruby
My::Application.routes.draw do
  get "some/route/:id" => redirect_with_params { |path_params, request| "/some/new/route/#{path_params[:id]}" }
end
```

Navigating your browser to `/some/route/123?my_param=zebra` will redirect you to `/some/new/route/123?my_param=zebra`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
