import 'package:test/test.dart';
import 'package:html_character_entities/html_character_entities.dart';

void main() {
  test('HtmlCharacterEntities.parse parses a string for HTML character entities.', () {
    final String string = 'Some parsers will replace a single quote with &amp;#39;.';
    expect(HtmlCharacterEntities.parse(string),
      equals('Some parsers will replace a single quote with \'.'));
  });
}
