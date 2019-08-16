# html_character_entities

A Dart utility class containing maps of key/value pairs for every
HTML 4.01 character entity, including ASCII and hex codes, and methods
to encode and decode strings to and from those character entities.

# Usage

```dart
import 'package:html_character_entities/html_character_entities.dart';
```

## Decoding Strings

The `decode` method accepts a string as an argument and returns it after
replacing every character entity with their corresponding characters.

```dart
String string = 'An ampersand can be written as &amp; and &#38;.';

print(HtmlCharacterEntities.decode(string)); // An ampersand can be written as & and &.
```

## Encoding Strings

The `encode()` method has an argument, [characters], that accepts a string
of all characters that should be encoded. It defaults to the 5 reserved
characters in both HTML and XML: less-than (`<`), greater-than (`>`),
ampersand (`&`), apostrophe or single quote (`'`), and double-quote (`"`).

```dart
String string = '<, >, &, \', and " aren\'t safe to use in HTML and XML.';

print(HtmlCharacterEntities.encode(string));
// &lt;, &gt;, &amp;, &apos;, and &quot; aren&apos;t safe to use in HTML and XML.

print(HtmlCharacterEntities.encode(string, characters: 'XHTML'));
// <, >, &, ', and " aren't safe to use in &#72;&#84;&#77;&#76; and &#88;&#77;&#76;.
```

If [characters] is `null`, every character in the `HtmlCharacterEntities.characters` map will be encoded.

## Maps

A map of every HTML 4.01 character code, as well as their ASCII and hex
code entities can be referenced from `HtmlCharacterEntities.characters`.

__Note:__ The hex codes in the map don't have leading 0s. I.e. the hex
code `&#x0000a5;` is in the map as `&#xa5;`. When decoding hex code
entities, the leading 0s will be removed by the parser before being
looked up.

```dart
Map<String, String> c = HtmlCharacterEntities.characters;

String string = 'There are 4 suites of cards: ${c['&spades;']} Spades, ${c['&clubs;']} Clubs, ${c['&hearts;']} Hearts, ${c['&diams;']} Diamonds';

print(string); // There are 4 suites of cards: ♠ Spades, ♣ Clubs, ♥ Hearts, ♦ Diamonds
```

Maps containing the characters with their respective character codes
as values can also be referenced. They are used by the `encode` method.

```dart
// A map with only ASCII code character entities as values.
Map<String, String> ascii = HtmlCharacterEntities.asciiCodes;

// A map with all non-ASCII code character entities as values.
Map<String, String> entity = HtmlCharacterEntities.entities;

String string = '< and > exist as both ASCII codes (${ascii['<']} and ${ascii['>']}) and character entities (${entity['<']} and ${entity['>']}).';

print(string); // < and > exist as both ASCII codes (&#60; and &#62;) and character entities (&lt; and &gt;).
```
