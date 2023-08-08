import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'vi', 'de', 'nl', 'ja'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? viText = '',
    String? deText = '',
    String? nlText = '',
    String? jaText = '',
  }) =>
      [enText, viText, deText, nlText, jaText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    '7efjt2s6': {
      'en': 'Search...',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'hfxb7rws': {
      'en': 'Survival Guide',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'iy73f5if': {
      'en': 'Home',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
  },
  // BlogScreen
  {
    'xhz2mzra': {
      'en': 'Go Somewhere',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'xme46bxo': {
      'en': 'Find some wonderful little cabins below.',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    '1tziau26': {
      'en': 'Search for your destination...',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    '5o7uxt9u': {
      'en': 'Popular Bookings',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'u9g2miee': {
      'en': 'Mountain Lake Cabin',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'jh8keo1y': {
      'en':
          'Retreat to the natural beauty of the mountains and immerse yourself in the comfort of our luxurious mountain house, an idyllic escape for your perfect mountain getaway.',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    '107puvyg': {
      'en': 'Little Mountain House',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'edu5e5wq': {
      'en':
          'Escape to the serene beauty of the mountains and enjoy a luxurious stay in our cozy mountain house, the perfect destination for your dream mountain getaway.',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'sxs2wcfu': {
      'en': 'Ski Cabin',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'pax44ozv': {
      'en':
          'Escape to the serene beauty of the mountains and enjoy a luxurious stay in our cozy mountain house, the perfect destination for your dream mountain getaway.',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'q9ls23lb': {
      'en': 'Explore',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    '69451qtg': {
      'en': 'Home',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
  },
  // MapScreen
  {
    'm0r2sr3t': {
      'en': 'Map',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'gofa3xb4': {
      'en': 'Home',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
  },
  // TranslateScreen
  {
    'v3a0w9o0': {
      'en': 'Option 1',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'l2qvn7qb': {
      'en': 'Please select...',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'pwum9oy9': {
      'en': 'Search for an item...',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    '51wsp05r': {
      'en': 'Enter Text',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'um75lq1y': {
      'en': 'Type or speak here...',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    '85swkeqe': {
      'en': 'Translated Text',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'lur1bnos': {
      'en': 'Translation will appear here...',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'xygb7bb0': {
      'en': 'Option 1',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'h05vtiei': {
      'en': 'Please select...',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'gjawog45': {
      'en': 'Search for an item...',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'qtx3xlh4': {
      'en': 'Translate',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'yqljahi7': {
      'en': 'Translation',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
  },
  // SignIn
  {
    '0gxrizfh': {
      'en': 'Survival Guide',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'hi7b1yhx': {
      'en': 'Sign In',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'e7rn4jpf': {
      'en': 'Sign Up',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'tlr351wa': {
      'en': 'Let\'s get started by filling out the form below.',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'kyuh8yvb': {
      'en': 'Email',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    '7zyw46ho': {
      'en': 'Password',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    '85xoq8af': {
      'en': 'Sign In',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    '6eb0pkb5': {
      'en': 'Forgot Password',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    '2xlx0ovw': {
      'en': 'Home',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
  },
  // SignUp
  {
    'ovgohcvb': {
      'en': 'Survival Guide',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'w1jogkma': {
      'en': 'Sign In',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'wschrv7a': {
      'en': 'Sign Up',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'rpmknx0z': {
      'en': 'Let\'s get started by filling out the form below.',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    '4eg3raqa': {
      'en': 'Email',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'nr9wtkqp': {
      'en': 'Password',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'flybbdrw': {
      'en': 'Confirm Password',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    '2tbekbat': {
      'en': 'Create Account',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'ww96co4j': {
      'en': 'Home',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
  },
  // Miscellaneous
  {
    'bwm4kdb5': {
      'en': '',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'q52nnhi1': {
      'en': '',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    '5cwl65jb': {
      'en': '',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'f2a6nxzo': {
      'en': '',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'e5rv6z1d': {
      'en': '',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'ydya04jq': {
      'en': '',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    '2pvgu1sk': {
      'en': '',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'l91n7mv8': {
      'en': '',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'vd9vju7b': {
      'en': '',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    '1bdz2tmo': {
      'en': '',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'z1969a77': {
      'en': '',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    '25wghsd9': {
      'en': '',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    '7y70ieif': {
      'en': '',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'g96pgd0s': {
      'en': '',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'm5pt7abc': {
      'en': '',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'lmrfvk3z': {
      'en': '',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'l1as6oyy': {
      'en': '',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'bpokf9fn': {
      'en': '',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'xtz4ssew': {
      'en': '',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    '5yq7x09e': {
      'en': '',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    '6rwmu8tc': {
      'en': '',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'gb7z28lw': {
      'en': '',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    '3ozej7lr': {
      'en': '',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
    'sqvmbyrl': {
      'en': '',
      'de': '',
      'ja': '',
      'nl': '',
      'vi': '',
    },
  },
].reduce((a, b) => a..addAll(b));
