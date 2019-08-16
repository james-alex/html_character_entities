## [0.1.1] - August 16, 2019

* Added support for hex code character entities.

* Added missing ASCII codes for characters with HTML codes.

## [0.1.0] - August 1, 2019

* Added the `characterEntities` statically typed map to [HtmlCharacterEntities].

* Added the `encode` method to [HtmlCharacterEntities].

* Deprecated the `parse` method in favor of `decode`. `parse` still exists
as a wrapper for `decode`, but will be removed in a future release.

* Wrote new tests.

## [0.0.1 - 0.0.3] - July 7, 2019

* Changed [RegExpMatch] type declarations to [Match].

* Commented the [HtmlCharacterEntities] class.

* Initial release.
