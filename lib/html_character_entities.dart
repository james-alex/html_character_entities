library html_character_entities;

/// A utility class containing a map, [characters], of key/value pairs for
/// every HTML 4.01 character entity, including ASCII codes, and a method,
/// [parse], to parse strings for those character entities.
class HtmlCharacterEntities {
  /// Parses a [string] and replaces all valid HTML character entities with their respective characters.
  static String parse(String string) {
    assert(string != null);

    int charCodeIndex = 0;

    Match findNextCharCode() {
      final Iterable<Match> charCodes = RegExp(r'&(#?)([a-zA-Z0-9]+?);').allMatches(string);

      if (charCodes.length <= charCodeIndex) return null;

      return charCodes.elementAt(charCodeIndex);
    }

    Match nextCharCode = findNextCharCode();

    while (nextCharCode != null) {
      final String charCode = string.substring(nextCharCode.start, nextCharCode.end);

      if (characters.containsKey(charCode)) {
        string = string.replaceRange(nextCharCode.start, nextCharCode.end, characters[charCode]);
      } else {
        charCodeIndex++;
      }

      nextCharCode = findNextCharCode();
    }

    return string;
  }

  /// A map of all HTML 4.01 character entities and their corresponding characters.
  static const Map<String, String> characters = <String, String>{
    // space
    '&#32;': ' ',
    // exclamation mark
    '&#33;': '!',
    // double quote
    '&#34;': '"',
    '&quot;': '"',
    // number sign
    '&#35;': '#',
    // dollar sign
    '&#36;': '\$',
    // percent sign
    '&#37;': '%',
    // ampersand
    '&#38;': '&',
    '&amp;': '&',
    // apostrophe (single quote)
    '&#39;': '\'',
    '&apos;': '\'',
    // opening parenthesis
    '&#40;': '(',
    // closing parenthesis
    '&#41;': ')',
    // asterisk
    '&#42;': '*',
    // plus sign
    '&#43;': '+',
    // comma
    '&#44;': ',',
    // minus sign (hyphen)
    '&#45;': '-',
    // period
    '&#46;': '.',
    // slash
    '&#47;': '/',
    // zero
    '&#48;': '0',
    // one
    '&#49;': '1',
    // two
    '&#50;': '2',
    // three
    '&#51;': '3',
    // four
    '&#52;': '4',
    // five
    '&#53;': '5',
    // six
    '&#54;': '6',
    // seven
    '&#55;': '7',
    // eight
    '&#56;': '8',
    // nine
    '&#57;': '9',
    // colon
    '&#58;': ':',
    // semicolon
    '&#59;': ';',
    // less-than
    '&#60;': '<',
    '&lt;': '<',
    // equal sign
    '&#61;': '=',
    // greater-than
    '&#62;': '>',
    '&gt;': '>',
    // question mark
    '&#63;': '?',
    // at symbol
    '&#64;': '@',
    // uppercase a
    '&#65;': 'A',
    // uppercase b
    '&#66;': 'B',
    // uppercase c
    '&#67;': 'C',
    // uppercase d
    '&#68;': 'D',
    // uppercase e
    '&#69;': 'E',
    // uppercase f
    '&#70;': 'F',
    // uppercase g
    '&#71;': 'G',
    // uppercase h
    '&#72;': 'H',
    // uppercase i
    '&#73;': 'I',
    // uppercase j
    '&#74;': 'J',
    // uppercase k
    '&#75;': 'K',
    // uppercase l
    '&#76;': 'L',
    // uppercase m
    '&#77;': 'M',
    // uppercase n
    '&#78;': 'N',
    // uppercase o
    '&#79;': 'O',
    // uppercase p
    '&#80;': 'P',
    // uppercase q
    '&#81;': 'Q',
    // uppercase r
    '&#82;': 'R',
    // uppercase s
    '&#83;': 'S',
    // uppercase t
    '&#84;': 'T',
    // uppercase u
    '&#85;': 'U',
    // uppercase v
    '&#86;': 'V',
    // uppercase w
    '&#87;': 'W',
    // uppercase x
    '&#88;': 'X',
    // uppercase y
    '&#89;': 'Y',
    // uppercase z
    '&#90;': 'Z',
    // opening bracket
    '&#91;': '[',
    // backslash
    '&#92;': '\\',
    // closing bracket
    '&#93;': ']',
    // caret (circumflex)
    '&#94;': '^',
    // underscore
    '&#95;': '_',
    // grave accent
    '&#96;': '`',
    // lowercase a
    '&#97;': 'a',
    // lowercase b
    '&#98;': 'b',
    // lowercase c
    '&#99;': 'c',
    // lowercase d
    '&#100;': 'd',
    // lowercase e
    '&#101;': 'e',
    // lowercase f
    '&#102;': 'f',
    // lowercase g
    '&#103;': 'g',
    // lowercase h
    '&#104;': 'h',
    // lowercase i
    '&#105;': 'i',
    // lowercase j
    '&#106;': 'j',
    // lowercase k
    '&#107;': 'k',
    // lowercase l
    '&#108;': 'l',
    // lowercase m
    '&#109;': 'm',
    // lowercase n
    '&#110;': 'n',
    // lowercase o
    '&#111;': 'o',
    // lowercase p
    '&#112;': 'p',
    // lowercase q
    '&#113;': 'q',
    // lowercase r
    '&#114;': 'r',
    // lowercase s
    '&#115;': 's',
    // lowercase t
    '&#116;': 't',
    // lowercase u
    '&#117;': 'u',
    // lowercase v
    '&#118;': 'v',
    // lowercase w
    '&#119;': 'w',
    // lowercase x
    '&#120;': 'x',
    // lowercase y
    '&#121;': 'y',
    // lowercase z
    '&#122;': 'z',
    // opening brace
    '&#123;': '{',
    // vertical bar
    '&#124;': '|',
    // closing brace
    '&#125;': '}',
    // equivalency sign (tilde)
    '&#126;': '~',
    // non-breaking space
    '&#160;': ' ',
    '&nbsp;': ' ',
    // inverted exclamation mark
    '&#161;': '¡',
    '&iexcl;': '¡',
    // cent sign
    '&#162;': '¢',
    '&cent;': '¢',
    // pound sign
    '&#163;': '£',
    '&pound;': '£',
    // currency sign
    '&#164;': '¤',
    '&curren;': '¤',
    // yen sign (yuan sign)
    '&#165;': '¥',
    '&yen;': '¥',
    // broken bar (broken vertical bar)
    '&#166;': '¦',
    '&brvbar;': '¦',
    // section sign
    '&#167;': '§',
    '&sect;': '§',
    // diaeresis (spacing diaeresis)
    '&#168;': '¨',
    '&uml;': '¨',
    // copyright symbol
    '&#169;': '©',
    '&copy;': '©',
    // feminine ordinal indicator
    '&#170;': 'ª',
    '&ordf;': 'ª',
    // left-pointing double angle quotation mark (left pointing guillemet)
    '&#171;': '«',
    '&laquo;': '«',
    // not sign
    '&#172;': '¬',
    '&not;': '¬',
    // soft hyphen (discretionary hyphen)
    '&#173;': '',
    '&shy;': '',
    // registered sign (registered trademark symbol)
    '&#174;': '®',
    '&reg;': '®',
    // macron (spacing macron, overline, APL overbar)
    '&#175;': '¯',
    '&macr;': '¯',
    // degree symbol
    '&#176;': '°',
    '&deg;': '°',
    // plus-minus sign (plus-or-minus sign)
    '&#177;': '±',
    '&plusmn;': '±',
    // superscript two (superscript digit two, squared)
    '&#178;': '²',
    '&sup2;': '²',
    // superscript three (superscript digit three, cubed)
    '&#179;': '³',
    '&sup3;': '³',
    // acute accent (spacing acute)
    '&#180;': '´',
    '&acute;': '´',
    // micro sign
    '&#181;': 'µ',
    '&micro;': 'µ',
    // pilcrow sign (paragraph sign)
    '&#182;': '¶',
    '&para;': '¶',
    // middle dot (Georgian comma, Greek middle dot)
    '&#183;': '·',
    '&middot;': '·',
    // cedilla (spacing cedilla)
    '&#184;': '¸',
    '&cedil;': '¸',
    // superscript one (superscript digit one)
    '&#185;': '¹',
    '&sup1;': '¹',
    // masculine ordinal indicator
    '&#186;': 'º',
    '&ordm;': 'º',
    // right-pointing double angle quotation mark (right pointing guillemet)
    '&#187;': '»',
    '&raquo;': '»',
    // vulgar fraction one quarter (fraction one quarter)
    '&#188;': '¼',
    '&frac14;': '¼',
    // vulgar fraction one half (fraction one half)
    '&#189;': '½',
    '&frac12;': '½',
    // vulgar fraction three quarters (fraction three quarters)
    '&#190;': '¾',
    '&frac34;': '¾',
    // inverted question mark (turned question mark)
    '&#191;': '¿',
    '&iquest;': '¿',
    // Latin capital letter A with grave accent (Latin capital letter A grave)
    '&#192;': 'À',
    '&Agrave;': 'À',
    // Latin capital letter A with acute accent
    '&#193;': 'Á',
    '&Aacute;': 'Á',
    // Latin capital letter A with circumflex
    '&#194;': 'Â',
    '&Acirc;': 'Â',
    // Latin capital letter A with tilde
    '&#195;': 'Ã',
    '&Atilde;': 'Ã',
    // Latin capital letter A with diaeresis
    '&#196;': 'Ä',
    '&Auml;': 'Ä',
    // Latin capital letter A with ring above (Latin capital letter A ring)
    '&#197;': 'Å',
    '&Aring;': 'Å',
    // Latin capital letter AE (Latin capital ligature AE)
    '&#198;': 'Æ',
    '&AElig;': 'Æ',
    // Latin capital letter C with cedilla
    '&#199;': 'Ç',
    '&Ccedil;': 'Ç',
    // Latin capital letter E with grave accent
    '&#200;': 'È',
    '&Egrave;': 'È',
    // Latin capital letter E with acute accent
    '&#201;': 'É',
    '&Eacute;': 'É',
    // Latin capital letter E with circumflex
    '&#202;': 'Ê',
    '&Ecirc;': 'Ê',
    // Latin capital letter E with diaeresis
    '&#203;': 'Ë',
    '&Euml;': 'Ë',
    // Latin capital letter I with grave accent
    '&#204;': 'Ì',
    '&Igrave;': 'Ì',
    // Latin capital letter I with acute accent
    '&#205;': 'Í',
    '&Iacute;': 'Í',
    // Latin capital letter I with circumflex
    '&#206;': 'Î',
    '&Icirc;': 'Î',
    // Latin capital letter I with diaeresis
    '&#207;': 'Ï',
    '&Iuml;': 'Ï',
    // Latin capital letter Eth
    '&#208;': 'Ð',
    '&ETH;': 'Ð',
    // Latin capital letter N with tilde
    '&#209;': 'Ñ',
    '&Ntilde;': 'Ñ',
    // Latin capital letter O with grave accent
    '&#210;': 'Ò',
    '&Ograve;': 'Ò',
    // Latin capital letter O with acute accent
    '&#211;': 'Ó',
    '&Oacute;': 'Ó',
    // Latin capital letter O with circumflex
    '&#212;': 'Ô',
    '&Ocirc;': 'Ô',
    // Latin capital letter O with tilde
    '&#213;': 'Õ',
    '&Otilde;': 'Õ',
    // Latin capital letter O with diaeresis
    '&#214;': 'Ö',
    '&Ouml;': 'Ö',
    // multiplication sign
    '&#215;': '×',
    '&times;': '×',
    // Latin capital letter O with stroke (Latin capital letter O slash)
    '&#216;': 'Ø',
    '&Oslash;': 'Ø',
    // Latin capital letter U with grave accent
    '&#217;': 'Ù',
    '&Ugrave;': 'Ù',
    // Latin capital letter U with acute accent
    '&#218;': 'Ú',
    '&Uacute;': 'Ú',
    // Latin capital letter U with circumflex
    '&#219;': 'Û',
    '&Ucirc;': 'Û',
    // Latin capital letter U with diaeresis
    '&#220;': 'Ü',
    '&Uuml;': 'Ü',
    // Latin capital letter Y with acute accent
    '&#221;': 'Ý',
    '&Yacute;': 'Ý',
    // Latin capital letter THORN
    '&#222;': 'Þ',
    '&THORN;': 'Þ',
    // Latin small letter sharp s (ess-zed); see German Eszett
    '&#223;': 'ß',
    '&szlig;': 'ß',
    // Latin small letter a with grave accent
    '&#224;': 'à',
    '&agrave;': 'à',
    // Latin small letter a with acute accent
    '&#225;': 'á',
    '&aacute;': 'á',
    // Latin small letter a with circumflex
    '&#226;': 'â',
    '&acirc;': 'â',
    // Latin small letter a with tilde
    '&#227;': 'ã',
    '&atilde;': 'ã',
    // Latin small letter a with diaeresis
    '&#228;': 'ä',
    '&auml;': 'ä',
    // Latin small letter a with ring above
    '&#229;': 'å',
    '&aring;': 'å',
    // Latin small letter ae (Latin small ligature ae)
    '&#230;': 'æ',
    '&aelig;': 'æ',
    // Latin small letter c with cedilla
    '&#231;': 'ç',
    '&ccedil;': 'ç',
    // Latin small letter e with grave accent
    '&#232;': 'è',
    '&egrave;': 'è',
    // Latin small letter e with acute accent
    '&#233;': 'é',
    '&eacute;': 'é',
    // Latin small letter e with circumflex
    '&#234;': 'ê',
    '&ecirc;': 'ê',
    // Latin small letter e with diaeresis
    '&#235;': 'ë',
    '&euml;': 'ë',
    // Latin small letter i with grave accent
    '&#236;': 'ì',
    '&igrave;': 'ì',
    // Latin small letter i with acute accent
    '&#237;': 'í',
    '&iacute;': 'í',
    // Latin small letter i with circumflex
    '&#238;': 'î',
    '&icirc;': 'î',
    // Latin small letter i with diaeresis
    '&#239;': 'ï',
    '&iuml;': 'ï',
    // Latin small letter eth
    '&#240;': 'ð',
    '&eth;': 'ð',
    // Latin small letter n with tilde
    '&#241;': 'ñ',
    '&ntilde;': 'ñ',
    // Latin small letter o with grave accent
    '&#242;': 'ò',
    '&ograve;': 'ò',
    // Latin small letter o with acute accent
    '&#243;': 'ó',
    '&oacute;': 'ó',
    // Latin small letter o with circumflex
    '&#244;': 'ô',
    '&ocirc;': 'ô',
    // Latin small letter o with tilde
    '&#245;': 'õ',
    '&otilde;': 'õ',
    // Latin small letter o with diaeresis
    '&#246;': 'ö',
    '&ouml;': 'ö',
    // division sign (obelus)
    '&#247;': '÷',
    '&divide;': '÷',
    // Latin small letter o with stroke (Latin small letter o slash)
    '&#248;': 'ø',
    '&oslash;': 'ø',
    // Latin small letter u with grave accent
    '&#249;': 'ù',
    '&ugrave;': 'ù',
    // Latin small letter u with acute accent
    '&#250;': 'ú',
    '&uacute;': 'ú',
    // Latin small letter u with circumflex
    '&#251;': 'û',
    '&ucirc;': 'û',
    // Latin small letter u with diaeresis
    '&#252;': 'ü',
    '&uuml;': 'ü',
    // Latin small letter y with acute accent
    '&#253;': 'ý',
    '&yacute;': 'ý',
    // Latin small letter thorn
    '&#254;': 'þ',
    '&thorn;': 'þ',
    // Latin small letter y with diaeresis
    '&#255;': 'ÿ',
    '&yuml;': 'ÿ',
    // Latin capital ligature oe
    '&#338;': 'Œ',
    '&OElig;': 'Œ',
    // Latin small ligature oe
    '&#339;': 'œ',
    '&oelig;': 'œ',
    // Latin capital letter s with caron
    '&#352;': 'Š',
    '&Scaron;': 'Š',
    // Latin small letter s with caron
    '&#353;': 'š',
    '&scaron;': 'š',
    // Latin capital letter y with diaeresis
    '&#376;': 'Ÿ',
    '&Yuml;': 'Ÿ',
    // Latin small letter f with hook (function, florin)
    '&#402;': 'ƒ',
    '&fnof;': 'ƒ',
    // modifier letter circumflex accent
    '&circ;': 'ˆ',
    // small tilde
    '&tilde;': '˜',
    // Greek capital letter Alpha
    '&Alpha;': 'Α',
    // Greek capital letter Beta
    '&Beta;': 'Β',
    // Greek capital letter Gamma
    '&Gamma;': 'Γ',
    // Greek capital letter Delta
    '&Delta;': 'Δ',
    // Greek capital letter Epsilon
    '&Epsilon;': 'Ε',
    // Greek capital letter Zeta
    '&Zeta;': 'Ζ',
    // Greek capital letter Eta
    '&Eta;': 'Η',
    // Greek capital letter Theta
    '&Theta;': 'Θ',
    // Greek capital letter Iota
    '&Iota;': 'Ι',
    // Greek capital letter Kappa
    '&Kappa;': 'Κ',
    // Greek capital letter Lambda
    '&Lambda;': 'Λ',
    // Greek capital letter Mu
    '&Mu;': 'Μ',
    // Greek capital letter Nu
    '&Nu;': 'Ν',
    // Greek capital letter Xi
    '&Xi;': 'Ξ',
    // Greek capital letter Omicron
    '&Omicron;': 'Ο',
    // Greek capital letter Pi
    '&Pi;': 'Π',
    // Greek capital letter Rho
    '&Rho;': 'Ρ',
    // Greek capital letter Sigma
    '&Sigma;': 'Σ',
    // Greek capital letter Tau
    '&Tau;': 'Τ',
    // Greek capital letter Upsilon
    '&Upsilon;': 'Υ',
    // Greek capital letter Phi
    '&Phi;': 'Φ',
    // Greek capital letter Chi
    '&Chi;': 'Χ',
    // Greek capital letter Psi
    '&Psi;': 'Ψ',
    // Greek capital letter Omega
    '&Omega;': 'Ω',
    // Greek small letter alpha
    '&alpha;': 'α',
    // Greek small letter beta
    '&beta;': 'β',
    // Greek small letter gamma
    '&gamma;': 'γ',
    // Greek small letter delta
    '&delta;': 'δ',
    // Greek small letter epsilon
    '&epsilon;': 'ε',
    // Greek small letter zeta
    '&zeta;': 'ζ',
    // Greek small letter eta
    '&eta;': 'η',
    // Greek small letter theta
    '&theta;': 'θ',
    // Greek small letter iota
    '&iota;': 'ι',
    // Greek small letter kappa
    '&kappa;': 'κ',
    // Greek small letter lambda
    '&lambda;': 'λ',
    // Greek small letter mu
    '&mu;': 'μ',
    // Greek small letter nu
    '&nu;': 'ν',
    // Greek small letter xi
    '&xi;': 'ξ',
    // Greek small letter omicron
    '&omicron;': 'ο',
    // Greek small letter pi
    '&pi;': 'π',
    // Greek small letter rho
    '&rho;': 'ρ',
    // Greek small letter final sigma
    '&sigmaf;': 'ς',
    // Greek small letter sigma
    '&sigma;': 'σ',
    // Greek small letter tau
    '&tau;': 'τ',
    // Greek small letter upsilon
    '&upsilon;': 'υ',
    // Greek small letter phi
    '&phi;': 'φ',
    // Greek small letter chi
    '&chi;': 'χ',
    // Greek small letter psi
    '&psi;': 'ψ',
    // Greek small letter omega
    '&omega;': 'ω',
    // Greek theta symbol
    '&thetasym;': 'ϑ',
    // Greek Upsilon with hook symbol
    '&upsih;': 'ϒ',
    // Greek pi symbol
    '&piv;': 'ϖ',
    // en space
    '&ensp;': ' ',
    // em space
    '&emsp;': ' ',
    // thin space
    '&thinsp;': ' ',
    // zero-width non-joiner
    '&zwnj;': '',
    // zero-width joiner
    '&zwj;': '',
    // left-to-right mark
    '&lrm;': '',
    // right-to-left mark
    '&rlm;': '',
    // en dash
    '&#8211;': '–',
    '&ndash;': '–',
    // em dash
    '&#8212;': '—',
    '&mdash;': '—',
    // left single quotation mark
    '&#8216;': '‘',
    '&lsquo;': '‘',
    // right single quotation mark
    '&#8217;': '’',
    '&rsquo;': '’',
    // single low-9 quotation mark
    '&#8218;': '‚',
    '&sbquo;': '‚',
    // left double quotation mark
    '&#8220;': '“',
    '&ldquo;': '“',
    // right double quotation mark
    '&#8221;': '”',
    '&rdquo;': '”',
    // double low-9 quotation mark
    '&#8222;': '„',
    '&bdquo;': '„',
    // dagger, obelisk
    '&#8224;': '†',
    '&dagger;': '†',
    // double dagger, double obelisk
    '&#8225;': '‡',
    '&Dagger;': '‡',
    // bullet (black small circle)
    '&#8226;': '•',
    '&bull;': '•',
    // horizontal ellipsis (three dot leader)
    '&#8230;': '…',
    '&hellip;': '…',
    // per mille sign
    '&#8240;': '‰',
    '&permil;': '‰',
    // prime (minutes, feet)
    '&prime;': '′',
    // double prime (seconds, inches)
    '&Prime;': '″',
    // single left-pointing angle quotation mark
    '&lsaquo;': '‹',
    // single right-pointing angle quotation mark
    '&rsaquo;': '›',
    // overline (spacing overscore)
    '&oline;': '‾',
    // fraction slash (solidus)
    '&frasl;': '⁄',
    // euro sign
    '&#8364;': '€',
    '&euro;': '€',
    // black-letter capital I (imaginary part)
    '&image;': 'ℑ',
    // script capital P (power set, Weierstrass p)
    '&weierp;': '℘',
    // black-letter capital R (real part symbol)
    '&real;': 'ℜ',
    // trademark symbol
    '&#8482;': '™',
    '&trade;': '™',
    // alef symbol (first transfinite cardinal)
    '&alefsym;': 'ℵ',
    // leftwards arrow
    '&larr;': '←',
    // upwards arrow
    '&uarr;': '↑',
    // rightwards arrow
    '&rarr;': '→',
    // downwards arrow
    '&darr;': '↓',
    // left right arrow
    '&harr;': '↔',
    // downwards arrow with corner leftwards (carriage return)
    '&crarr;': '↵',
    // leftwards double arrow
    '&lArr;': '⇐',
    // upwards double arrow
    '&uArr;': '⇑',
    // rightwards double arrow
    '&rArr;': '⇒',
    // downwards double arrow
    '&dArr;': '⇓',
    // left right double arrow
    '&hArr;': '⇔',
    // for all
    '&forall;': '∀',
    // partial differential
    '&part;': '∂',
    // there exists
    '&exist;': '∃',
    // empty set (null set)
    '&empty;': '∅',
    // del or nabla (vector differential operator)
    '&nabla;': '∇',
    // element of
    '&isin;': '∈',
    // not an element of
    '&notin;': '∉',
    // contains as member
    '&ni;': '∋',
    // n-ary product (product sign)
    '&prod;': '∏',
    // n-ary summation
    '&sum;': '∑',
    // minus sign
    '&minus;': '−',
    // asterisk operator
    '&lowast;': '∗',
    // square root (radical sign)
    '&radic;': '√',
    // proportional to
    '&prop;': '∝',
    // infinity
    '&infin;': '∞',
    // angle
    '&ang;': '∠',
    // logical and (wedge)
    '&and;': '∧',
    // logical or (vee)
    '&or;': '∨',
    // intersection (cap)
    '&cap;': '∩',
    // union (cup)
    '&cup;': '∪',
    // integral
    '&int;': '∫',
    // therefore sign
    '&there4;': '∴',
    // tilde operator (varies with, similar to)
    '&sim;': '∼',
    // congruent to
    '&cong;': '≅',
    // almost equal to (asymptotic to)
    '&asymp;': '≈',
    // not equal to
    '&ne;': '≠',
    // identical to; sometimes used for 'equivalent to'
    '&equiv;': '≡',
    // less-than or equal to
    '&le;': '≤',
    // greater-than or equal to
    '&ge;': '≥',
    // subset of
    '&sub;': '⊂',
    // superset of
    '&sup;': '⊃',
    // not a subset of
    '&nsub;': '⊄',
    // subset of or equal to
    '&sube;': '⊆',
    // superset of or equal to
    '&supe;': '⊇',
    // circled plus (direct sum)
    '&oplus;': '⊕',
    // circled times (vector product)
    '&otimes;': '⊗',
    // up tack (orthogonal to, perpendicular)
    '&perp;': '⊥',
    // dot operator
    '&sdot;': '⋅',
    // vertical ellipsis
    '&vellip;': '⋮',
    // left ceiling (APL upstile)
    '&lceil;': '⌈',
    // right ceiling
    '&rceil;': '⌉',
    // left floor (APL downstile)
    '&lfloor;': '⌊',
    // right floor
    '&rfloor;': '⌋',
    // left-pointing angle bracket (bra)
    '&lang;': '〈',
    // right-pointing angle bracket (ket)
    '&rang;': '〉',
    // lozenge
    '&loz;': '◊',
    // black spade suit
    '&spades;': '♠',
    // black club suit (shamrock)
    '&clubs;': '♣',
    // black heart suit (valentine)
    '&hearts;': '♥',
    // black diamond suit
    '&diams;': '♦',
  };
}
