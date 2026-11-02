# Human Name Parser API - Dart/Flutter Client

Human Name Parser splits full name strings into first, middle, and last names, titles, nicknames, and suffixes. It also generates initials directly from the detected components.

[![pub package](https://img.shields.io/pub/v/apiverve_humannameparser.svg)](https://pub.dev/packages/apiverve_humannameparser)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Human Name Parser API](https://apiverve.com/marketplace/humannameparser?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_humannameparser: ^1.2.4
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_humannameparser/apiverve_humannameparser.dart';

void main() async {
  final client = HumannameparserClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'name': 'MR. MARTINO PETROS DE FLORENCE (TINO) Jr.'
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

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

## API Reference

- **API Home:** [Human Name Parser API](https://apiverve.com/marketplace/humannameparser?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/humannameparser](https://docs.apiverve.com/ref/humannameparser?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
