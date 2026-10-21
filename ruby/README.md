# Human Name Parser API - Ruby Gem

Human Name Parser splits full name strings into first, middle, and last names, titles, nicknames, and suffixes. It also generates initials directly from the detected components.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_humannameparser'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_humannameparser
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_humannameparser'

# Initialize the client
client = APIVerve::Humannameparser::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({ name: "MR. MARTINO PETROS DE FLORENCE (TINO) Jr." })

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ name: "MR. MARTINO PETROS DE FLORENCE (TINO) Jr." })
  puts response["data"]
rescue APIVerve::Humannameparser::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Humannameparser::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Humannameparser::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
```

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "name": "MR. MARTINO PETROS DE FLORENCE (TINO) Jr.",
    "parsed": {
      "title": "Mr.",
      "first": "Martino",
      "middle": "Petros",
      "last": "de Florence",
      "nick": "Tino",
      "suffix": "Jr."
    },
    "initials": "MPF",
    "formalName": "Mr. de Florence, Martino P. Jr."
  }
}
```

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/humannameparser?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/humannameparser?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/humannameparser?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
