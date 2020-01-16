import 'package:test/test.dart';
import 'package:html_character_entities/html_character_entities.dart';

void main() {
  const characters = HtmlCharacterEntities.characters;

  const entities = HtmlCharacterEntities.entities;

  const asciiCodes = HtmlCharacterEntities.asciiCodes;

  const hexCodes = HtmlCharacterEntities.hexCodes;

  const _exceptions = <String>[
    '&#x20;',
    '&#32;',
    '&straightphi;',
    '&varpi;',
  ];

  test('Cross-check the maps', () {
    characters.forEach((characterCode, character) {
      if (character.isEmpty) return;

      if (_exceptions.contains(characterCode)) return;

      if (characterCode[1] == '#') {
        if (characterCode[2] == 'x') {
          expect(hexCodes[character], equals(characterCode));
        } else {
          expect(asciiCodes[character], equals(characterCode));
        }
      } else {
        expect(entities[character], equals(characterCode));
      }
    });
  });

  const encodeString = r' !""#$%&&'
      '()*+,-./0123456789:;<<=>>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~  ¡¡¢¢££¤¤¥¥¦¦§§¨¨©©ªª««¬¬®®¯¯°°±±²²³³´´µµ¶¶··¸¸¹¹ºº»»¼¼½½¾¾¿¿ÀÀÁÁÂÂÃÃÄÄÅÅÆÆÇÇÈÈÉÉÊÊËËÌÌÍÍÎÎÏÏÐÐÑÑÒÒÓÓÔÔÕÕÖÖ××ØØÙÙÚÚÛÛÜÜÝÝÞÞßßààááââããääååææççèèééêêëëììííîîïïððññòòóóôôõõöö÷÷øøùùúúûûüüýýþþÿÿŒŒœœŠŠššŸŸƒƒˆ˜ΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩαβγδεζηθικλμνξοπρςστυφχψωϑϒϖ   ––——‘‘’’‚‚““””„„††‡‡••……‰‰′″‹›‾⁄€€ℑ℘ℜ™™ℵ←↑→↓↔↵⇐⇑⇒⇓⇔∀∂∃∅∇∈∉∋∏∑−∗√∝∞∠∧∨∩∪∫∴∼≅≈≠≡≤≥⊂⊃⊄⊆⊇⊕⊗⊥⋅⋮⌈⌉⌊⌋〈〉◊♠♣♥♦';

  const decodeString =
      '&nbsp;&#33;&quot;&quot;&#35;&#36;&#37;&amp;&amp;&#40;&#41;&#42;&#43;&#44;&#45;&#46;&#47;&#48;&#49;&#50;&#51;&#52;&#53;&#54;&#55;&#56;&#57;&#58;&#59;&lt;&lt;&#61;&gt;&gt;&#63;&#64;&#65;&#66;&#67;&#68;&#69;&#70;&#71;&#72;&#73;&#74;&#75;&#76;&#77;&#78;&#79;&#80;&#81;&#82;&#83;&#84;&#85;&#86;&#87;&#88;&#89;&#90;&#91;&#93;&#94;&#95;&#96;&#97;&#98;&#99;&#100;&#101;&#102;&#103;&#104;&#105;&#106;&#107;&#108;&#109;&#110;&#111;&#112;&#113;&#114;&#115;&#116;&#117;&#118;&#119;&#120;&#121;&#122;&#123;&#124;&#125;&#126;&nbsp;&nbsp;&iexcl;&iexcl;&cent;&cent;&pound;&pound;&curren;&curren;&yen;&yen;&brvbar;&brvbar;&sect;&sect;&uml;&uml;&copy;&copy;&ordf;&ordf;&laquo;&laquo;&not;&not;&reg;&reg;&macr;&macr;&deg;&deg;&plusmn;&plusmn;&sup2;&sup2;&sup3;&sup3;&acute;&acute;&micro;&micro;&para;&para;&middot;&middot;&cedil;&cedil;&sup1;&sup1;&ordm;&ordm;&raquo;&raquo;&frac14;&frac14;&frac12;&frac12;&frac34;&frac34;&iquest;&iquest;&Agrave;&Agrave;&Aacute;&Aacute;&Acirc;&Acirc;&Atilde;&Atilde;&Auml;&Auml;&Aring;&Aring;&AElig;&AElig;&Ccedil;&Ccedil;&Egrave;&Egrave;&Eacute;&Eacute;&Ecirc;&Ecirc;&Euml;&Euml;&Igrave;&Igrave;&Iacute;&Iacute;&Icirc;&Icirc;&Iuml;&Iuml;&ETH;&ETH;&Ntilde;&Ntilde;&Ograve;&Ograve;&Oacute;&Oacute;&Ocirc;&Ocirc;&Otilde;&Otilde;&Ouml;&Ouml;&times;&times;&Oslash;&Oslash;&Ugrave;&Ugrave;&Uacute;&Uacute;&Ucirc;&Ucirc;&Uuml;&Uuml;&Yacute;&Yacute;&THORN;&THORN;&szlig;&szlig;&agrave;&agrave;&aacute;&aacute;&acirc;&acirc;&atilde;&atilde;&auml;&auml;&aring;&aring;&aelig;&aelig;&ccedil;&ccedil;&egrave;&egrave;&eacute;&eacute;&ecirc;&ecirc;&euml;&euml;&igrave;&igrave;&iacute;&iacute;&icirc;&icirc;&iuml;&iuml;&eth;&eth;&ntilde;&ntilde;&ograve;&ograve;&oacute;&oacute;&ocirc;&ocirc;&otilde;&otilde;&ouml;&ouml;&divide;&divide;&oslash;&oslash;&ugrave;&ugrave;&uacute;&uacute;&ucirc;&ucirc;&uuml;&uuml;&yacute;&yacute;&thorn;&thorn;&yuml;&yuml;&OElig;&OElig;&oelig;&oelig;&Scaron;&Scaron;&scaron;&scaron;&Yuml;&Yuml;&fnof;&fnof;&circ;&tilde;&Alpha;&Beta;&Gamma;&Delta;&Epsilon;&Zeta;&Eta;&Theta;&Iota;&Kappa;&Lambda;&Mu;&Nu;&Xi;&Omicron;&Pi;&Rho;&Sigma;&Tau;&Upsilon;&Phi;&Chi;&Psi;&Omega;&alpha;&beta;&gamma;&delta;&epsilon;&zeta;&eta;&theta;&iota;&kappa;&lambda;&mu;&nu;&xi;&omicron;&pi;&rho;&sigmaf;&sigma;&tau;&upsilon;&phi;&chi;&psi;&omega;&thetasym;&upsih;&piv;&ensp;&emsp;&thinsp;&ndash;&ndash;&mdash;&mdash;&lsquo;&lsquo;&rsquo;&rsquo;&sbquo;&sbquo;&ldquo;&ldquo;&rdquo;&rdquo;&bdquo;&bdquo;&dagger;&dagger;&Dagger;&Dagger;&bull;&bull;&hellip;&hellip;&permil;&permil;&prime;&Prime;&lsaquo;&rsaquo;&oline;&frasl;&euro;&euro;&image;&weierp;&real;&trade;&trade;&alefsym;&larr;&uarr;&rarr;&darr;&harr;&crarr;&lArr;&uArr;&rArr;&dArr;&hArr;&forall;&part;&exist;&empty;&nabla;&isin;&notin;&ni;&prod;&sum;&minus;&lowast;&radic;&prop;&infin;&ang;&and;&or;&cap;&cup;&int;&there4;&sim;&cong;&asymp;&ne;&equiv;&le;&ge;&sub;&sup;&nsub;&sube;&supe;&oplus;&otimes;&perp;&sdot;&vellip;&lceil;&rceil;&lfloor;&rfloor;&lang;&rang;&loz;&spades;&clubs;&hearts;&diams;';

  test('Encode string', () {
    expect(HtmlCharacterEntities.encode(encodeString, characters: null),
        equals(decodeString));
  });

  test('Decode string', () {
    expect(HtmlCharacterEntities.decode(decodeString), equals(encodeString));
  });
}
