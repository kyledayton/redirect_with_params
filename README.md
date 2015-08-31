# Redirect With Params

Preserve query parameters through Rails routing redirects  
Compatible with Rails 3.2+ & Rails 4

## Installation

Add this line to your application's `Gemfile`:

```ruby
gem 'redirect_with_params'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install redirect_with_params

## Usage

Use `redirect_with_params` in place of `redirect` in your Routes file. This will preserve the query parameters in the redirect.

```ruby
My::Application.routes.draw do
  get "some/route/:id" => redirect_with_params { |path_params, request| "/some/new/route/#{path_params[:id]}" }
end
```

Navigating your browser to `/some/route/123?my_param=zebra&source=web` will redirect you to `/some/new/route/123?my_param=zebra&source=web`

Optionally, you can specify a param whitelist:

```ruby
My::Application.routes.draw do
  get "some/route/:id" => redirect_with_params(:source) { |path_params, request| "/some/new/route/#{path_params[:id]}" }
end
```

Navigating your browser to `/some/route/123?my_param=zebra&source=web` will redirect you to `/some/new/route/123?source=web`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
