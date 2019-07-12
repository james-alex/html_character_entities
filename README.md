# html_character_entities

A Dart utility class containing a map of key/value pairs for every
HTML 4.01 character entity, including ASCII codes, and a method to
parse strings for those character entities.

# Using

```dart
import 'package:html_character_entities/html_character_entities.dart';
```

## Parsing Strings

```dart
String string = 'An ampersand can be written as &amp; and &#38;.';

print(HtmlCharacterEntities.parse(string)); // An ampersand can be written as & and &.
```

## Map

```dart
final Map<String, String> c = HtmlCharacterEntities.characters;

String string = 'There are 4 suites of cards: ${c['&spades;']} Spades, ${c['&clubs;']} Clubs, ${c['&hearts;']} Hearts, ${c['&diams;']} Diamonds';

print(string); // There are 4 suites of cards: ♠ Spades, ♣ Clubs, ♥ Hearts, ♦ Diamonds
```