# Human Name Parser API - PHP Package

Human Name Parser is a simple tool for parsing human names into their components. It returns the parsed components of the human name.

## Installation

Install via Composer:

```bash
composer require apiverve/humannameparser
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Humannameparser\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute(['name' => 'MR. MARTINO PETROS DE FLORENCE (TINO) Jr.']);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Humannameparser\Client;
use APIVerve\Humannameparser\Exceptions\APIException;
use APIVerve\Humannameparser\Exceptions\ValidationException;

try {
    $response = $client->execute(['name' => 'MR. MARTINO PETROS DE FLORENCE (TINO) Jr.']);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/humannameparser?utm_source=packagist&utm_medium=readme).

## Support

- Website: [https://apiverve.com/marketplace/humannameparser?utm_source=php&utm_medium=readme](https://apiverve.com/marketplace/humannameparser?utm_source=php&utm_medium=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
