import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'or'];

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
    String? orText = '',
  }) =>
      [enText, orText][languageIndex] ?? '';

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

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

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

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Login
  {
    'hq0w1whe': {
      'en': 'Shri Mohan Charan Majhi',
      'or': 'ଶ୍ରୀ ମୋହନ ଚରଣ ମାଝୀ',
    },
    'u29lrrn4': {
      'en': 'Hon’ble Chief Minister of Odisha',
      'or': 'ଓଡ଼ିଶାର ମାନ୍ୟବର ମୁଖ୍ୟମନ୍ତ୍ରୀ',
    },
    'i452xvii': {
      'en':
          'Micro, Small & Medium Enterprise Department , Government of Odisha',
      'or': 'ସୂକ୍ଷ୍ମ, କ୍ଷୁଦ୍ର ଏବଂ ମଧ୍ୟମ ଉଦ୍ୟୋଗ ବିଭାଗ, ଓଡ଼ିଶା ସରକାର',
    },
    'ebdflho5': {
      'en':
          'Micro, Small & Medium Enterprise Department , Government of Odisha',
      'or': 'ସୂକ୍ଷ୍ମ, କ୍ଷୁଦ୍ର ଏବଂ ମଧ୍ୟମ ଉଦ୍ୟୋଗ ବିଭାଗ, ଓଡ଼ିଶା ସରକାର',
    },
    'knqtmaba': {
      'en': 'MSME',
      'or': 'ଏମଏସଏମଇ',
    },
    'xrvhe7me': {
      'en': 'MSME Web Portal',
      'or': 'MSME ୱେବ୍ ପୋର୍ଟାଲ',
    },
    'q983sbpi': {
      'en': 'Welcome! Sign in to your account',
      'or': 'ସ୍ୱାଗତ! ଆପଣଙ୍କ ଆକାଉଣ୍ଟରେ ସାଇନ୍ ଇନ୍ କରନ୍ତୁ',
    },
    'etbectt6': {
      'en': 'Your Email',
      'or': 'ତୁମର ଇମେଲ୍',
    },
    'hsl3ew1u': {
      'en': 'Your Email',
      'or': 'ତୁମର ଇମେଲ୍',
    },
    'k469o9sm': {
      'en': 'Password',
      'or': 'ପାସୱାର୍ଡ',
    },
    'o4t0sgar': {
      'en': 'Password',
      'or': 'ପାସୱାର୍ଡ',
    },
    'f4iouz68': {
      'en': 'Enter captcha',
      'or': '',
    },
    'ocqwjbrj': {
      'en': 'Remember Me',
      'or': 'ମୋତେ ମନେରଖନ୍ତୁ',
    },
    '8e4zmxp5': {
      'en': 'Forgot Password?',
      'or': 'ପାସୱାର୍ଡ ଭୁଲି ଯାଇଛନ୍ତି କି?',
    },
    'fb9ewt9r': {
      'en': 'Login',
      'or': 'ଲଗ୍ଇନ୍',
    },
    'j80koc6s': {
      'en': 'Don’t have any acount?  ',
      'or': 'ଆପଣଙ୍କର କୌଣସି ଆକାଉଣ୍ଟ ନାହିଁ କି?',
    },
    'z6l5lz58': {
      'en': 'Register as User',
      'or': 'ଉପଭୋକ୍ତା ଭାବରେ ପଞ୍ଜୀକୃତ କରନ୍ତୁ',
    },
    'bueiewxn': {
      'en': 'Industries Registration',
      'or': 'ଶିଳ୍ପ ପଞ୍ଜୀକରଣ',
    },
    '1q9i2yvx': {
      'en': 'Vendor Registration',
      'or': 'ବିକ୍ରେତା ପଞ୍ଜିକରଣ',
    },
    'l0g46tuz': {
      'en': 'Field is required',
      'or': 'କ୍ଷେତ୍ର ଆବଶ୍ୟକ ଅଟେ',
    },
    'qo87ul2g': {
      'en': 'Please enter a valid email address',
      'or': '',
    },
    'bavmfd3p': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'tejyutej': {
      'en': 'Field is required',
      'or': 'କ୍ଷେତ୍ର ଆବଶ୍ୟକ ଅଟେ',
    },
    'iv6l0urn': {
      'en':
          'Password must be at least 8 characters and include:\n• One uppercase letter (A–Z)\n• One lowercase letter (a–z)\n• One number (0–9)\n• One special character (@\$!%*?&)',
      'or': '',
    },
    'cixpbo64': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    '3vz70zvx': {
      'en': 'Captcha is required',
      'or': '',
    },
    'efboi3oo': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'y44ujf2j': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // ResetPassword
  {
    '3uswga58': {
      'en': 'Shri Mohan Charan Majhi',
      'or': 'ଶ୍ରୀ ମୋହନ ଚରଣ ମାଝୀ',
    },
    'wdbyevcu': {
      'en': 'Hon’ble Chief Minister of Odisha',
      'or': 'ଓଡ଼ିଶାର ମାନ୍ୟବର ମୁଖ୍ୟମନ୍ତ୍ରୀ',
    },
    '8clwi7do': {
      'en':
          'Micro, Small & Medium Enterprise Department , Government of Odisha',
      'or': 'ସୂକ୍ଷ୍ମ, କ୍ଷୁଦ୍ର ଏବଂ ମଧ୍ୟମ ଉଦ୍ୟୋଗ ବିଭାଗ, ଓଡ଼ିଶା ସରକାର',
    },
    'oy157ebi': {
      'en':
          'Micro, Small & Medium Enterprise Department , Government of Odisha',
      'or': 'ସୂକ୍ଷ୍ମ, କ୍ଷୁଦ୍ର ଏବଂ ମଧ୍ୟମ ଉଦ୍ୟୋଗ ବିଭାଗ, ଓଡ଼ିଶା ସରକାର',
    },
    'afiatjr5': {
      'en': 'MSME',
      'or': 'ଏମଏସଏମଇ',
    },
    'bp0b36im': {
      'en': 'MSME Web Portal',
      'or': 'MSME ୱେବ୍ ପୋର୍ଟାଲ',
    },
    'cejf3999': {
      'en': 'Welcome! Sign in to your account',
      'or': 'ସ୍ୱାଗତ! ଆପଣଙ୍କ ଆକାଉଣ୍ଟରେ ସାଇନ୍ ଇନ୍ କରନ୍ତୁ',
    },
    'afollcm1': {
      'en': 'Forgot Password',
      'or': 'ପାସୱାର୍ଡ ଭୁଲି ଯାଇଛନ୍ତି',
    },
    '8021k0fq': {
      'en':
          'Enter the email address associated with your account. We\'ll send you a one-time password (OTP) to reset your password.',
      'or':
          'ଆପଣଙ୍କ ଆକାଉଣ୍ଟ ସହିତ ଜଡିତ ଇମେଲ୍ ଠିକଣା ଲେଖନ୍ତୁ। ଆପଣଙ୍କ ପାସୱାର୍ଡ ପୁନଃସେଟ୍ କରିବା ପାଇଁ ଆମେ ଆପଣଙ୍କୁ ଏକ ୱାନ୍-ଟାଇମ୍ ପାସୱାର୍ଡ (OTP) ପଠାଇବୁ।',
    },
    'zcr90tv0': {
      'en': 'Your Email',
      'or': 'ତୁମର ଇମେଲ୍',
    },
    '8a70phse': {
      'en': 'Your Email',
      'or': 'ତୁମର ଇମେଲ୍',
    },
    'edq41wmo': {
      'en': 'Reset Password',
      'or': 'ପାସୱାର୍ଡ ପୁନଃସେଟ୍ କରନ୍ତୁ',
    },
    't8rz72af': {
      'en': 'Field is required',
      'or': 'କ୍ଷେତ୍ର ଆବଶ୍ୟକ ଅଟେ',
    },
    'f34vcdsu': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    '3k6l12rg': {
      'en': 'Email Verified!',
      'or': 'ଇମେଲ୍ ଯାଞ୍ଚ ହୋଇଛି!',
    },
    'r8i5u3sd': {
      'en':
          'Your email has been verified successfully. Now you can create a new password.',
      'or':
          'ଆପଣଙ୍କର ଇମେଲ୍ ସଫଳତାର ସହ ଯାଞ୍ଚ ହୋଇଛି। ବର୍ତ୍ତମାନ ଆପଣ ଏକ ନୂତନ ପାସୱାର୍ଡ ତିଆରି କରିପାରିବେ।',
    },
    'fr7r30m2': {
      'en': 'New Password',
      'or': 'ନୂଆ ପାସୱାର୍ଡ',
    },
    'cdmkh0cn': {
      'en': 'Enter new password',
      'or': 'ନୂଆ ପାସ୍‌ୱର୍ଡ ଲେଖନ୍ତୁ',
    },
    '9itslrh9': {
      'en': 'Confirm Password',
      'or': 'ପାସୱାର୍ଡ ସୁନିଶ୍ଚିତ କରନ୍ତୁ',
    },
    'n41uob87': {
      'en': 'Confirm new password',
      'or': 'ନୂଆ ପାସ୍‌ୱାର୍ଡ ସୁନିଶ୍ଚିତ କରନ୍ତୁ',
    },
    '6p7a3pdx': {
      'en': 'New Password is required',
      'or': 'ନୂଆ ପାସୱାର୍ଡ ଆବଶ୍ୟକ',
    },
    'ucdunmot': {
      'en':
          'Password must be at least 12 characters and include:\n• One uppercase letter (A–Z)\n• One lowercase letter (a–z)\n• One number (0–9)\n• One special character (@\$!%*?&)',
      'or': '',
    },
    'mcb5wvzr': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'v76porqx': {
      'en': 'Confirm Password is required',
      'or': 'ପାସୱାର୍ଡ ଆବଶ୍ୟକ ବୋଲି ସୁନିଶ୍ଚିତ କରନ୍ତୁ',
    },
    'nk5mz500': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'm22bkl56': {
      'en': 'PIN code is required',
      'or': '',
    },
    'f90ybggn': {
      'en': 'Didn\'t receive the code?',
      'or': 'କୋଡ୍ ପାଇନାହାଁନ୍ତି କି?',
    },
    'c8vqgslr': {
      'en': 'Resend in',
      'or': 'ପୁଣି ପଠାନ୍ତୁ',
    },
    '88j7d5qy': {
      'en':
          'Password must be at least 8 characters long and contain uppercase, lowercase, numbers and special characters.',
      'or':
          'ପାସୱାର୍ଡ ଅତି କମରେ 8 ଅକ୍ଷର ଲମ୍ବା ହେବା ଉଚିତ ଏବଂ ଏଥିରେ ବଡ ଅକ୍ଷର, ଛୋଟ ଅକ୍ଷର, ସଂଖ୍ୟା ଏବଂ ବିଶେଷ ଅକ୍ଷର ରହିବା ଉଚିତ।',
    },
    'vt0ekyg5': {
      'en': 'Update Password',
      'or': 'ପାସୱାର୍ଡ ଅପଡେଟ୍ କରନ୍ତୁ',
    },
    'a1cf8rb1': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // SignUp
  {
    '6ux5ygbq': {
      'en': 'Shri Mohan Charan Majhi',
      'or': 'ଶ୍ରୀ ମୋହନ ଚରଣ ମାଝୀ',
    },
    '0d6tjxaz': {
      'en': 'Hon’ble Chief Minister of Odisha',
      'or': 'ଓଡ଼ିଶାର ମାନ୍ୟବର ମୁଖ୍ୟମନ୍ତ୍ରୀ',
    },
    'u19cx3nd': {
      'en':
          'Micro, Small & Medium Enterprise Department , Government of Odisha',
      'or': 'ସୂକ୍ଷ୍ମ, କ୍ଷୁଦ୍ର ଏବଂ ମଧ୍ୟମ ଉଦ୍ୟୋଗ ବିଭାଗ, ଓଡ଼ିଶା ସରକାର',
    },
    'ggkkny7m': {
      'en':
          'Micro, Small & Medium Enterprise Department , Government of Odisha',
      'or': 'ସୂକ୍ଷ୍ମ, କ୍ଷୁଦ୍ର ଏବଂ ମଧ୍ୟମ ଉଦ୍ୟୋଗ ବିଭାଗ, ଓଡ଼ିଶା ସରକାର',
    },
    'hy0l4tee': {
      'en': 'MSME',
      'or': 'ଏମଏସଏମଇ',
    },
    '7vbrvhb9': {
      'en': 'MSME Web Portal',
      'or': 'MSME ୱେବ୍ ପୋର୍ଟାଲ',
    },
    'j04fz1b2': {
      'en': 'Welcome! Sign in to your account',
      'or': 'ସ୍ୱାଗତ! ଆପଣଙ୍କ ଆକାଉଣ୍ଟରେ ସାଇନ୍ ଇନ୍ କରନ୍ତୁ',
    },
    'c88mkagp': {
      'en': 'Full Name',
      'or': 'ତୁମର ଇମେଲ୍',
    },
    'bk5xvwlg': {
      'en': 'Your Full Name',
      'or': 'ତୁମର ଇମେଲ୍',
    },
    'yso5geti': {
      'en': 'Your Email',
      'or': 'ତୁମର ଇମେଲ୍',
    },
    'aw7a4t1r': {
      'en': 'Your Email',
      'or': 'ତୁମର ଇମେଲ୍',
    },
    'hdlsgul0': {
      'en': 'Password',
      'or': 'ପାସୱାର୍ଡ',
    },
    'yn9z1trx': {
      'en': 'Password',
      'or': 'ପାସୱାର୍ଡ',
    },
    'plkgr76t': {
      'en': 'Re-Password',
      'or': 'ପୁନଃପାସୱାର୍ଡ',
    },
    'tsthdgrc': {
      'en': 'Password',
      'or': 'ପାସୱାର୍ଡ',
    },
    'n714wwmo': {
      'en': 'Enter captcha',
      'or': '',
    },
    'c86iiveo': {
      'en': 'Sign Up',
      'or': 'ସାଇନ୍ ଅପ୍ କରନ୍ତୁ',
    },
    'uzuvizif': {
      'en': 'Already have an account? ',
      'or': 'ପୂର୍ବରୁ ଏକ ଖାତା ଅଛି କି?',
    },
    'jcjqtg1v': {
      'en': 'Login',
      'or': 'ଲଗ୍ଇନ୍',
    },
    'xilh8pmn': {
      'en': 'Field is required',
      'or': 'କ୍ଷେତ୍ର ଆବଶ୍ୟକ ଅଟେ',
    },
    'r0lltc2c': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'es6ze06b': {
      'en': 'Your Email is required',
      'or': '',
    },
    '7lv4lll7': {
      'en': 'Please enter a valid email address',
      'or': '',
    },
    'i8479ttv': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'kgsqr5w2': {
      'en': 'Field is required',
      'or': 'କ୍ଷେତ୍ର ଆବଶ୍ୟକ ଅଟେ',
    },
    'htuab08l': {
      'en':
          'Password must be at least 12 characters and include:\n• One uppercase letter (A–Z)\n• One lowercase letter (a–z)\n• One number (0–9)\n• One special character (@\$!%*?&)',
      'or': '',
    },
    'qzr6iw9n': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'c9tpddob': {
      'en': 'Password is required',
      'or': '',
    },
    'f1jvokih': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'fs2rvo90': {
      'en': 'Captcha is required',
      'or': '',
    },
    'ad2f29wl': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'hdqua155': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // DashboardOsic
  {
    'en19ao1p': {
      'en': 'Dashboard',
      'or': 'ଡ୍ୟାସବୋର୍ଡ',
    },
    '7fn77wex': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    '4su8apt4': {
      'en': 'Govt Orders',
      'or': 'ସରକାରୀ ନିର୍ଦ୍ଦେଶ',
    },
    'abno0xam': {
      'en': 'Float Tenders',
      'or': 'ଫ୍ଲୋଟ୍ ଟେଣ୍ଡର',
    },
    'm9ztuauh': {
      'en': 'Supply Orders',
      'or': 'ଯୋଗାଣ ଅର୍ଡରଗୁଡ଼ିକ',
    },
    '1mylth6s': {
      'en': 'Tender Details',
      'or': 'ଟେଣ୍ଡର ଫଳାଫଳ',
    },
    'pwrqp3fo': {
      'en': 'GOVT ORDER',
      'or': 'ସରକାରୀ ନିର୍ଦ୍ଦେଶ',
    },
    'm4mve6ll': {
      'en': 'Order Title',
      'or': 'ଅର୍ଡର ଟାଇଟଲ୍',
    },
    'dj480cy1': {
      'en': 'Department',
      'or': 'ବିଭାଗ',
    },
    '9chk0ods': {
      'en': 'Contact Person',
      'or': 'ଯୋଗାଯୋଗ ବ୍ୟକ୍ତି',
    },
    '5ja50bud': {
      'en': 'Contact No.',
      'or': 'ଯୋଗାଯୋଗ ନମ୍ବର',
    },
    'v0av8wgq': {
      'en': 'Action',
      'or': 'କାର୍ଯ୍ୟ',
    },
    'b0ema1bc': {
      'en': 'Order Title',
      'or': 'ଅର୍ଡର ଟାଇଟଲ୍',
    },
    'lbrgg8wz': {
      'en': 'Department',
      'or': 'ବିଭାଗ',
    },
    '1qy00llj': {
      'en': 'Contact Person',
      'or': 'ଯୋଗାଯୋଗ ବ୍ୟକ୍ତି',
    },
    'v2lhzmzo': {
      'en': 'Contact No.',
      'or': 'ଯୋଗାଯୋଗ ନମ୍ବର',
    },
    'nhystf9m': {
      'en': 'Rows per pages:',
      'or': 'ପ୍ରତି ପୃଷ୍ଠା ଧାଡ଼ି:',
    },
    'jehiuqbr': {
      'en': '10',
      'or': '୧୦',
    },
    '8adl3yu1': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'cb0c276t': {
      'en': '5',
      'or': '5',
    },
    'jgz9tsuh': {
      'en': '10',
      'or': '୧୦',
    },
    'ozygo1gg': {
      'en': '25',
      'or': '୨୫',
    },
    '3862fqjj': {
      'en': '50',
      'or': '୫୦',
    },
    'ueqdnr3j': {
      'en': '100',
      'or': '୧୦୦',
    },
    'zjsv403b': {
      'en': '-',
      'or': '-',
    },
    'vej67emo': {
      'en': ' of ',
      'or': 'ର',
    },
    'atr6tslw': {
      'en': 'FLOAT TENDER',
      'or': 'ଫ୍ଲୋଟ୍ ଟେଣ୍ଡର',
    },
    'coxhcjiv': {
      'en': 'Tender No.',
      'or': 'ଟେଣ୍ଡର ନମ୍ବର',
    },
    'tnipyvgt': {
      'en': 'Project Title',
      'or': 'ପ୍ରୋଜେକ୍ଟ ଟାଇଟଲ୍',
    },
    'clx78iax': {
      'en': 'Tender Date',
      'or': 'ଟେଣ୍ଡର ତାରିଖ',
    },
    'd40q4qyp': {
      'en': 'Pre-Bid',
      'or': 'ପ୍ରି-ବିଡ୍',
    },
    'vui7ykjm': {
      'en': 'Submission',
      'or': 'ଦାଖଲ',
    },
    'toscv6j8': {
      'en': 'Bid Open',
      'or': 'ବିଡ୍ ଖୋଲା',
    },
    'wmf1o2wq': {
      'en': 'Action',
      'or': 'କାର୍ଯ୍ୟ',
    },
    'vkhwz9sf': {
      'en': 'Tender No.',
      'or': 'ଟେଣ୍ଡର ନମ୍ବର',
    },
    '322fekht': {
      'en': 'Project Title',
      'or': 'ପ୍ରୋଜେକ୍ଟ ଟାଇଟଲ୍',
    },
    'mn13laqz': {
      'en': 'Tender Date',
      'or': 'ଟେଣ୍ଡର ତାରିଖ',
    },
    'a8q4knec': {
      'en': 'Pre-Bid',
      'or': 'ପ୍ରି-ବିଡ୍',
    },
    '8ei9qo34': {
      'en': 'Submission',
      'or': 'ଦାଖଲ',
    },
    'qagjota2': {
      'en': 'Bid Open',
      'or': 'ବିଡ୍ ଖୋଲା',
    },
    'cv4467cj': {
      'en': 'Rows per pages:',
      'or': 'ପ୍ରତି ପୃଷ୍ଠା ଧାଡ଼ି:',
    },
    'kdzpeqn9': {
      'en': '10',
      'or': '୧୦',
    },
    'nfiqumkz': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'sjhrrenr': {
      'en': '5',
      'or': '5',
    },
    'k41s3jl1': {
      'en': '10',
      'or': '୧୦',
    },
    'dhlut09u': {
      'en': '25',
      'or': '୨୫',
    },
    'irer4htl': {
      'en': '50',
      'or': '୫୦',
    },
    '96nsjmuw': {
      'en': '100',
      'or': '୧୦୦',
    },
    'l4q8p095': {
      'en': '-',
      'or': '-',
    },
    'l0sz1xo6': {
      'en': ' of ',
      'or': 'ର',
    },
    '15v1u919': {
      'en': 'SUPPLY ORDER',
      'or': 'ଯୋଗାଣ ଅର୍ଡର',
    },
    'ttyompam': {
      'en': 'Supply Details',
      'or': 'ଯୋଗାଣ ବିବରଣୀ',
    },
    'yp8ljguj': {
      'en': 'Proof of Supply',
      'or': 'ଯୋଗାଣର ପ୍ରମାଣ',
    },
    'ow13m2n3': {
      'en': 'Invoice Status',
      'or': 'ଇନଭଏସ୍ ସ୍ଥିତି',
    },
    '51wbzcdy': {
      'en': '\tPayment Status',
      'or': 'ପେମେଣ୍ଟ ସ୍ଥିତି',
    },
    'iyndv89q': {
      'en': 'Action',
      'or': 'କାର୍ଯ୍ୟ',
    },
    'qnq3ytkf': {
      'en': 'Supply Details',
      'or': 'ଯୋଗାଣ ବିବରଣୀ',
    },
    '7xt6wo5r': {
      'en': 'Proof of Supply',
      'or': 'ଯୋଗାଣର ପ୍ରମାଣ',
    },
    'aarjh710': {
      'en': 'Invoice Status',
      'or': 'ଇନଭଏସ୍ ସ୍ଥିତି',
    },
    'zwm7id4z': {
      'en': 'Payment Status',
      'or': 'ପେମେଣ୍ଟ ସ୍ଥିତି',
    },
    'ktpnldse': {
      'en': 'Rows per pages:',
      'or': 'ପ୍ରତି ପୃଷ୍ଠା ଧାଡ଼ି:',
    },
    'fynbsf4x': {
      'en': '10',
      'or': '୧୦',
    },
    'kjrgdt7p': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'jidvzdws': {
      'en': '5',
      'or': '5',
    },
    'jpa46z2i': {
      'en': '10',
      'or': '୧୦',
    },
    'bahh4zsv': {
      'en': '25',
      'or': '୨୫',
    },
    '1zusrtoe': {
      'en': '50',
      'or': '୫୦',
    },
    'c4cumn90': {
      'en': '100',
      'or': '୧୦୦',
    },
    '3qzl0xg1': {
      'en': '-',
      'or': '-',
    },
    '6k6tavi5': {
      'en': ' of ',
      'or': 'ର',
    },
    'vcu5pn6z': {
      'en': 'TENDER Details',
      'or': 'ଟେଣ୍ଡର ଫଳାଫଳ',
    },
    'z1t7gj02': {
      'en': 'Tender No.',
      'or': 'ଟେଣ୍ଡର ନମ୍ବର',
    },
    'c5ma7cxo': {
      'en': 'Bidder Name',
      'or': 'ନିଲାମଦାତାଙ୍କ ନାମ',
    },
    'wtav5sm2': {
      'en': 'Bid Value',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    '031x929w': {
      'en': 'Score',
      'or': 'ସ୍କୋର୍‌',
    },
    'rluw2hre': {
      'en': 'Status',
      'or': 'ସ୍ଥିତି',
    },
    'pi0dfz69': {
      'en': ' Action',
      'or': 'କାର୍ଯ୍ୟ',
    },
    'orfxued5': {
      'en': 'Tender No.',
      'or': 'ଟେଣ୍ଡର ନମ୍ବର',
    },
    '17vjhurb': {
      'en': 'Date',
      'or': 'ସ୍କୋର୍‌',
    },
    '48yrawg2': {
      'en': 'Bidder Details',
      'or': 'ସ୍ଥିତି',
    },
    'gcyi2e2h': {
      'en': 'View ',
      'or': '',
    },
    'oqmnpizw': {
      'en': 'Rows per pages:',
      'or': 'ପ୍ରତି ପୃଷ୍ଠା ଧାଡ଼ି:',
    },
    'qfrnfhqs': {
      'en': '10',
      'or': '୧୦',
    },
    'dz2b3c16': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'sqh85rjc': {
      'en': '5',
      'or': '5',
    },
    'ip2rx8go': {
      'en': '10',
      'or': '୧୦',
    },
    'shisdm74': {
      'en': '25',
      'or': '୨୫',
    },
    '8m2v1f51': {
      'en': '50',
      'or': '୫୦',
    },
    'x52gzsug': {
      'en': '100',
      'or': '୧୦୦',
    },
    'ylfs5yi0': {
      'en': '-',
      'or': '-',
    },
    'tcae1e6b': {
      'en': ' of ',
      'or': 'ର',
    },
    'wms7xgn1': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // ApplicationListAdmin
  {
    'lvcwn31w': {
      'en': 'OTS Application List',
      'or': 'OTS ଆବେଦନ ତାଲିକା',
    },
    '783hw9ez': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'z4psy3vw': {
      'en': 'All',
      'or': 'ସମସ୍ତ',
    },
    'o8pm2gcm': {
      'en': 'OTS Form Applications',
      'or': 'OTS ଫର୍ମ ଆବେଦନ',
    },
    'jn1feraq': {
      'en': 'Search Loan Number',
      'or': 'ଋଣ ନମ୍ବର ଖୋଜନ୍ତୁ',
    },
    'g1b6uqfw': {
      'en': 'Search',
      'or': 'ଖୋଜନ୍ତୁ',
    },
    'zs3xbk69': {
      'en': 'Clear',
      'or': 'ଖାଲି କରନ୍ତୁ',
    },
    'd5an4njz': {
      'en': 'Search Loan Number is required',
      'or': '',
    },
    'd3xved6e': {
      'en': 'Enter full 13-character loan number.',
      'or': '',
    },
    '0445qwtk': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'qojh3mlv': {
      'en': 'Loan Number',
      'or': 'ଋଣ ନମ୍ବର',
    },
    'deogeo5z': {
      'en': 'User Name',
      'or': 'ଉପଯୋଗକର୍ତ୍ତା ନାମ',
    },
    'ugn6yccz': {
      'en': 'Apply Date',
      'or': 'ଆବେଦନ ତାରିଖ',
    },
    'm3kf8lhw': {
      'en': 'Status',
      'or': 'ସ୍ଥିତି',
    },
    'nymnfxjc': {
      'en': 'Actions',
      'or': 'କାର୍ଯ୍ୟ',
    },
    'x5smqfxj': {
      'en': 'Rows per pages:',
      'or': 'ପ୍ରତି ପୃଷ୍ଠା ଧାଡ଼ି:',
    },
    'p6ejq0pd': {
      'en': '10',
      'or': '୧୦',
    },
    'uw356vdu': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'e9fnioi7': {
      'en': '5',
      'or': '5',
    },
    'd2ltb4qa': {
      'en': '10',
      'or': '୧୦',
    },
    '5leajm3d': {
      'en': '25',
      'or': '୨୫',
    },
    '46zbcqjq': {
      'en': '50',
      'or': '୫୦',
    },
    'wct0qby1': {
      'en': '100',
      'or': '୧୦୦',
    },
    '2mek0rxb': {
      'en': '-',
      'or': '-',
    },
    '5nn2sm8r': {
      'en': ' of ',
      'or': 'ର',
    },
    '5px0ie79': {
      'en': 'Pending',
      'or': 'ବିଚାରାଧୀନ ଅଛି',
    },
    'f7f1rpvq': {
      'en': 'OTS Pending Applications',
      'or': 'OTS ବିଚାରାଧୀନ ଆବେଦନଗୁଡ଼ିକ',
    },
    'pi6satbq': {
      'en': 'Search Loan Number',
      'or': 'ଋଣ ନମ୍ବର ଖୋଜନ୍ତୁ',
    },
    '3op0tnio': {
      'en': 'Search',
      'or': 'ଖୋଜନ୍ତୁ',
    },
    'w01l6yty': {
      'en': 'Clear',
      'or': 'ଖାଲି କରନ୍ତୁ',
    },
    '56576t9l': {
      'en': 'Search Loan Number is required',
      'or': '',
    },
    '9wvzs4ke': {
      'en': 'Enter full 13-character loan number.',
      'or': '',
    },
    '0svh534j': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'eqbvhp7l': {
      'en': 'Loan Number',
      'or': 'ଋଣ ନମ୍ବର',
    },
    't23t8z4r': {
      'en': 'User Name',
      'or': 'ଉପଯୋଗକର୍ତ୍ତା ନାମ',
    },
    '7lmmdmgw': {
      'en': 'Apply Date',
      'or': 'ଆବେଦନ ତାରିଖ',
    },
    'kis9dm1s': {
      'en': 'Status',
      'or': 'ସ୍ଥିତି',
    },
    '7j0rsohr': {
      'en': 'Actions',
      'or': 'କାର୍ଯ୍ୟ',
    },
    '0wz68mu7': {
      'en': 'Rows per pages:',
      'or': 'ପ୍ରତି ପୃଷ୍ଠା ଧାଡ଼ି:',
    },
    'r0266zx8': {
      'en': '10',
      'or': '୧୦',
    },
    'ewqpukmb': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'gqiab0mc': {
      'en': '5',
      'or': '5',
    },
    'kakz1tq0': {
      'en': '10',
      'or': '୧୦',
    },
    'qf3qwrxy': {
      'en': '25',
      'or': '୨୫',
    },
    'vvez2enj': {
      'en': '50',
      'or': '୫୦',
    },
    'qj1ttwa1': {
      'en': '100',
      'or': '୧୦୦',
    },
    'n4d6wqbw': {
      'en': '-',
      'or': '-',
    },
    'ec0v6wvb': {
      'en': ' of ',
      'or': 'ର',
    },
    '1jdid65a': {
      'en': 'Approved',
      'or': 'ଅନୁମୋଦିତ ହୋଇଛି',
    },
    'ax4cow6a': {
      'en': 'OTS Approved Applications',
      'or': 'OTS ଅନୁମୋଦିତ ଆବେଦନପତ୍ରଗୁଡ଼ିକ',
    },
    '2w48sxx0': {
      'en': 'Search Loan Number',
      'or': 'ଋଣ ନମ୍ବର ଖୋଜନ୍ତୁ',
    },
    'cppbzd75': {
      'en': 'Search',
      'or': 'ଖୋଜନ୍ତୁ',
    },
    'mer2nzcp': {
      'en': 'Clear',
      'or': 'ଖାଲି କରନ୍ତୁ',
    },
    'cnr7ni6o': {
      'en': 'Search Loan Number is required',
      'or': '',
    },
    'bbjmp2z7': {
      'en': 'Enter full 13-character loan number.',
      'or': '',
    },
    '5pim6p5e': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'zsyolkec': {
      'en': 'Loan Number',
      'or': 'ଋଣ ନମ୍ବର',
    },
    'tqjbva9c': {
      'en': 'User Name',
      'or': 'ଉପଯୋଗକର୍ତ୍ତା ନାମ',
    },
    '44n9pt4c': {
      'en': 'Apply Date',
      'or': 'ଆବେଦନ ତାରିଖ',
    },
    'b1h5v3fc': {
      'en': 'Status',
      'or': 'ସ୍ଥିତି',
    },
    'mrwvtxfo': {
      'en': 'Actions',
      'or': 'କାର୍ଯ୍ୟ',
    },
    'sp9s5llo': {
      'en': 'Rows per pages:',
      'or': 'ପ୍ରତି ପୃଷ୍ଠା ଧାଡ଼ି:',
    },
    'hvjg6etv': {
      'en': '10',
      'or': '୧୦',
    },
    'sizbne6j': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    '7a0fin67': {
      'en': '5',
      'or': '5',
    },
    'mtnxvufi': {
      'en': '10',
      'or': '୧୦',
    },
    '2ze08uxx': {
      'en': '25',
      'or': '୨୫',
    },
    'ph5icj3i': {
      'en': '50',
      'or': '୫୦',
    },
    'xk9thyec': {
      'en': '100',
      'or': '୧୦୦',
    },
    'x45wxc1k': {
      'en': '-',
      'or': '-',
    },
    '2occ80z3': {
      'en': ' of ',
      'or': 'ର',
    },
    'hk5jh4gu': {
      'en': 'Rejected',
      'or': 'ପ୍ରତ୍ୟାଖ୍ୟାନ କରାଗଲା',
    },
    'd113jpzf': {
      'en': 'OTS Form Applications',
      'or': 'OTS ଫର୍ମ ଆବେଦନ',
    },
    'ebagj1jk': {
      'en': 'Search Loan Number',
      'or': 'ଋଣ ନମ୍ବର ଖୋଜନ୍ତୁ',
    },
    'nlzmafgo': {
      'en': 'Search',
      'or': 'ଖୋଜନ୍ତୁ',
    },
    'afzt50nc': {
      'en': 'Clear',
      'or': 'ଖାଲି କରନ୍ତୁ',
    },
    'q2t4rx5z': {
      'en': 'Search Loan Number is required',
      'or': '',
    },
    'fptiv0yp': {
      'en': 'Enter full 13-character loan number.',
      'or': '',
    },
    'blx8d5wv': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'dcefr1ib': {
      'en': 'Loan Number',
      'or': 'ଋଣ ନମ୍ବର',
    },
    'mklvohfn': {
      'en': 'User Name',
      'or': 'ଉପଯୋଗକର୍ତ୍ତା ନାମ',
    },
    'g17kzzg8': {
      'en': 'Apply Date',
      'or': 'ଆବେଦନ ତାରିଖ',
    },
    '2r6s8bkm': {
      'en': 'Status',
      'or': 'ସ୍ଥିତି',
    },
    '39270orz': {
      'en': 'Actions',
      'or': 'କାର୍ଯ୍ୟ',
    },
    'og4hgzem': {
      'en': 'Rows per pages:',
      'or': 'ପ୍ରତି ପୃଷ୍ଠା ଧାଡ଼ି:',
    },
    'irndy7jk': {
      'en': '10',
      'or': '୧୦',
    },
    '1txae5gd': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'k70e9a1t': {
      'en': '5',
      'or': '5',
    },
    'isxrawsm': {
      'en': '10',
      'or': '୧୦',
    },
    'h029l1c6': {
      'en': '25',
      'or': '୨୫',
    },
    'yous9dir': {
      'en': '50',
      'or': '୫୦',
    },
    'tw84tz57': {
      'en': '100',
      'or': '୧୦୦',
    },
    '60lz3v31': {
      'en': '-',
      'or': '-',
    },
    'dmmj4bw5': {
      'en': ' of ',
      'or': 'ର',
    },
    'lb0lepj8': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // NoDueCertificateAdmin
  {
    '01gvh8p6': {
      'en': 'No Due Certificate',
      'or': 'କୌଣସି ଦେୟ ପ୍ରମାଣପତ୍ର ନାହିଁ',
    },
    'zao4yt25': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'z2cvf28n': {
      'en': 'Upload No Due Certificate',
      'or': 'କୌଣସି ବାକି ନାହିଁ ସାର୍ଟିଫିକେଟ୍ ଅପଲୋଡ୍ କରନ୍ତୁ',
    },
    '864vsun2': {
      'en': 'Enter Loan number...',
      'or': 'ଋଣ ନମ୍ବର ପ୍ରବେଶ କରନ୍ତୁ...',
    },
    'kbsax37k': {
      'en': 'Upload PDF',
      'or': 'PDF ଅପଲୋଡ୍ କରନ୍ତୁ',
    },
    'mva27tje': {
      'en': 'Submit',
      'or': 'ଦାଖଲ କରନ୍ତୁ',
    },
    'rs7b2gia': {
      'en': 'Loan number is required',
      'or': '',
    },
    '2onnej4y': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'eh6ooxdt': {
      'en': 'No Due Certificate Status',
      'or': 'କୌଣସି ବାକି ସାର୍ଟିଫିକେଟ୍ ସ୍ଥିତି ନାହିଁ',
    },
    'czl6cn0r': {
      'en': 'Search Loan Number',
      'or': 'ଋଣ ନମ୍ବର ଖୋଜନ୍ତୁ',
    },
    '8gjbn8vr': {
      'en': 'Search',
      'or': 'ଖୋଜନ୍ତୁ',
    },
    '050x6a29': {
      'en': 'Clear',
      'or': 'ଖାଲି କରନ୍ତୁ',
    },
    'fuoma55e': {
      'en': 'Search Loan Number is required',
      'or': '',
    },
    'mlpul6a2': {
      'en': 'Enter full 13-character loan number.',
      'or': '',
    },
    'q740tgbj': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'htk8ujxa': {
      'en': 'Loan Number',
      'or': 'ଋଣ ନମ୍ବର',
    },
    'qodvznz0': {
      'en': 'User Name',
      'or': 'ଉପଯୋଗକର୍ତ୍ତା ନାମ',
    },
    '2fcgkd41': {
      'en': 'OTS Apply Date',
      'or': 'OTS ଆବେଦନ ତାରିଖ',
    },
    'v51phma4': {
      'en': 'Uploaded Date',
      'or': 'ଅପଲୋଡ୍ କରାଯାଇଥିବା ତାରିଖ',
    },
    'sybgdmsl': {
      'en': 'Actions',
      'or': 'କାର୍ଯ୍ୟ',
    },
    'qyci8q1s': {
      'en': 'Rows per pages:',
      'or': 'ପ୍ରତି ପୃଷ୍ଠା ଧାଡ଼ି:',
    },
    'khs9jntz': {
      'en': '10',
      'or': '୧୦',
    },
    'taxq38qw': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'syogrjfz': {
      'en': '5',
      'or': '5',
    },
    'meu25kon': {
      'en': '10',
      'or': '୧୦',
    },
    'r8emuepl': {
      'en': '25',
      'or': '୨୫',
    },
    'zq4c6pkp': {
      'en': '50',
      'or': '୫୦',
    },
    'ah459ock': {
      'en': '100',
      'or': '୧୦୦',
    },
    '610776oj': {
      'en': '-',
      'or': '-',
    },
    'kn97fks5': {
      'en': ' of ',
      'or': 'ର',
    },
    'gyvh0lgu': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // NewOtsForm
  {
    'rqzjiaef': {
      'en': 'Apply for OTS',
      'or': 'OTS ପାଇଁ ଆବେଦନ କରନ୍ତୁ',
    },
    'ipgjerjz': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'kcv2uvgh': {
      'en': 'A-',
      'or': 'କ-',
    },
    '0e0gc4ep': {
      'en': 'A',
      'or': 'କ',
    },
    '3milbrzn': {
      'en': 'A+',
      'or': 'କ+',
    },
    'ddaoltxp': {
      'en': 'Application',
      'or': 'ପ୍ରୟୋଗ',
    },
    '9bfookwf': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    '7zsfy5ag': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    '2xev0lf0': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    'hga1w7vy': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    'gzsy6vzl': {
      'en': 'Number',
      'or': 'ସଂଖ୍ୟା',
    },
    'rj80e96f': {
      'en': 'E-mail',
      'or': 'ଇ-ମେଲ୍',
    },
    'dl5p1ja2': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    'shfmjltr': {
      'en': 'Branch',
      'or': 'ଶାଖା',
    },
    '33wxftcx': {
      'en': 'State',
      'or': 'ରାଜ୍ୟ',
    },
    'qn7ysfqn': {
      'en': 'City',
      'or': 'ସହର',
    },
    'f12bshjg': {
      'en': 'Pin-Code',
      'or': 'ପିନ୍-କୋଡ୍',
    },
    'cburj4gv': {
      'en': 'Total outstanding liablity to OSFC as on the date of application.',
      'or': 'ଆବେଦନ ତାରିଖ ସୁଦ୍ଧା OSFC ପ୍ରତି ମୋଟ ବକେୟା ଦାୟିତ୍ବ।',
    },
    'pdm21vvx': {
      'en': 'Nature of industry/product/type of the unit/company',
      'or': 'ଶିଳ୍ପ/ଉତ୍ପାଦର ପ୍ରକୃତି/ୟୁନିଟ୍/କମ୍ପାନୀର ପ୍ରକାର',
    },
    '1j1pao3y': {
      'en':
          'The Present Level of operation of vehicle with Regn. No. (In case the unit/company is not in operation and reasons thereof.)',
      'or':
          'ରେଜିଷ୍ଟ୍ରେସନ ନମ୍ବର ସହିତ ଯାନର ବର୍ତ୍ତମାନର କାର୍ଯ୍ୟ ସ୍ତର (ଯଦି ୟୁନିଟ୍/କମ୍ପାନୀ କାର୍ଯ୍ୟକ୍ଷମ ନଥାଏ ଏବଂ ତାହାର କାରଣ।)',
    },
    'rqnirxyu': {
      'en': 'Reasons of non-payment of Corporation\'s dues:',
      'or': 'ନିଗମର ଦେୟ ନଦେବାର କାରଣ:',
    },
    '6nt1e4cr': {
      'en':
          'Details of dues, to other institutions,Fls,Banks Including details of settlements reached with them if any.',
      'or':
          'ଅନ୍ୟ ପ୍ରତିଷ୍ଠାନ, ଫ୍ଲାଟ୍, ବ୍ୟାଙ୍କକୁ ଦେୟ ପ୍ରଦାନର ବିବରଣୀ, ସେମାନଙ୍କ ସହିତ ହୋଇଥିବା ସମାଧାନର ବିବରଣୀ ସମେତ, ଯଦି କୌଣସି ଥାଏ।',
    },
    'd1tesm4t': {
      'en': 'Whether defaulter to other Banks/Fls, if so status of NPA?',
      'or': 'ଅନ୍ୟ ବ୍ୟାଙ୍କ/ଫ୍ଲାନ୍ସର ଖିଲାପୀ କି, ଯଦି ଅଛି ତେବେ NPA ର ସ୍ଥିତି?',
    },
    '7g2n2z9z': {
      'en':
          'Sailient operational and financial hights of the unit/company for the last 3 financial years in case of disbursement of all eligible loans above rs.30.00 lakh. (Audited Balance Sheet & P/L A/c.of the unit/company for the last 3 years, and Net worth certificate of borrower/applicationt by the Chartered Accountant is enclosed.)',
      'or':
          '୩୦.୦୦ ଲକ୍ଷ ଟଙ୍କାରୁ ଅଧିକ ମୂଲ୍ୟର ସମସ୍ତ ଯୋଗ୍ୟ ଋଣ ପ୍ରଦାନ କ୍ଷେତ୍ରରେ ୟୁନିଟ୍/କମ୍ପାନୀର ଗତ ୩ ଆର୍ଥିକ ବର୍ଷ ପାଇଁ ସଜାଗ କାର୍ଯ୍ୟକ୍ଷମ ଏବଂ ଆର୍ଥିକ ଉଚ୍ଚତା। (ଗତ ୩ ବର୍ଷ ପାଇଁ ୟୁନିଟ୍/କମ୍ପାନୀର ଅଡିଟେଡ୍ ବାଲାନ୍ସ ସିଟ୍ ଏବଂ ପି/ଏଲ୍/ସି, ଏବଂ ଚାଟାର୍ଡ ଆକାଉଣ୍ଟାଣ୍ଟଙ୍କ ଦ୍ୱାରା ଋଣଗ୍ରହୀତାଙ୍କ/ଆବେଦନର ନେଟ୍ ୱର୍ଥ ପ୍ରମାଣପତ୍ର ସଂଲଗ୍ନ କରାଯାଇଛି।)',
    },
    'uzjndqik': {
      'en': 'Reasons for settlement of loan dues under OTS',
      'or': 'OTS ଅଧୀନରେ ଋଣ ଦେୟ ସମାଧାନର କାରଣ',
    },
    't7b7jv8e': {
      'en': 'Sources of payment of settlement amount',
      'or': 'ସମାଧାନ ରାଶିର ଦେୟ ପାଇଁ ଉତ୍ସ',
    },
    'fs1klvg9': {
      'en': 'Terms of payment of the porposed OTS amount',
      'or': 'ପ୍ରସ୍ତାବିତ OTS ରାଶିର ଦେୟ ସର୍ତ୍ତାବଳୀ',
    },
    'q9qhf368': {
      'en': 'Any other particulars that may be relevant to mention.',
      'or': 'ଉଲ୍ଲେଖ କରିବା ପାଇଁ ପ୍ରାସଙ୍ଗିକ ହୋଇପାରେ ଏପରି ଅନ୍ୟ କୌଣସି ବିବରଣୀ।',
    },
    '9k8llcy1': {
      'en':
          'I/We would request you to consider my/our above offer and advise me/us of the decision taken in this regard at an early date. I/we would be happy to provide any further information/clarification, if needed, to the corporation.',
      'or':
          'ମୁଁ/ଆମେ ଆପଣଙ୍କୁ ଅନୁରୋଧ କରିବୁ ଯେ ମୋର/ଆମର ଉପରୋକ୍ତ ପ୍ରସ୍ତାବ ଉପରେ ବିଚାର କରନ୍ତୁ ଏବଂ ଏ ସମ୍ପର୍କରେ ନିଆଯାଇଥିବା ନିଷ୍ପତ୍ତି ବିଷୟରେ ମୋତେ/ଆମକୁ ଶୀଘ୍ର ଅବଗତ କରାନ୍ତୁ। ଆବଶ୍ୟକ ହେଲେ, ମୁଁ/ଆମେ ନିଗମକୁ ଅଧିକ ସୂଚନା/ସ୍ପଷ୍ଟୀକରଣ ପ୍ରଦାନ କରିବାକୁ ଖୁସି ହେବୁ।',
    },
    '2tvkyva4': {
      'en':
          'I/We do here by undertake that I/we Will continue payment towerds my/our current dues in terms of loan agrement pending settlement of dues under the OTS Policy-2011. I/We shall not have any claim on delay decision and/or an unfavorable decision on my/our loan settlemente claims/dues. I/We will not have any claims in case the corporation adjusts the initial deposit(s)  and subsequent payment made for settlement of dues under the OTS Policy-2011 towerds normal loan dues on non-compiance of thge terms and conditions of the policy by me/us either in part or full within stipulated time as prescribed in the policy.',
      'or':
          'ମୁଁ/ଆମେ ଏଠାରେ ପ୍ରତିଶ୍ରୁତି ଦେଉଛୁ ଯେ ମୁଁ/ଆମେ OTS ନୀତି-2011 ଅନୁଯାୟୀ ଦେୟ ସମାଧାନ ପାଇଁ ବିଚାରାଧୀନ ଋଣ ଚୁକ୍ତି ଅନୁଯାୟୀ ମୋର/ଆମର ବର୍ତ୍ତମାନର ଦେୟ ପ୍ରଦାନ ଜାରି ରଖିବୁ। ମୋର/ଆମର ଋଣ ସମାଧାନ ଦାବି/ପାଏ ଉପରେ ବିଳମ୍ବ ନିଷ୍ପତ୍ତି ଏବଂ/ଅଥବା ପ୍ରତିକୂଳ ନିଷ୍ପତ୍ତି ଉପରେ ମୋର/ଆମର କୌଣସି ଦାବି ରହିବ ନାହିଁ। ଯଦି ନିଗମ OTS ନୀତି-2011 ଅନୁଯାୟୀ ଦେୟ ସମାଧାନ ପାଇଁ ପ୍ରାରମ୍ଭିକ ଜମା(ଗୁଡ଼ିକ) ଏବଂ ପରବର୍ତ୍ତୀ ଦେୟକୁ ମୋ/ଆମ ଦ୍ୱାରା ନୀତିରେ ନିର୍ଦ୍ଧାରିତ ସମୟ ମଧ୍ୟରେ ଆଂଶିକ କିମ୍ବା ପୂର୍ଣ୍ଣ ଭାବରେ ପରିଚାଳନା ନକରେ, ତେବେ ମୋର/ଆମର କୌଣସି ଦାବି ରହିବ ନାହିଁ।',
    },
    'rwuv4gof': {
      'en':
          'I/We hereby undertake to pay the settlement of eligible loans as per the scheme parameters.',
      'or':
          'ମୁଁ/ଆମେ ଯୋଜନାର ମାନଦଣ୍ଡ ଅନୁଯାୟୀ ଯୋଗ୍ୟ ଋଣର ସମାଧାନ ପାଇଁ ପ୍ରତିଶ୍ରୁତି ଦେଉଛୁ।',
    },
    '47a25qwn': {
      'en':
          'I/We hereby certify that the above information is true to the best of my knowledge.',
      'or':
          'ମୁଁ/ଆମେ ଏହାଦ୍ୱାରା ପ୍ରମାଣିତ କରୁଛୁ ଯେ ଉପରୋକ୍ତ ସୂଚନା ମୋର ସର୍ବୋତ୍ତମ ଜ୍ଞାନ ଅନୁସାରେ ସତ୍ୟ।',
    },
    'zxwiincx': {
      'en': '1 Hackerway, SF is required',
      'or': '୧ ହ୍ୟାକରୱେ, SF ଆବଶ୍ୟକ।',
    },
    'rvhv2fhj': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'fkln2wg7': {
      'en': '1 Hackerway, SF is required',
      'or': '୧ ହ୍ୟାକରୱେ, SF ଆବଶ୍ୟକ।',
    },
    've9hzbrk': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    '7d9mqwxs': {
      'en': '1 Hackerway, SF is required',
      'or': '୧ ହ୍ୟାକରୱେ, SF ଆବଶ୍ୟକ।',
    },
    'obn7i2h6': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'afyji4tc': {
      'en': '1 Hackerway, SF is required',
      'or': '୧ ହ୍ୟାକରୱେ, SF ଆବଶ୍ୟକ।',
    },
    '37dlf66y': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    '605qf792': {
      'en': '1 Hackerway, SF is required',
      'or': '୧ ହ୍ୟାକରୱେ, SF ଆବଶ୍ୟକ।',
    },
    'oushmtcr': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'z4m7qdmg': {
      'en': '1 Hackerway, SF is required',
      'or': '୧ ହ୍ୟାକରୱେ, SF ଆବଶ୍ୟକ।',
    },
    'lqwj7y7h': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    '9p1p3hxh': {
      'en': '1 Hackerway, SF is required',
      'or': '୧ ହ୍ୟାକରୱେ, SF ଆବଶ୍ୟକ।',
    },
    'xpu2quhj': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    '7qu3lziq': {
      'en': '1 Hackerway, SF is required',
      'or': '୧ ହ୍ୟାକରୱେ, SF ଆବଶ୍ୟକ।',
    },
    'j6i9l69o': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'xkvdtvtu': {
      'en': '1 Hackerway, SF is required',
      'or': '୧ ହ୍ୟାକରୱେ, SF ଆବଶ୍ୟକ।',
    },
    'eo8j8huw': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    '90gy4zx6': {
      'en': '1 Hackerway, SF is required',
      'or': '୧ ହ୍ୟାକରୱେ, SF ଆବଶ୍ୟକ।',
    },
    'ket78sxa': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'ugve56oe': {
      'en': 'Edit',
      'or': 'ସମ୍ପାଦନ କରନ୍ତୁ',
    },
    '1xtnc1vn': {
      'en': 'Submit',
      'or': 'ଦାଖଲ କରନ୍ତୁ',
    },
    'ng0ilt1x': {
      'en': 'Application',
      'or': 'ପ୍ରୟୋଗ',
    },
    'j419enek': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    'vrkkh7g8': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    'ogcf3ehu': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    'vcpckf8c': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    'n1g5rh8h': {
      'en': 'Number',
      'or': 'ସଂଖ୍ୟା',
    },
    '0x1qu8pa': {
      'en': 'E-mail',
      'or': 'ଇ-ମେଲ୍',
    },
    'ys0ykdwk': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    'ysacm2c6': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    '0ft8lybl': {
      'en': 'Branch',
      'or': 'ଶାଖା',
    },
    '8wp6waw2': {
      'en': 'Select...',
      'or': 'ଚୟନ କରନ୍ତୁ...',
    },
    '7b789s10': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'rlwy93pz': {
      'en': 'Paradip',
      'or': 'ପାରାଦୀପ',
    },
    '20nyq2zb': {
      'en': 'Cuttack',
      'or': 'କଟକ',
    },
    '2defvup1': {
      'en': 'Bhubaneswar',
      'or': 'ଭୁବନେଶ୍ୱର',
    },
    '5nesx2mo': {
      'en': 'State',
      'or': 'ରାଜ୍ୟ',
    },
    'ufrcrfzs': {
      'en': 'State',
      'or': 'ରାଜ୍ୟ',
    },
    'lwa5oj3z': {
      'en': 'City',
      'or': 'ସହର',
    },
    'wpghm4pl': {
      'en': 'City',
      'or': 'ସହର',
    },
    'k93ksgc9': {
      'en': 'Pin-Code',
      'or': 'ପିନ୍-କୋଡ୍',
    },
    'oci9mibk': {
      'en': 'Pin-Code',
      'or': 'ପିନ୍-କୋଡ୍',
    },
    'fyyxp7hz': {
      'en': 'First Name is required',
      'or': 'ପ୍ରଥମ ନାମ ଆବଶ୍ୟକୀୟ',
    },
    'des7fdsj': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'cejkkojq': {
      'en': 'Last Name is required',
      'or': 'ଶେଷ ନାମ ଆବଶ୍ୟକୀୟ',
    },
    '0jtrgc94': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'n69rnudw': {
      'en': 'Number is required',
      'or': 'ନମ୍ବର ଆବଶ୍ୟକ',
    },
    '7crpszej': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'ubyv6wri': {
      'en': 'E-Mail Id is required',
      'or': 'ଇ-ମେଲ୍ ଆଇଡି ଆବଶ୍ୟକ।',
    },
    '4fkfnwbm': {
      'en': 'Please enter a valid email address',
      'or': '',
    },
    'ymblnfgx': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'dkjw61tf': {
      'en': 'This field is required.',
      'or': 'ଏହି କ୍ଷେତ୍ରଟି ଆବଶ୍ୟକ।',
    },
    '4lrbah0m': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    '246vk3ax': {
      'en': 'State is required.',
      'or': 'ରାଜ୍ୟ ଆବଶ୍ୟକ।',
    },
    'seyjwmeo': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'jplmsyjt': {
      'en': 'City is required',
      'or': 'ସହର ଆବଶ୍ୟକ',
    },
    'o9baxthc': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'uiubvxhf': {
      'en': 'Pin-Code is required',
      'or': 'ପିନ୍-କୋଡ୍ ଆବଶ୍ୟକ',
    },
    'c7l8o4kk': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'a9tn1909': {
      'en': 'Total outstanding liablity to OSFC as on the date of application.',
      'or': 'ଆବେଦନ ତାରିଖ ସୁଦ୍ଧା OSFC ପ୍ରତି ମୋଟ ବକେୟା ଦାୟିତ୍ବ।',
    },
    'mjx38ure': {
      'en': 'Nature of industry/product/type of the unit/company',
      'or': 'ଶିଳ୍ପ/ଉତ୍ପାଦର ପ୍ରକୃତି/ୟୁନିଟ୍/କମ୍ପାନୀର ପ୍ରକାର',
    },
    'zx8y8x54': {
      'en':
          'The Present Level of operation of vehicle with Regn. No. (In case the unit/company is not in operation and reasons thereof.)',
      'or':
          'ରେଜିଷ୍ଟ୍ରେସନ ନମ୍ବର ସହିତ ଯାନର ବର୍ତ୍ତମାନର କାର୍ଯ୍ୟ ସ୍ତର (ଯଦି ୟୁନିଟ୍/କମ୍ପାନୀ କାର୍ଯ୍ୟକ୍ଷମ ନଥାଏ ଏବଂ ତାହାର କାରଣ।)',
    },
    '08u9av5w': {
      'en': 'Reasons of non-payment of Corporation\'s dues:',
      'or': 'ନିଗମର ଦେୟ ନଦେବାର କାରଣ:',
    },
    'h1w9orhf': {
      'en':
          'Details of dues, to other institutions,Fls,Banks Including details of settlements reached with them if any.',
      'or':
          'ଅନ୍ୟ ପ୍ରତିଷ୍ଠାନ, ଫ୍ଲାଟ୍, ବ୍ୟାଙ୍କକୁ ଦେୟ ପ୍ରଦାନର ବିବରଣୀ, ସେମାନଙ୍କ ସହିତ ହୋଇଥିବା ସମାଧାନର ବିବରଣୀ ସମେତ, ଯଦି କୌଣସି ଥାଏ।',
    },
    '2hellzwx': {
      'en': 'Whether defaulter to other Banks/Fls, if so status of NPA?',
      'or': 'ଅନ୍ୟ ବ୍ୟାଙ୍କ/ଫ୍ଲାନ୍ସର ଖିଲାପୀ କି, ଯଦି ଅଛି ତେବେ NPA ର ସ୍ଥିତି?',
    },
    'jyhephwq': {
      'en':
          'Sailient operational and financial hights of the unit/company for the last 3 financial years in case of disbursement of all eligible loans above rs.30.00 lakh. (Audited Balance Sheet & P/L A/c.of the unit/company for the last 3 years, and Net worth certificate of borrower/applicationt by the Chartered Accountant is enclosed.)',
      'or':
          '୩୦.୦୦ ଲକ୍ଷ ଟଙ୍କାରୁ ଅଧିକ ମୂଲ୍ୟର ସମସ୍ତ ଯୋଗ୍ୟ ଋଣ ପ୍ରଦାନ କ୍ଷେତ୍ରରେ ୟୁନିଟ୍/କମ୍ପାନୀର ଗତ ୩ ଆର୍ଥିକ ବର୍ଷ ପାଇଁ ସଜାଗ କାର୍ଯ୍ୟକ୍ଷମ ଏବଂ ଆର୍ଥିକ ଉଚ୍ଚତା। (ଗତ ୩ ବର୍ଷ ପାଇଁ ୟୁନିଟ୍/କମ୍ପାନୀର ଅଡିଟେଡ୍ ବାଲାନ୍ସ ସିଟ୍ ଏବଂ ପି/ଏଲ୍/ସି, ଏବଂ ଚାଟାର୍ଡ ଆକାଉଣ୍ଟାଣ୍ଟଙ୍କ ଦ୍ୱାରା ଋଣଗ୍ରହୀତାଙ୍କ/ଆବେଦନର ନେଟ୍ ୱର୍ଥ ପ୍ରମାଣପତ୍ର ସଂଲଗ୍ନ କରାଯାଇଛି।)',
    },
    'y78z08ty': {
      'en': 'Reasons for settlement of loan dues under OTS',
      'or': 'OTS ଅଧୀନରେ ଋଣ ଦେୟ ସମାଧାନର କାରଣ',
    },
    'vjrffmsv': {
      'en': 'Sources of payment of settlement amount',
      'or': 'ସମାଧାନ ରାଶିର ଦେୟ ପାଇଁ ଉତ୍ସ',
    },
    'wwlix1lp': {
      'en': 'Terms of payment of the porposed OTS amount',
      'or': 'ପ୍ରସ୍ତାବିତ OTS ରାଶିର ଦେୟ ସର୍ତ୍ତାବଳୀ',
    },
    'nnfojtyh': {
      'en': 'Select...',
      'or': 'ଚୟନ କରନ୍ତୁ...',
    },
    'eds1pwrz': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'pcd1gu6i': {
      'en':
          'Settlement amount to be paid with 60 days of its formal communication',
      'or': 'ଆନୁଷ୍ଠାନିକ ଯୋଗାଯୋଗର 60 ଦିନ ମଧ୍ୟରେ ସମାଧାନ ପରିମାଣ ପୈଠ କରିବାକୁ ପଡିବ',
    },
    'j9cm8cq2': {
      'en':
          'To be paid within one year from the date of issue of settlement order in 12 equated monthly installments with amount beyond 30 days. (Strike off whichever is not applicable)',
      'or':
          'ସମାଧାନ ଅର୍ଡର ଜାରି ହେବାର ଏକ ବର୍ଷ ମଧ୍ୟରେ 30 ଦିନରୁ ଅଧିକ ପରିମାଣର 12ଟି ସମାନ ମାସିକ କିସ୍ତିରେ ପୈଠ କରାଯିବ। (ଯେଉଁଟି ପ୍ରଯୁଜ୍ୟ ନୁହେଁ ତାହା କାଟି ଦିଅନ୍ତୁ)',
    },
    'p0gswdym': {
      'en':
          'All in eligible loan dues shall be paid along with the settlement amount within the period as at \"a\" above.',
      'or':
          'ଉପରୋକ୍ତ \"କ\" ରେ ଥିବା ସମୟ ମଧ୍ୟରେ ସମସ୍ତ ଯୋଗ୍ୟ ଋଣ ଦେୟ ସମାଧାନ ପରିମାଣ ସହିତ ପରିଶୋଧ କରାଯିବ।',
    },
    'w4y1aexo': {
      'en': 'Any other particulars that may be relevant to mention.',
      'or': 'ଉଲ୍ଲେଖ କରିବା ପାଇଁ ପ୍ରାସଙ୍ଗିକ ହୋଇପାରେ ଏପରି ଅନ୍ୟ କୌଣସି ବିବରଣୀ।',
    },
    'ntponpz2': {
      'en':
          'I/We would request you to consider my/our above offer and advise me/us of the decision taken in this regard at an early date. I/we would be happy to provide any further information/clarification, if needed, to the corporation.',
      'or':
          'ମୁଁ/ଆମେ ଆପଣଙ୍କୁ ଅନୁରୋଧ କରିବୁ ଯେ ମୋର/ଆମର ଉପରୋକ୍ତ ପ୍ରସ୍ତାବ ଉପରେ ବିଚାର କରନ୍ତୁ ଏବଂ ଏ ସମ୍ପର୍କରେ ନିଆଯାଇଥିବା ନିଷ୍ପତ୍ତି ବିଷୟରେ ମୋତେ/ଆମକୁ ଶୀଘ୍ର ଅବଗତ କରାନ୍ତୁ। ଆବଶ୍ୟକ ହେଲେ, ମୁଁ/ଆମେ ନିଗମକୁ ଅଧିକ ସୂଚନା/ସ୍ପଷ୍ଟୀକରଣ ପ୍ରଦାନ କରିବାକୁ ଖୁସି ହେବୁ।',
    },
    '0rjcpkto': {
      'en':
          'I/We do here by undertake that I/we Will continue payment towerds my/our current dues in terms of loan agrement pending settlement of dues under the OTS Policy-2011. I/We shall not have any claim on delay decision and/or an unfavorable decision on my/our loan settlemente claims/dues. I/We will not have any claims in case the corporation adjusts the initial deposit(s)  and subsequent payment made for settlement of dues under the OTS Policy-2011 towerds normal loan dues on non-compiance of thge terms and conditions of the policy by me/us either in part or full within stipulated time as prescribed in the policy.',
      'or':
          'ମୁଁ/ଆମେ ଏଠାରେ ପ୍ରତିଶ୍ରୁତି ଦେଉଛୁ ଯେ ମୁଁ/ଆମେ OTS ନୀତି-2011 ଅନୁଯାୟୀ ଦେୟ ସମାଧାନ ପାଇଁ ବିଚାରାଧୀନ ଋଣ ଚୁକ୍ତି ଅନୁଯାୟୀ ମୋର/ଆମର ବର୍ତ୍ତମାନର ଦେୟ ପ୍ରଦାନ ଜାରି ରଖିବୁ। ମୋର/ଆମର ଋଣ ସମାଧାନ ଦାବି/ପାଏ ଉପରେ ବିଳମ୍ବ ନିଷ୍ପତ୍ତି ଏବଂ/ଅଥବା ପ୍ରତିକୂଳ ନିଷ୍ପତ୍ତି ଉପରେ ମୋର/ଆମର କୌଣସି ଦାବି ରହିବ ନାହିଁ। ଯଦି ନିଗମ OTS ନୀତି-2011 ଅନୁଯାୟୀ ଦେୟ ସମାଧାନ ପାଇଁ ପ୍ରାରମ୍ଭିକ ଜମା(ଗୁଡ଼ିକ) ଏବଂ ପରବର୍ତ୍ତୀ ଦେୟକୁ ମୋ/ଆମ ଦ୍ୱାରା ନୀତିରେ ନିର୍ଦ୍ଧାରିତ ସମୟ ମଧ୍ୟରେ ଆଂଶିକ କିମ୍ବା ପୂର୍ଣ୍ଣ ଭାବରେ ପରିଚାଳନା ନକରେ, ତେବେ ମୋର/ଆମର କୌଣସି ଦାବି ରହିବ ନାହିଁ।',
    },
    'ql55qpf7': {
      'en':
          'I/We hereby undertake to pay the settlement of eligible loans as per the scheme parameters.',
      'or':
          'ମୁଁ/ଆମେ ଯୋଜନାର ମାନଦଣ୍ଡ ଅନୁଯାୟୀ ଯୋଗ୍ୟ ଋଣର ସମାଧାନ ପାଇଁ ପ୍ରତିଶ୍ରୁତି ଦେଉଛୁ।',
    },
    '1y4z6x5n': {
      'en':
          'I/We hereby certify that the above information is true to the best of my knowledge.',
      'or':
          'ମୁଁ/ଆମେ ଏହାଦ୍ୱାରା ପ୍ରମାଣିତ କରୁଛୁ ଯେ ଉପରୋକ୍ତ ସୂଚନା ମୋର ସର୍ବୋତ୍ତମ ଜ୍ଞାନ ଅନୁସାରେ ସତ୍ୟ।',
    },
    'uo333btb': {
      'en': 'This field is required.',
      'or': 'ଏହି କ୍ଷେତ୍ରଟି ଆବଶ୍ୟକ।',
    },
    'y3thb4uc': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    '5nyp4fxw': {
      'en': 'This field is required.',
      'or': 'ଏହି କ୍ଷେତ୍ରଟି ଆବଶ୍ୟକ।',
    },
    '1dqjoa5k': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'd1dgflaa': {
      'en': 'This field is required.',
      'or': 'ଏହି କ୍ଷେତ୍ରଟି ଆବଶ୍ୟକ।',
    },
    'udpri447': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'jzg9308x': {
      'en': 'This field is required.',
      'or': 'ଏହି କ୍ଷେତ୍ରଟି ଆବଶ୍ୟକ।',
    },
    'cdm5709z': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'm65xffgq': {
      'en': 'This field is required.',
      'or': 'ଏହି କ୍ଷେତ୍ରଟି ଆବଶ୍ୟକ।',
    },
    'ya1q6tq9': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'z82w8ike': {
      'en': 'This field is required.',
      'or': 'ଏହି କ୍ଷେତ୍ରଟି ଆବଶ୍ୟକ।',
    },
    'cc5t61ch': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'crearfb6': {
      'en': 'This field is required.',
      'or': 'ଏହି କ୍ଷେତ୍ରଟି ଆବଶ୍ୟକ।',
    },
    '6zm8h48x': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'h2pmc4hy': {
      'en': 'This field is required.',
      'or': 'ଏହି କ୍ଷେତ୍ରଟି ଆବଶ୍ୟକ।',
    },
    'csr64595': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'zh2ilsba': {
      'en': 'This field is required.',
      'or': 'ଏହି କ୍ଷେତ୍ରଟି ଆବଶ୍ୟକ।',
    },
    'mlfytoo4': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'imoalwi0': {
      'en': 'This field is required.',
      'or': 'ଏହି କ୍ଷେତ୍ରଟି ଆବଶ୍ୟକ।',
    },
    '0r7cgag5': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'o3ibbd5b': {
      'en': 'Save',
      'or': 'ସେଭ୍ କରନ୍ତୁ',
    },
    '6isze4rl': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    'cnlvvjce': {
      'en': '1',
      'or': '୧',
    },
    'ugwh6tir': {
      'en': 'General Settings',
      'or': 'ସାଧାରଣ ସେଟିଂ',
    },
    'b1kz9i98': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    '4d7kqd0o': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    '6uxo8ao9': {
      'en': 'Edit',
      'or': 'ସମ୍ପାଦନ କରନ୍ତୁ',
    },
    'smspya3b': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    '7etk2bhr': {
      'en': 'Amos',
      'or': 'ଆମୋଷ',
    },
    '9enoec2l': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    'uay73zst': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    '8o7yv844': {
      'en': 'Email address',
      'or': 'ଇମେଲ ଠିକଣା',
    },
    '9mf1ihf4': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    'r51251kr': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    'm142atd5': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    'vkuxp438': {
      'en': 'Languages',
      'or': 'ଭାଷାଗୁଡ଼ିକ',
    },
    '282lm8fr': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    'evxrzznr': {
      'en': 'Change',
      'or': 'ପରିବର୍ତ୍ତନ କରନ୍ତୁ',
    },
    'ne9lajhc': {
      'en': 'App appearance',
      'or': 'ଆପ୍‌ର ଦୃଶ୍ୟମାନତା',
    },
    '2ogdrh6a': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'cuwapmyd': {
      'en': 'Light mode',
      'or': 'ଲାଇଟ୍ ମୋଡ୍',
    },
    'g6j2xgaa': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'szi1gfmr': {
      'en': 'System preference',
      'or': 'ସିଷ୍ଟମର ପସନ୍ଦ',
    },
    '3pxtxk9i': {
      'en': 'Help and Support',
      'or': 'ସାହାଯ୍ୟ ଏବଂ ସମର୍ଥନ',
    },
    'j730lj7m': {
      'en': 'Looking for info about us?',
      'or': 'ଆମ ବିଷୟରେ ସୂଚନା ଚାହୁଁଛନ୍ତି କି?',
    },
    '4h3dz2s9': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'kb7kpgg2': {
      'en': 'Tips on how to use Pandora?',
      'or': 'ପାଣ୍ଡୋରା ବ୍ୟବହାର କରିବା ପାଇଁ ଟିପ୍ସ?',
    },
    'f2gbuffd': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    '23f65t0v': {
      'en': 'Need something else?',
      'or': 'ଆଉ କିଛି ଦରକାର କି?',
    },
    'of72ltgx': {
      'en': 'Contact support',
      'or': 'ସହାୟତା ପାଇଁ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    'fvrjxrzm': {
      'en': 'FAQs',
      'or': 'ସାଧାରଣ ପ୍ରଶ୍ନ',
    },
    'x31pauu8': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // Acknowledgement
  {
    '0919mfec': {
      'en': 'Dashboard',
      'or': 'ଡ୍ୟାସବୋର୍ଡ',
    },
    '5hwzbyq2': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'x4hlcs9o': {
      'en': 'A-',
      'or': 'କ-',
    },
    '1hh3key6': {
      'en': 'A',
      'or': 'କ',
    },
    'gcdo1ev9': {
      'en': 'A+',
      'or': 'କ+',
    },
    'ieznlqm9': {
      'en': 'Acknowledgment of OTS Application',
      'or': 'OTS ଆବେଦନର ସ୍ୱୀକୃତି',
    },
    'kzowwf8c': {
      'en': 'Receive an OTS-2011 application from ',
      'or': 'ରୁ ଏକ OTS-2011 ଆବେଦନ ଗ୍ରହଣ କରନ୍ତୁ',
    },
    'hv87w28f': {
      'en': '------------------',
      'or': '------------------',
    },
    'f2eygdi4': {
      'en': ' with an initial deposit of Rs ',
      'or': 'Rs ର ପ୍ରାରମ୍ଭିକ ଜମା ସହିତ',
    },
    'toj28wx2': {
      'en': '------------------',
      'or': '------------------',
    },
    '0xcrf69n': {
      'en': ' on Dt ',
      'or': 'ତାରିଖରେ',
    },
    'jea063kr': {
      'en': '------------------',
      'or': '------------------',
    },
    '22iy0jzk': {
      'en': ' in shape of DD/Cash/Pay order/Banker\'s Cheque vide OSFC. No ',
      'or': 'ଡିଡି/କ୍ୟାସ୍/ପେ ଅର୍ଡର/ଓଏସଏଫସି ମାଧ୍ୟମରେ ବ୍ୟାଙ୍କର ଚେକ୍ ଆକାରରେ। ନାହିଁ',
    },
    'b0cluwca': {
      'en': '------------------',
      'or': '------------------',
    },
    'bwik7lxx': {
      'en': ' Dt ',
      'or': 'ତାରିଖ',
    },
    '3ynq23is': {
      'en': '------------------',
      'or': '------------------',
    },
    'a1tdawm8': {
      'en':
          ' along with following documents for further processing of OTS proposal which will be considered on merit only.',
      'or':
          'କେବଳ ଯୋଗ୍ୟତା ଉପରେ ବିଚାର କରାଯିବ ବୋଲି OTS ପ୍ରସ୍ତାବର ପରବର୍ତ୍ତୀ ପ୍ରକ୍ରିୟାକରଣ ପାଇଁ ନିମ୍ନଲିଖିତ ଡକ୍ୟୁମେଣ୍ଟଗୁଡ଼ିକ ସହିତ।',
    },
    '2ze8645l': {
      'en': 'List of Documents:',
      'or': 'ଡକ୍ୟୁମେଣ୍ଟଗୁଡ଼ିକର ତାଲିକା:',
    },
    'i0sgjf42': {
      'en': '1.  ',
      'or': '୧.',
    },
    'tblezm0u': {
      'en': 'Download',
      'or': 'ଡାଉନଲୋଡ୍ କରନ୍ତୁ',
    },
    'nupzljpm': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    '5sm88yy1': {
      'en': '1',
      'or': '୧',
    },
    'fsdk8gpd': {
      'en': 'General Settings',
      'or': 'ସାଧାରଣ ସେଟିଂ',
    },
    '18m6p1kd': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    'om51ew58': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    'z1v74nps': {
      'en': 'Edit',
      'or': 'ସମ୍ପାଦନ କରନ୍ତୁ',
    },
    'abzua7nj': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    'zw0o0rw1': {
      'en': 'Amos',
      'or': 'ଆମୋଷ',
    },
    'rah2ivw8': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    '2yygzvjw': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    'v4nwwh86': {
      'en': 'Email address',
      'or': 'ଇମେଲ ଠିକଣା',
    },
    '6nmadx0s': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    'oypol4m0': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    '1gi38490': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    'y4rq1do2': {
      'en': 'Languages',
      'or': 'ଭାଷାଗୁଡ଼ିକ',
    },
    'xefkwpgm': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    '63mh5zkh': {
      'en': 'Change',
      'or': 'ପରିବର୍ତ୍ତନ କରନ୍ତୁ',
    },
    'q51ibsv9': {
      'en': 'App appearance',
      'or': 'ଆପ୍‌ର ଦୃଶ୍ୟମାନତା',
    },
    'mmphkdnv': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'ry9dqrzy': {
      'en': 'Light mode',
      'or': 'ଲାଇଟ୍ ମୋଡ୍',
    },
    'ajcpja3a': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'a1lzy35d': {
      'en': 'System preference',
      'or': 'ସିଷ୍ଟମର ପସନ୍ଦ',
    },
    'w3cnc10a': {
      'en': 'Help and Support',
      'or': 'ସାହାଯ୍ୟ ଏବଂ ସମର୍ଥନ',
    },
    'a78l9uzf': {
      'en': 'Looking for info about us?',
      'or': 'ଆମ ବିଷୟରେ ସୂଚନା ଚାହୁଁଛନ୍ତି କି?',
    },
    'mtuytzzv': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    '1qi6jsdt': {
      'en': 'Tips on how to use Pandora?',
      'or': 'ପାଣ୍ଡୋରା ବ୍ୟବହାର କରିବା ପାଇଁ ଟିପ୍ସ?',
    },
    'uvjwy8xi': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    '2bmjl7td': {
      'en': 'Need something else?',
      'or': 'ଆଉ କିଛି ଦରକାର କି?',
    },
    'g5mcg0tj': {
      'en': 'Contact support',
      'or': 'ସହାୟତା ପାଇଁ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    'f5w5qp4g': {
      'en': 'FAQs',
      'or': 'ସାଧାରଣ ପ୍ରଶ୍ନ',
    },
    'bfmyzb2c': {
      'en': '© 2025 Directorate of Industries, Odisha. All rights reserved.',
      'or': '© ୨୦୨୫ ଶିଳ୍ପ ନିର୍ଦ୍ଦେଶାଳୟ, ଓଡ଼ିଶା। ସର୍ବସତ୍ତ୍ୱ ସଂରକ୍ଷିତ।',
    },
    '70kudrqn': {
      'en': 'Design & Developed by Qwegle, Odisha State Centre.',
      'or': 'ଡିଜାଇନ୍ ଏବଂ ବିକଶିତ କ୍ୱେଗଲ୍, ଓଡ଼ିଶା ରାଜ୍ୟ କେନ୍ଦ୍ର ଦ୍ୱାରା।',
    },
    'vn1xvfw0': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // DashboardUser
  {
    'vp1ggt5u': {
      'en': 'Dashboard',
      'or': 'ଡ୍ୟାସବୋର୍ଡ',
    },
    'yx2w7kwf': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    '7h4maatr': {
      'en': 'A-',
      'or': 'କ-',
    },
    'vjow8e8l': {
      'en': 'A',
      'or': 'କ',
    },
    '91eckst1': {
      'en': 'A+',
      'or': 'କ+',
    },
    'n61u0eod': {
      'en': 'Approved Loan Applications',
      'or': 'ଅନୁମୋଦିତ ଋଣ ଆବେଦନଗୁଡ଼ିକ',
    },
    'ka9lnr6a': {
      'en': 'Pending Loan Applications',
      'or': 'ବିଚାରାଧୀନ ଋଣ ଆବେଦନଗୁଡ଼ିକ',
    },
    'o645pyvn': {
      'en': 'No. of No Due Certificate',
      'or': 'କୌଣସି ଦେୟ ନଥିବା ପ୍ରମାଣପତ୍ରର ସଂଖ୍ୟା',
    },
    'ok2m00k7': {
      'en': 'Application for One-Time Settlement (OTS)',
      'or': 'ନୂତନ ଋଣ ପାଇଁ ଆବେଦନ କରନ୍ତୁ',
    },
    'kygf1xpd': {
      'en': 'Start a new loan application easily',
      'or': 'ସହଜରେ ଏକ ନୂତନ ଋଣ ଆବେଦନ ଆରମ୍ଭ କରନ୍ତୁ',
    },
    't6rrmypg': {
      'en': 'Apply now',
      'or': 'ଏବେ ଆବେଦନ କରନ୍ତୁ',
    },
    'k3gzrszn': {
      'en': 'Exsiting Loan Application Status',
      'or': 'ଋଣ ଆବେଦନ ସ୍ଥିତି',
    },
    '2wpdcwe4': {
      'en': ' Track the progress of your loan request.',
      'or': 'ଆପଣଙ୍କ ଋଣ ଅନୁରୋଧର ପ୍ରଗତି ଟ୍ରାକ୍ କରନ୍ତୁ।',
    },
    'uuxxl6td': {
      'en': 'Check now',
      'or': 'ଏବେ ଦେଖନ୍ତୁ',
    },
    'assosp94': {
      'en': 'Settlement Order',
      'or': 'ସମାଧାନ ଆଦେଶ',
    },
    '642xwbmu': {
      'en': ' Track the progress of your loan request.',
      'or': 'ଆପଣଙ୍କ ଋଣ ଅନୁରୋଧର ପ୍ରଗତି ଟ୍ରାକ୍ କରନ୍ତୁ।',
    },
    'lqd7k3u4': {
      'en': 'Check now',
      'or': 'ଏବେ ଦେଖନ୍ତୁ',
    },
    'pg4rly31': {
      'en': 'Submitted OTS Forms',
      'or': 'ଦାଖଲ ହୋଇଥିବା OTS ଫର୍ମ',
    },
    'y74b47is': {
      'en': 'Check your approved loan details.',
      'or': 'ଆପଣଙ୍କର ଅନୁମୋଦିତ ଋଣ ବିବରଣୀ ଯାଞ୍ଚ କରନ୍ତୁ।',
    },
    '89ihh9eg': {
      'en': 'Check now',
      'or': 'ଏବେ ଦେଖନ୍ତୁ',
    },
    'czgu2d19': {
      'en': 'No Due Certificate',
      'or': 'କୌଣସି ଦେୟ ପ୍ରମାଣପତ୍ର ନାହିଁ',
    },
    '7c8fe6u8': {
      'en': 'Download your No Due Certificate if applicable.',
      'or':
          'ଯଦି ପ୍ରଯୁଜ୍ୟ ହୁଏ, ତେବେ ଆପଣଙ୍କର ନୋ ଡ୍ୟୁ ସାର୍ଟିଫିକେଟ୍ ଡାଉନଲୋଡ୍ କରନ୍ତୁ।',
    },
    'dksaskgy': {
      'en': 'Check now',
      'or': 'ଏବେ ଦେଖନ୍ତୁ',
    },
    '1uykxukh': {
      'en': 'Help & Support',
      'or': 'ସାହାଯ୍ୟ ଓ ସମର୍ଥନ',
    },
    'hbha1jts': {
      'en': 'Need assistance? Our team is here to help!',
      'or': 'ସହାୟତା ଦରକାର କି? ଆମ ଦଳ ସାହାଯ୍ୟ କରିବାକୁ ଏଠାରେ ଅଛି!',
    },
    'diz0g8g3': {
      'en': '- 📧 Email: ',
      'or': '- 📧 ଇମେଲ୍:',
    },
    'cgk53r7b': {
      'en': 'support@msme.gov.in',
      'or': 'support@msme.gov.in',
    },
    'bir17woo': {
      'en': '- ☎️ Phone: ',
      'or': '- ☎️ ଫୋନ୍:',
    },
    'jw6ry3rb': {
      'en': '1800-123-4567',
      'or': '୧୮୦୦-୧୨୩-୪୫୬୭',
    },
    'twlxvbd3': {
      'en': '- 🕒 Hours: Mon–Fri, 9 AM – 6 PM',
      'or': '- 🕒 ଘଣ୍ଟା: ସୋମ - ଶୁକ୍ର, 9 AM - 6 PM |',
    },
    'a61osmdi': {
      'en': 'We usually respond within 24 hours.',
      'or': 'ଆମେ ସାଧାରଣତଃ 24 ଘଣ୍ଟା ମଧ୍ୟରେ ଉତ୍ତର ଦେଇଥାଉ।',
    },
    '8m7s2mgu': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    'mekc25q7': {
      'en': '1',
      'or': '୧',
    },
    'v1lp5xxc': {
      'en': 'General Settings',
      'or': 'ସାଧାରଣ ସେଟିଂ',
    },
    'h3ioev97': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    '9ftkn9pd': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    'g4vz1yrv': {
      'en': 'Edit',
      'or': 'ସମ୍ପାଦନ କରନ୍ତୁ',
    },
    'i0zae1af': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    '71egcq8g': {
      'en': 'Amos',
      'or': 'ଆମୋଷ',
    },
    'n7r0pizf': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    'iou6gqbv': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    'bp0c3ip8': {
      'en': 'Email address',
      'or': 'ଇମେଲ ଠିକଣା',
    },
    'd63gcgi2': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    '26qlypda': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    'wyeu7sbp': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    'kh7qcexj': {
      'en': 'Languages',
      'or': 'ଭାଷାଗୁଡ଼ିକ',
    },
    'mo3oema6': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    'z8ooxook': {
      'en': 'Change',
      'or': 'ପରିବର୍ତ୍ତନ କରନ୍ତୁ',
    },
    '6xdjjiqf': {
      'en': 'App appearance',
      'or': 'ଆପ୍‌ର ଦୃଶ୍ୟମାନତା',
    },
    'igyqc0xu': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'woyi90go': {
      'en': 'Light mode',
      'or': 'ଲାଇଟ୍ ମୋଡ୍',
    },
    '7mnjga2c': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'y0vdfo4d': {
      'en': 'System preference',
      'or': 'ସିଷ୍ଟମର ପସନ୍ଦ',
    },
    '837mfwfg': {
      'en': 'Help and Support',
      'or': 'ସାହାଯ୍ୟ ଏବଂ ସମର୍ଥନ',
    },
    '86uop37s': {
      'en': 'Looking for info about us?',
      'or': 'ଆମ ବିଷୟରେ ସୂଚନା ଚାହୁଁଛନ୍ତି କି?',
    },
    '4w25oe2p': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'd93p47sp': {
      'en': 'Tips on how to use Pandora?',
      'or': 'ପାଣ୍ଡୋରା ବ୍ୟବହାର କରିବା ପାଇଁ ଟିପ୍ସ?',
    },
    'n3m7gypi': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'w1xguuj9': {
      'en': 'Need something else?',
      'or': 'ଆଉ କିଛି ଦରକାର କି?',
    },
    '6mwiaomg': {
      'en': 'Contact support',
      'or': 'ସହାୟତା ପାଇଁ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    '1wd01pp3': {
      'en': 'FAQs',
      'or': 'ସାଧାରଣ ପ୍ରଶ୍ନ',
    },
    'gfuex01y': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // OtsFormStatus
  {
    'huc13i6y': {
      'en': 'OTS Status',
      'or': 'OTS ସ୍ଥିତି',
    },
    '5kigvyd5': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'qct13t3b': {
      'en': 'A-',
      'or': 'କ-',
    },
    'l66g8s7d': {
      'en': 'A',
      'or': 'କ',
    },
    '2j2t9xf0': {
      'en': 'A+',
      'or': 'କ+',
    },
    '4o14qba8': {
      'en': 'Status',
      'or': 'ସ୍ଥିତି',
    },
    '6fds07d6': {
      'en': 'Search Loan Number',
      'or': 'ଋଣ ନମ୍ବର ଖୋଜନ୍ତୁ',
    },
    'nixqtvv6': {
      'en': 'Search',
      'or': 'ଖୋଜନ୍ତୁ',
    },
    '0dd8vw89': {
      'en': 'Clear',
      'or': 'ଖାଲି କରନ୍ତୁ',
    },
    'tix5174w': {
      'en': 'Loan Number',
      'or': 'ଋଣ ନମ୍ବର',
    },
    '374fsd8b': {
      'en': 'User Name',
      'or': 'ଉପଯୋଗକର୍ତ୍ତା ନାମ',
    },
    '76y5l6s3': {
      'en': 'Apply Date',
      'or': 'ଆବେଦନ ତାରିଖ',
    },
    '91znkqx3': {
      'en': 'Status',
      'or': 'ସ୍ଥିତି',
    },
    'nb9bcrws': {
      'en': 'Actions',
      'or': 'କାର୍ଯ୍ୟ',
    },
    'r91rqvp9': {
      'en': 'View',
      'or': 'ଦର୍ଶନ',
    },
    'sa867cj2': {
      'en': 'Status',
      'or': 'ସ୍ଥିତି',
    },
    'anadwx1y': {
      'en': 'OTS Form Applications',
      'or': 'OTS ଫର୍ମ ଆବେଦନ',
    },
    'm0372zh9': {
      'en': 'Search Loan Number',
      'or': 'ଋଣ ନମ୍ବର ଖୋଜନ୍ତୁ',
    },
    'rr8555le': {
      'en': 'Search',
      'or': 'ଖୋଜନ୍ତୁ',
    },
    'r5yhgmaq': {
      'en': 'Clear',
      'or': 'ଖାଲି କରନ୍ତୁ',
    },
    'uqgqaj98': {
      'en': 'Search Loan Number is required',
      'or': '',
    },
    'apep31yg': {
      'en': 'Enter full 13-character loan number.',
      'or': '',
    },
    'ixf59duw': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'jj4fppww': {
      'en': 'Loan Number',
      'or': 'ଋଣ ନମ୍ବର',
    },
    'dcmlyiwq': {
      'en': 'User Name',
      'or': 'ଉପଯୋଗକର୍ତ୍ତା ନାମ',
    },
    'v6o9l53o': {
      'en': 'Apply Date',
      'or': 'ଆବେଦନ ତାରିଖ',
    },
    'n7qye63q': {
      'en': 'Status',
      'or': 'ସ୍ଥିତି',
    },
    'i7tnqd4u': {
      'en': 'Actions',
      'or': 'କାର୍ଯ୍ୟ',
    },
    'ysailo53': {
      'en': 'Rows per pages:',
      'or': 'ପ୍ରତି ପୃଷ୍ଠା ଧାଡ଼ି:',
    },
    '9tyt8qfc': {
      'en': '10',
      'or': '୧୦',
    },
    'ia182jub': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'hc35s4rg': {
      'en': '5',
      'or': '5',
    },
    'i8r6gvtv': {
      'en': '10',
      'or': '୧୦',
    },
    'o2s6iewz': {
      'en': '25',
      'or': '୨୫',
    },
    'fromgl5a': {
      'en': '50',
      'or': '୫୦',
    },
    'rpylc92f': {
      'en': '100',
      'or': '୧୦୦',
    },
    'a1j5pcq4': {
      'en': '-',
      'or': '-',
    },
    '3x1awdrn': {
      'en': ' of ',
      'or': 'ର',
    },
    'flm8dgh9': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    'k617apfo': {
      'en': '1',
      'or': '୧',
    },
    'vvgmn8bj': {
      'en': 'General Settings',
      'or': 'ସାଧାରଣ ସେଟିଂ',
    },
    'j55tz9eq': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    'nnanvtqq': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    'xbhb1kvb': {
      'en': 'Edit',
      'or': 'ସମ୍ପାଦନ କରନ୍ତୁ',
    },
    '587btclw': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    '8nmxmlbh': {
      'en': 'Amos',
      'or': 'ଆମୋଷ',
    },
    'jes5569g': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    'mhw3rhdc': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    '4v1p3nj9': {
      'en': 'Email address',
      'or': 'ଇମେଲ ଠିକଣା',
    },
    's6186g8g': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    'jhq7f9zw': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    'a4viqe95': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    'iepgw0c4': {
      'en': 'Languages',
      'or': 'ଭାଷାଗୁଡ଼ିକ',
    },
    'o4lfjkz1': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    'jowbfr5y': {
      'en': 'Change',
      'or': 'ପରିବର୍ତ୍ତନ କରନ୍ତୁ',
    },
    'd282oue6': {
      'en': 'App appearance',
      'or': 'ଆପ୍‌ର ଦୃଶ୍ୟମାନତା',
    },
    'o4okf6hu': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'ly7dsoz5': {
      'en': 'Light mode',
      'or': 'ଲାଇଟ୍ ମୋଡ୍',
    },
    '3so0azb7': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'kr82w4do': {
      'en': 'System preference',
      'or': 'ସିଷ୍ଟମର ପସନ୍ଦ',
    },
    'xfl9srfu': {
      'en': 'Help and Support',
      'or': 'ସାହାଯ୍ୟ ଏବଂ ସମର୍ଥନ',
    },
    'xioza41c': {
      'en': 'Looking for info about us?',
      'or': 'ଆମ ବିଷୟରେ ସୂଚନା ଚାହୁଁଛନ୍ତି କି?',
    },
    'nik3imyf': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'bgi7umsd': {
      'en': 'Tips on how to use Pandora?',
      'or': 'ପାଣ୍ଡୋରା ବ୍ୟବହାର କରିବା ପାଇଁ ଟିପ୍ସ?',
    },
    '3ieqqtod': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'bpkt8gju': {
      'en': 'Need something else?',
      'or': 'ଆଉ କିଛି ଦରକାର କି?',
    },
    '4o623fiy': {
      'en': 'Contact support',
      'or': 'ସହାୟତା ପାଇଁ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    'e8zgmxey': {
      'en': 'FAQs',
      'or': 'ସାଧାରଣ ପ୍ରଶ୍ନ',
    },
    'zvpa1g36': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // TrackOtsFormStatusFlow
  {
    'mokaxmx8': {
      'en': 'Track Application Status',
      'or': 'ଆବେଦନ ସ୍ଥିତି ଟ୍ରାକ୍ କରନ୍ତୁ',
    },
    '6qc0mz18': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'igaxtcew': {
      'en': 'A-',
      'or': 'କ-',
    },
    '5sw65bgw': {
      'en': 'A',
      'or': 'କ',
    },
    'amb2pi8q': {
      'en': 'A+',
      'or': 'କ+',
    },
    'cg09ylea': {
      'en': 'Help & Support',
      'or': 'ସାହାଯ୍ୟ ଓ ସମର୍ଥନ',
    },
    'u4h0fhbf': {
      'en': 'Need assistance? Our team is here to help!',
      'or': 'ସହାୟତା ଦରକାର କି? ଆମ ଦଳ ସାହାଯ୍ୟ କରିବାକୁ ଏଠାରେ ଅଛି!',
    },
    'xjsk9ck6': {
      'en': '- 📧 Email: ',
      'or': '- 📧 ଇମେଲ୍:',
    },
    '63igippr': {
      'en': 'support@msme.gov.in',
      'or': 'support@msme.gov.in',
    },
    '9wjxinv4': {
      'en': '- ☎️ Phone: ',
      'or': '- ☎️ ଫୋନ୍:',
    },
    'osti045q': {
      'en': '1800-123-4567',
      'or': '୧୮୦୦-୧୨୩-୪୫୬୭',
    },
    'esyb3cq5': {
      'en': '- 🕒 Hours: Mon–Fri, 9 AM – 6 PM',
      'or': '- 🕒 ଘଣ୍ଟା: ସୋମ - ଶୁକ୍ର, 9 AM - 6 PM |',
    },
    'ebsmvxem': {
      'en': 'We usually respond within 24 hours.',
      'or': 'ଆମେ ସାଧାରଣତଃ 24 ଘଣ୍ଟା ମଧ୍ୟରେ ଉତ୍ତର ଦେଇଥାଉ।',
    },
    'y07385ob': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    'zzexsm9e': {
      'en': '1',
      'or': '୧',
    },
    'ckicez9k': {
      'en': 'General Settings',
      'or': 'ସାଧାରଣ ସେଟିଂ',
    },
    'pq52yvlx': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    'cdpo4e74': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    'ai5tikb5': {
      'en': 'Edit',
      'or': 'ସମ୍ପାଦନ କରନ୍ତୁ',
    },
    '8g7b3j8j': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    'dzzp3nx9': {
      'en': 'Amos',
      'or': 'ଆମୋଷ',
    },
    'gdhzpfjq': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    'dg15ll6g': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    'gf15dsd0': {
      'en': 'Email address',
      'or': 'ଇମେଲ ଠିକଣା',
    },
    'cmzpkqtk': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    'ktvyd5fx': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    '2b8mw52i': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    'zos1zwik': {
      'en': 'Languages',
      'or': 'ଭାଷାଗୁଡ଼ିକ',
    },
    'bjv1wni0': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    'w8a1aa1g': {
      'en': 'Change',
      'or': 'ପରିବର୍ତ୍ତନ କରନ୍ତୁ',
    },
    '560p6toy': {
      'en': 'App appearance',
      'or': 'ଆପ୍‌ର ଦୃଶ୍ୟମାନତା',
    },
    'x47qfycy': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'd940jaep': {
      'en': 'Light mode',
      'or': 'ଲାଇଟ୍ ମୋଡ୍',
    },
    'udlk32q7': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    '7oib5bor': {
      'en': 'System preference',
      'or': 'ସିଷ୍ଟମର ପସନ୍ଦ',
    },
    'feh423jw': {
      'en': 'Help and Support',
      'or': 'ସାହାଯ୍ୟ ଏବଂ ସମର୍ଥନ',
    },
    '59ebeplz': {
      'en': 'Looking for info about us?',
      'or': 'ଆମ ବିଷୟରେ ସୂଚନା ଖୋଜୁଛନ୍ତି କି?',
    },
    '71stpajg': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'aecndm7l': {
      'en': 'Tips on how to use Pandora?',
      'or': 'ପାଣ୍ଡୋରା ବ୍ୟବହାର କରିବା ପାଇଁ ଟିପ୍ସ?',
    },
    '6yjla8tz': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    '8r13uboh': {
      'en': 'Need something else?',
      'or': 'ଆଉ କିଛି ଦରକାର କି?',
    },
    'dq5069eq': {
      'en': 'Contact support',
      'or': 'ସହାୟତା ପାଇଁ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    '9tdrx2dg': {
      'en': 'FAQs',
      'or': 'ସାଧାରଣ ପ୍ରଶ୍ନ',
    },
    'jczmuksi': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // NoDueCertificatesUser
  {
    'b54a44r2': {
      'en': 'No Due Certificate',
      'or': 'କୌଣସି ଦେୟ ପ୍ରମାଣପତ୍ର ନାହିଁ',
    },
    'tx8p7rki': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    '1usvg8a0': {
      'en': 'A-',
      'or': 'କ-',
    },
    'qxzvq5zb': {
      'en': 'A',
      'or': 'କ',
    },
    'nh42puak': {
      'en': 'A+',
      'or': 'କ+',
    },
    'd5kyp9r2': {
      'en': 'Search your loan number...',
      'or': 'ଆପଣଙ୍କର ଋଣ ନମ୍ବର ଖୋଜନ୍ତୁ...',
    },
    'qlel0l8c': {
      'en': 'Search your loan number... is required',
      'or': '',
    },
    'og16loe0': {
      'en': 'Enter full 13-character loan number.',
      'or': '',
    },
    's7xj718p': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    '870kej1h': {
      'en': 'Search',
      'or': 'ଖୋଜନ୍ତୁ',
    },
    'vt7chfgd': {
      'en': 'Reset',
      'or': 'ରିସେଟ୍ କରନ୍ତୁ',
    },
    'mh135caa': {
      'en': ' ',
      'or': '',
    },
    'g8w9ks66': {
      'en': 'Loan No',
      'or': 'ଋଣ ନମ୍ବର',
    },
    'ykphp215': {
      'en': ': ',
      'or': ':',
    },
    'vu7e8tif': {
      'en': 'Download Certificate',
      'or': 'ସାର୍ଟିଫିକେଟ୍ ଡାଉନଲୋଡ୍ କରନ୍ତୁ',
    },
    'qx2c3l7t': {
      'en': 'Rows per pages:',
      'or': 'ପ୍ରତି ପୃଷ୍ଠା ଧାଡ଼ି:',
    },
    'nn8pfle4': {
      'en': '10',
      'or': '୧୦',
    },
    'uc9mov1p': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'imu0e5jb': {
      'en': '5',
      'or': '5',
    },
    'lplpzp63': {
      'en': '10',
      'or': '୧୦',
    },
    '4smsnl3q': {
      'en': '25',
      'or': '୨୫',
    },
    '444k7fb8': {
      'en': '50',
      'or': '୫୦',
    },
    '6nqr9zie': {
      'en': '100',
      'or': '୧୦୦',
    },
    '1z07zrry': {
      'en': '-',
      'or': '-',
    },
    'w7arav9g': {
      'en': ' of ',
      'or': 'ର',
    },
    '5qnfhmhn': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    'i3szvokx': {
      'en': '1',
      'or': '୧',
    },
    'q8e7ld2x': {
      'en': 'General Settings',
      'or': 'ସାଧାରଣ ସେଟିଂ',
    },
    '3myx2lgc': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    'h10jidhi': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    'egvgiy79': {
      'en': 'Edit',
      'or': 'ସମ୍ପାଦନ କରନ୍ତୁ',
    },
    'n70auae6': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    '2gro35im': {
      'en': 'Amos',
      'or': 'ଆମୋଷ',
    },
    'ru2vsrly': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    '2vai2mq6': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    'sz86hovi': {
      'en': 'Email address',
      'or': 'ଇମେଲ ଠିକଣା',
    },
    'vse1o0in': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    '5m89yu55': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    '5m04y4gg': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    'wo1fmhyh': {
      'en': 'Languages',
      'or': 'ଭାଷାଗୁଡ଼ିକ',
    },
    'gribpcmm': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    '41pydqco': {
      'en': 'Change',
      'or': 'ପରିବର୍ତ୍ତନ କରନ୍ତୁ',
    },
    'lso575kt': {
      'en': 'App appearance',
      'or': 'ଆପ୍‌ର ଦୃଶ୍ୟମାନତା',
    },
    '0zdup80u': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'q3vjdxkc': {
      'en': 'Light mode',
      'or': 'ଲାଇଟ୍ ମୋଡ୍',
    },
    'u3pn8560': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'xmxutu07': {
      'en': 'System preference',
      'or': 'ସିଷ୍ଟମର ପସନ୍ଦ',
    },
    '3rdz2al2': {
      'en': 'Help and Support',
      'or': 'ସାହାଯ୍ୟ ଏବଂ ସମର୍ଥନ',
    },
    'sicnfmy0': {
      'en': 'Looking for info about us?',
      'or': 'ଆମ ବିଷୟରେ ସୂଚନା ଚାହୁଁଛନ୍ତି କି?',
    },
    'kftmihuy': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    '0cj8umsw': {
      'en': 'Tips on how to use Pandora?',
      'or': 'ପାଣ୍ଡୋରା ବ୍ୟବହାର କରିବା ପାଇଁ ଟିପ୍ସ?',
    },
    'hblqdj8o': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    '59rncmhm': {
      'en': 'Need something else?',
      'or': 'ଆଉ କିଛି ଦରକାର କି?',
    },
    '3pjj5e3q': {
      'en': 'Contact support',
      'or': 'ସହାୟତା ପାଇଁ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    'a5o8kfa2': {
      'en': 'FAQs',
      'or': 'ସାଧାରଣ ପ୍ରଶ୍ନ',
    },
    'fx52m2l3': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // ExsitingLoanApplicationStatus
  {
    'b9hiox2o': {
      'en': 'Exiting Loan',
      'or': 'ଋଣ ଆବେଦନଗୁଡ଼ିକ',
    },
    '0l8p2w0g': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'xbup16c2': {
      'en': 'A-',
      'or': 'କ-',
    },
    'tblf2vw3': {
      'en': 'A',
      'or': 'କ',
    },
    'e8gk8lfh': {
      'en': 'A+',
      'or': 'କ+',
    },
    '85jige6t': {
      'en': 'Status',
      'or': 'OTS ଫର୍ମ ଆବେଦନ',
    },
    'g3ja5222': {
      'en': 'Search Loan Number',
      'or': 'ଋଣ ନମ୍ବର ଖୋଜନ୍ତୁ',
    },
    'g9n6ccux': {
      'en': 'Search',
      'or': 'ଖୋଜନ୍ତୁ',
    },
    'orgccil6': {
      'en': 'Clear',
      'or': 'ଖାଲି କରନ୍ତୁ',
    },
    'gj484cot': {
      'en': 'Search Loan Number is required',
      'or': '',
    },
    'j03ac9sg': {
      'en': 'Enter full 13-character loan number.',
      'or': '',
    },
    'hvht9rwm': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'zmqqdwlc': {
      'en': 'Loan Number',
      'or': 'ଋଣ ନମ୍ବର',
    },
    'y05dd9jp': {
      'en': 'User Name',
      'or': 'ଉପଯୋଗକର୍ତ୍ତା ନାମ',
    },
    '1gx22q2g': {
      'en': 'Loan Amount',
      'or': 'ଋଣ ରାଶି',
    },
    'b159ukng': {
      'en': 'Status',
      'or': 'ସ୍ଥିତି',
    },
    'bs6ehfs1': {
      'en': 'Actions',
      'or': 'କାର୍ଯ୍ୟ',
    },
    '81rdqvdi': {
      'en': 'Rows per pages:',
      'or': 'ପ୍ରତି ପୃଷ୍ଠା ଧାଡ଼ି:',
    },
    'hsi3w0vo': {
      'en': '10',
      'or': '୧୦',
    },
    '2x9ely33': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'd209n1u4': {
      'en': '5',
      'or': '5',
    },
    'am8096ig': {
      'en': '10',
      'or': '୧୦',
    },
    '7ss0u2xa': {
      'en': '25',
      'or': '୨୫',
    },
    'c2a6xkbf': {
      'en': '50',
      'or': '୫୦',
    },
    '7db137ug': {
      'en': '100',
      'or': '୧୦୦',
    },
    '36i4xpud': {
      'en': '-',
      'or': '-',
    },
    'g9gjcxlh': {
      'en': ' of ',
      'or': 'ର',
    },
    'z2jv5kcz': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // NoDueCertificateview
  {
    'bzvp5zk2': {
      'en': 'No Due Certificate',
      'or': 'କୌଣସି ଦେୟ ପ୍ରମାଣପତ୍ର ନାହିଁ',
    },
    '7uv2q48p': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'wv9vxius': {
      'en': 'No Due Certificate Status',
      'or': 'କୌଣସି ବାକି ସାର୍ଟିଫିକେଟ୍ ସ୍ଥିତି ନାହିଁ',
    },
    'b5vz0rgt': {
      'en': 'Search your loan number...',
      'or': 'ଋଣ ନମ୍ବର ଖୋଜନ୍ତୁ',
    },
    'rqo3byg6': {
      'en': 'Search',
      'or': 'ଖୋଜନ୍ତୁ',
    },
    'n9tay4t2': {
      'en': 'Clear',
      'or': 'ଖାଲି କରନ୍ତୁ',
    },
    'vu6y2iwo': {
      'en': 'loan number is required',
      'or': '',
    },
    '0zijpy8i': {
      'en': 'Enter full 13-character loan number.',
      'or': '',
    },
    'u6xu521x': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'c0w26smf': {
      'en': 'Loan Number',
      'or': 'ଋଣ ନମ୍ବର',
    },
    '90disutd': {
      'en': 'User Name',
      'or': 'ଉପଯୋଗକର୍ତ୍ତା ନାମ',
    },
    '6qlpizmu': {
      'en': 'OTS Apply Date',
      'or': 'OTS ଆବେଦନ ତାରିଖ',
    },
    'rfquk0cx': {
      'en': 'Uploaded Date',
      'or': 'ଅପଲୋଡ୍ କରାଯାଇଥିବା ତାରିଖ',
    },
    'vec9ikp3': {
      'en': 'Actions',
      'or': 'କାର୍ଯ୍ୟ',
    },
    'sklgm6v9': {
      'en': 'Rows per pages:',
      'or': 'ପ୍ରତି ପୃଷ୍ଠା ଧାଡ଼ି:',
    },
    'sk0dkfkg': {
      'en': '10',
      'or': '୧୦',
    },
    '26wgj4pl': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'owexgyee': {
      'en': '5',
      'or': '5',
    },
    'tv3pou33': {
      'en': '10',
      'or': '୧୦',
    },
    '5g29c0qa': {
      'en': '25',
      'or': '୨୫',
    },
    'mhplcx0s': {
      'en': '50',
      'or': '୫୦',
    },
    'tqdxa4xl': {
      'en': '100',
      'or': '୧୦୦',
    },
    '10rzeo3z': {
      'en': '-',
      'or': '-',
    },
    'lb34vhyw': {
      'en': ' of ',
      'or': 'ର',
    },
    'b0utifi7': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // ViewUser
  {
    '8pio77ve': {
      'en': 'Apply for a New Loan',
      'or': 'ନୂତନ ଋଣ ପାଇଁ ଆବେଦନ କରନ୍ତୁ',
    },
    'ux2gkscq': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    '6g792wks': {
      'en': 'User Name',
      'or': 'ଉପଯୋଗକର୍ତ୍ତା ନାମ',
    },
    'a05nxss6': {
      'en': 'User Loan Number',
      'or': 'ୟୁଜର୍ ଋଣ ନମ୍ବର',
    },
    '5sqk98l7': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    'r7yqmtdg': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    '3jxyj1h0': {
      'en': 'Amos',
      'or': 'ଆମୋଷ',
    },
    'njm7ynuh': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    'xc7dujcr': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    'yi8uzb6p': {
      'en': 'Number',
      'or': 'ସଂଖ୍ୟା',
    },
    '4hw12ttz': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    'svcxvpza': {
      'en': 'E-mail',
      'or': 'ଇ-ମେଲ୍',
    },
    'l7okg66m': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    '8vjnmnu7': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    'cxjsrhh2': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    '6rfyxy4e': {
      'en': 'State',
      'or': 'ରାଜ୍ୟ',
    },
    'k9kj82xp': {
      'en': 'State',
      'or': 'ରାଜ୍ୟ',
    },
    'rez8hi32': {
      'en': 'City',
      'or': 'ସହର',
    },
    'nemmgnur': {
      'en': 'City',
      'or': 'ସହର',
    },
    'hqqzsoq9': {
      'en': 'Pin-Code',
      'or': 'ପିନ୍-କୋଡ୍',
    },
    'tp4xpci2': {
      'en': 'Pin-Code',
      'or': 'ପିନ୍-କୋଡ୍',
    },
    '2d9j0iyy': {
      'en': 'App appearance',
      'or': 'ଆପ୍‌ର ଦୃଶ୍ୟମାନତା',
    },
    'zkfrif40': {
      'en': 'Total outstanding liablity to OSFC as on the date of application.',
      'or': 'ଆବେଦନ ତାରିଖ ସୁଦ୍ଧା OSFC ପ୍ରତି ମୋଟ ବକେୟା ଦାୟିତ୍ବ।',
    },
    'xzgdvr35': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    'jtgcw8tx': {
      'en': 'Nature of industry/product/type of the unit/company',
      'or': 'ଶିଳ୍ପ/ଉତ୍ପାଦର ପ୍ରକୃତି/ୟୁନିଟ୍/କମ୍ପାନୀର ପ୍ରକାର',
    },
    'zm9duf5d': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    'aatz7omy': {
      'en':
          'The Present Level of operation of vehicle with Regn. No. (In case the unit/company is not in operation and reasons thereof.)',
      'or':
          'ରେଜିଷ୍ଟ୍ରେସନ ନମ୍ବର ସହିତ ଯାନର ବର୍ତ୍ତମାନର କାର୍ଯ୍ୟ ସ୍ତର (ଯଦି ୟୁନିଟ୍/କମ୍ପାନୀ କାର୍ଯ୍ୟକ୍ଷମ ନଥାଏ ଏବଂ ତାହାର କାରଣ।)',
    },
    'pxbg5mxk': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    '6jveq3xb': {
      'en': 'Reasons of non-payment of Corporation\'s dues:',
      'or': 'ନିଗମର ଦେୟ ନଦେବାର କାରଣ:',
    },
    'dmnubzex': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    '0t2cnn4h': {
      'en':
          'Details of dues, to other institutions,Fls,Banks Including details of settlements reached with them if any.',
      'or':
          'ଅନ୍ୟ ପ୍ରତିଷ୍ଠାନ, ଫ୍ଲାଟ୍, ବ୍ୟାଙ୍କକୁ ଦେୟ ପ୍ରଦାନର ବିବରଣୀ, ସେମାନଙ୍କ ସହିତ ହୋଇଥିବା ସମାଧାନର ବିବରଣୀ ସମେତ, ଯଦି କୌଣସି ଥାଏ।',
    },
    'oxelbs2x': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    '6piocxq1': {
      'en': 'Whether defaulter to other Banks/Fls, if so status of NPA?',
      'or': 'ଅନ୍ୟ ବ୍ୟାଙ୍କ/ଫ୍ଲାନ୍ସର ଖିଲାପୀ କି, ଯଦି ଅଛି ତେବେ NPA ର ସ୍ଥିତି?',
    },
    'zx9eoft5': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    'p1jfg0gf': {
      'en':
          'Sailient operational and financial hights of the unit/company for the last 3 financial years in case of disbursement of all eligible loans above rs.30.00 lakh. (Audited Balance Sheet & P/L A/c.of the unit/company for the last 3 years, and Net worth certificate of borrower/applicationt by the Chartered Accountant is enclosed.)',
      'or':
          '୩୦.୦୦ ଲକ୍ଷ ଟଙ୍କାରୁ ଅଧିକ ମୂଲ୍ୟର ସମସ୍ତ ଯୋଗ୍ୟ ଋଣ ପ୍ରଦାନ କ୍ଷେତ୍ରରେ ୟୁନିଟ୍/କମ୍ପାନୀର ଗତ ୩ ଆର୍ଥିକ ବର୍ଷ ପାଇଁ ସଜାଗ କାର୍ଯ୍ୟକ୍ଷମ ଏବଂ ଆର୍ଥିକ ଉଚ୍ଚତା। (ଗତ ୩ ବର୍ଷ ପାଇଁ ୟୁନିଟ୍/କମ୍ପାନୀର ଅଡିଟେଡ୍ ବାଲାନ୍ସ ସିଟ୍ ଏବଂ ପି/ଏଲ୍/ସି, ଏବଂ ଚାଟାର୍ଡ ଆକାଉଣ୍ଟାଣ୍ଟଙ୍କ ଦ୍ୱାରା ଋଣଗ୍ରହୀତାଙ୍କ/ଆବେଦନର ନେଟ୍ ୱର୍ଥ ପ୍ରମାଣପତ୍ର ସଂଲଗ୍ନ କରାଯାଇଛି।)',
    },
    'gpoczn97': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    'riysu20x': {
      'en': 'Reasons for settlement of loan dues under OTS',
      'or': 'OTS ଅଧୀନରେ ଋଣ ଦେୟ ସମାଧାନର କାରଣ',
    },
    'cwd8u12t': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    'gi19v7bn': {
      'en': 'Sources of payment of settlement amount',
      'or': 'ସମାଧାନ ପରିମାଣର ଦେୟ ପାଇଁ ଉତ୍ସ',
    },
    'zg41s6dy': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    'zseczzl5': {
      'en': 'Terms of payment of the porposed OTS amount',
      'or': 'ପ୍ରସ୍ତାବିତ OTS ରାଶିର ଦେୟ ସର୍ତ୍ତାବଳୀ',
    },
    '10ni8dye': {
      'en': 'Select...',
      'or': 'ଚୟନ କରନ୍ତୁ...',
    },
    'ff8a0ulk': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'ym0s1r99': {
      'en':
          'Settlement amount to be paid with 60 days of its formal communication',
      'or': 'ଆନୁଷ୍ଠାନିକ ଯୋଗାଯୋଗର 60 ଦିନ ମଧ୍ୟରେ ସମାଧାନ ପରିମାଣ ପୈଠ କରିବାକୁ ପଡିବ',
    },
    'zirv25qf': {
      'en':
          'To be paid within one year from the date of issue of settlement order in 12 equated monthly installments with amount beyond 30 days. (Strike off whichever is not applicable)',
      'or':
          'ସମାଧାନ ଅର୍ଡର ଜାରି ହେବାର ଏକ ବର୍ଷ ମଧ୍ୟରେ 30 ଦିନରୁ ଅଧିକ ପରିମାଣର 12ଟି ସମାନ ମାସିକ କିସ୍ତିରେ ପୈଠ କରାଯିବ। (ଯେଉଁଟି ପ୍ରଯୁଜ୍ୟ ନୁହେଁ ତାହା କାଟି ଦିଅନ୍ତୁ)',
    },
    'nuvzywlb': {
      'en':
          'All in eligible loan dues shall be paid along with the settlement amount within the period as at \"a\" above.',
      'or':
          'ଉପରୋକ୍ତ \"କ\" ରେ ଥିବା ସମୟ ମଧ୍ୟରେ ସମସ୍ତ ଯୋଗ୍ୟ ଋଣ ଦେୟ ସମାଧାନ ପରିମାଣ ସହିତ ପରିଶୋଧ କରାଯିବ।',
    },
    'vca8rxpp': {
      'en': 'Any other particulars that may be relevant to mention.',
      'or': 'ଉଲ୍ଲେଖ କରିବା ପାଇଁ ପ୍ରାସଙ୍ଗିକ ହୋଇପାରେ ଏପରି ଅନ୍ୟ କୌଣସି ବିବରଣୀ।',
    },
    '7gpjlmly': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    'o4t3dht0': {
      'en':
          'I/We would request you to consider my/our above offer and advise me/us of the decision taken in this regard at an early date. I/we would be happy to provide any further information/clarification, if needed, to the corporation.',
      'or':
          'ମୁଁ/ଆମେ ଆପଣଙ୍କୁ ଅନୁରୋଧ କରିବୁ ଯେ ମୋର/ଆମର ଉପରୋକ୍ତ ପ୍ରସ୍ତାବ ଉପରେ ବିଚାର କରନ୍ତୁ ଏବଂ ଏ ସମ୍ପର୍କରେ ନିଆଯାଇଥିବା ନିଷ୍ପତ୍ତି ବିଷୟରେ ମୋତେ/ଆମକୁ ଶୀଘ୍ର ଅବଗତ କରାନ୍ତୁ। ଆବଶ୍ୟକ ହେଲେ, ମୁଁ/ଆମେ ନିଗମକୁ ଅଧିକ ସୂଚନା/ସ୍ପଷ୍ଟୀକରଣ ପ୍ରଦାନ କରିବାକୁ ଖୁସି ହେବୁ।',
    },
    'kpjhe776': {
      'en':
          'I/We do here by undertake that I/we Will continue payment towerds my/our current dues in terms of loan agrement pending settlement of dues under the OTS Policy-2011. I/We shall not have any claim on delay decision and/or an unfavorable decision on my/our loan settlemente claims/dues. I/We will not have any claims in case the corporation adjusts the initial deposit(s)  and subsequent payment made for settlement of dues under the OTS Policy-2011 towerds normal loan dues on non-compiance of thge terms and conditions of the policy by me/us either in part or full within stipulated time as prescribed in the policy.',
      'or':
          'ମୁଁ/ଆମେ ଏଠାରେ ପ୍ରତିଶ୍ରୁତି ଦେଉଛୁ ଯେ ମୁଁ/ଆମେ OTS ନୀତି-2011 ଅନୁଯାୟୀ ଦେୟ ସମାଧାନ ପାଇଁ ବିଚାରାଧୀନ ଋଣ ଚୁକ୍ତି ଅନୁଯାୟୀ ମୋର/ଆମର ବର୍ତ୍ତମାନର ଦେୟ ପ୍ରଦାନ ଜାରି ରଖିବୁ। ମୋର/ଆମର ଋଣ ସମାଧାନ ଦାବି/ପାଏ ଉପରେ ବିଳମ୍ବ ନିଷ୍ପତ୍ତି ଏବଂ/ଅଥବା ପ୍ରତିକୂଳ ନିଷ୍ପତ୍ତି ଉପରେ ମୋର/ଆମର କୌଣସି ଦାବି ରହିବ ନାହିଁ। ଯଦି ନିଗମ OTS ନୀତି-2011 ଅନୁଯାୟୀ ଦେୟ ସମାଧାନ ପାଇଁ ପ୍ରାରମ୍ଭିକ ଜମା(ଗୁଡ଼ିକ) ଏବଂ ପରବର୍ତ୍ତୀ ଦେୟକୁ ମୋ/ଆମ ଦ୍ୱାରା ନୀତିରେ ନିର୍ଦ୍ଧାରିତ ସମୟ ମଧ୍ୟରେ ଆଂଶିକ କିମ୍ବା ପୂର୍ଣ୍ଣ ଭାବରେ ପରିଚାଳନା ନକରେ, ତେବେ ମୋର/ଆମର କୌଣସି ଦାବି ରହିବ ନାହିଁ।',
    },
    'l1bopntl': {
      'en':
          'I/We hereby undertake to pay the settlement of eligible loans as per the scheme parameters.',
      'or':
          'ମୁଁ/ଆମେ ଯୋଜନାର ମାନଦଣ୍ଡ ଅନୁଯାୟୀ ଯୋଗ୍ୟ ଋଣର ସମାଧାନ ପାଇଁ ପ୍ରତିଶ୍ରୁତି ଦେଉଛୁ।',
    },
    'tgwt15gy': {
      'en':
          'I/We hereby certify that the above information is true to the best of my knowledge.',
      'or':
          'ମୁଁ/ଆମେ ଏହାଦ୍ୱାରା ପ୍ରମାଣିତ କରୁଛୁ ଯେ ଉପରୋକ୍ତ ସୂଚନା ମୋର ସର୍ବୋତ୍ତମ ଜ୍ଞାନ ଅନୁସାରେ ସତ୍ୟ।',
    },
    'b4nakdzx': {
      'en': '1 Hackerway, SF is required',
      'or': '୧ ହ୍ୟାକରୱେ, SF ଆବଶ୍ୟକ।',
    },
    'hxz1i8dx': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'at0njme1': {
      'en': '1 Hackerway, SF is required',
      'or': '୧ ହ୍ୟାକରୱେ, SF ଆବଶ୍ୟକ।',
    },
    '0jgmbgnb': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'sfe3t1rq': {
      'en': '1 Hackerway, SF is required',
      'or': '୧ ହ୍ୟାକରୱେ, SF ଆବଶ୍ୟକ।',
    },
    'xjuh7slo': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    '5cbz0ask': {
      'en': '1 Hackerway, SF is required',
      'or': '୧ ହ୍ୟାକରୱେ, SF ଆବଶ୍ୟକ।',
    },
    'oxcgjl6x': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'axbftuow': {
      'en': '1 Hackerway, SF is required',
      'or': '୧ ହ୍ୟାକରୱେ, SF ଆବଶ୍ୟକ।',
    },
    'acalj7ln': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'a923jfxa': {
      'en': '1 Hackerway, SF is required',
      'or': '୧ ହ୍ୟାକରୱେ, SF ଆବଶ୍ୟକ।',
    },
    'xa8ohij8': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    't2gcxdek': {
      'en': '1 Hackerway, SF is required',
      'or': '୧ ହ୍ୟାକରୱେ, SF ଆବଶ୍ୟକ।',
    },
    '6yej8mop': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'dx1ejxg2': {
      'en': '1 Hackerway, SF is required',
      'or': '୧ ହ୍ୟାକରୱେ, SF ଆବଶ୍ୟକ।',
    },
    'qba0by4u': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'q424f48o': {
      'en': '1 Hackerway, SF is required',
      'or': '୧ ହ୍ୟାକରୱେ, SF ଆବଶ୍ୟକ।',
    },
    'nhn3ay4s': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    '9gv8d551': {
      'en': '1 Hackerway, SF is required',
      'or': '୧ ହ୍ୟାକରୱେ, SF ଆବଶ୍ୟକ।',
    },
    '472yo72k': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    '39693ah4': {
      'en': 'Approved',
      'or': 'ଅନୁମୋଦିତ ହୋଇଛି',
    },
    '69ez5grc': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    '14b1csow': {
      'en': '1',
      'or': '୧',
    },
    'hcgrh325': {
      'en': 'General Settings',
      'or': 'ସାଧାରଣ ସେଟିଂ',
    },
    'l67rzayp': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    '24jrlqpa': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    'zyeytdun': {
      'en': 'Edit',
      'or': 'ସମ୍ପାଦନ କରନ୍ତୁ',
    },
    '2fy9iyfp': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    '3e4qyegx': {
      'en': 'Amos',
      'or': 'ଆମୋଷ',
    },
    'qgx9h9wa': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    'n3ikf2hp': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    'erv041cc': {
      'en': 'Email address',
      'or': 'ଇମେଲ ଠିକଣା',
    },
    'ht0lu0fg': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    '8n153xxq': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    'dhwpo3y4': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    'mch73ofp': {
      'en': 'Languages',
      'or': 'ଭାଷାଗୁଡ଼ିକ',
    },
    'abaut2ux': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    'xovwdem0': {
      'en': 'Change',
      'or': 'ପରିବର୍ତ୍ତନ କରନ୍ତୁ',
    },
    'e0o8mqpv': {
      'en': 'App appearance',
      'or': 'ଆପ୍‌ର ଦୃଶ୍ୟମାନତା',
    },
    'wfsxz2rv': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'iotdg2qh': {
      'en': 'Light mode',
      'or': 'ଲାଇଟ୍ ମୋଡ୍',
    },
    '38qhav5i': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'sr2va43r': {
      'en': 'System preference',
      'or': 'ସିଷ୍ଟମର ପସନ୍ଦ',
    },
    'ljhszzig': {
      'en': 'Help and Support',
      'or': 'ସାହାଯ୍ୟ ଏବଂ ସମର୍ଥନ',
    },
    'i62cy8t8': {
      'en': 'Looking for info about us?',
      'or': 'ଆମ ବିଷୟରେ ସୂଚନା ଚାହୁଁଛନ୍ତି କି?',
    },
    'rcevzeka': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'cesulkgk': {
      'en': 'Tips on how to use Pandora?',
      'or': 'ପାଣ୍ଡୋରା ବ୍ୟବହାର କରିବା ପାଇଁ ଟିପ୍ସ?',
    },
    '55cgqysj': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    '2ggpi01y': {
      'en': 'Need something else?',
      'or': 'ଆଉ କିଛି ଦରକାର କି?',
    },
    'ht7qrhq1': {
      'en': 'Contact support',
      'or': 'ସହାୟତା ପାଇଁ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    'hayxhmpu': {
      'en': 'FAQs',
      'or': 'ସାଧାରଣ ପ୍ରଶ୍ନ',
    },
    'gpp0yp0n': {
      'en': '© 2025 Directorate of Industries, Odisha. All rights reserved.',
      'or': '© ୨୦୨୫ ଶିଳ୍ପ ନିର୍ଦ୍ଦେଶାଳୟ, ଓଡ଼ିଶା। ସର୍ବସତ୍ତ୍ୱ ସଂରକ୍ଷିତ।',
    },
    'tpsxcrea': {
      'en': 'Design & Developed by Qwegle, Odisha State Centre.',
      'or': 'ଡିଜାଇନ୍ ଏବଂ ବିକଶିତ କ୍ୱେଗଲ୍, ଓଡ଼ିଶା ରାଜ୍ୟ କେନ୍ଦ୍ର ଦ୍ୱାରା।',
    },
    's0t3g96y': {
      'en': 'Design & Developed by Qwegle, Odisha State Centre.',
      'or': 'ଡିଜାଇନ୍ ଏବଂ ବିକଶିତ କ୍ୱେଗଲ୍, ଓଡ଼ିଶା ରାଜ୍ୟ କେନ୍ଦ୍ର ଦ୍ୱାରା।',
    },
    '652uog5l': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // DashboardOsfc
  {
    'oywrdpfu': {
      'en': 'Dashboard',
      'or': 'ଡ୍ୟାସବୋର୍ଡ',
    },
    'gdzygn3p': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'i4yk4zny': {
      'en': 'A-',
      'or': 'କ-',
    },
    'k2caa2vs': {
      'en': 'A',
      'or': 'କ',
    },
    '0wrjjwb4': {
      'en': 'A+',
      'or': 'କ+',
    },
    'hufdvc16': {
      'en': 'Pending Application ',
      'or': 'ବିଚାରାଧୀନ ଆବେଦନ',
    },
    'k2lxkphq': {
      'en': 'Approved Application',
      'or': 'ଅନୁମୋଦିତ ଆବେଦନ',
    },
    '0d7iw2ul': {
      'en': 'Rejected Application',
      'or': 'ପ୍ରତ୍ୟାଖ୍ୟାନ କରାଯାଇଥିବା ଆବେଦନ',
    },
    '03ua6p8q': {
      'en': 'Issued no due Certificate',
      'or': 'କୌଣସି ବକେୟା ପ୍ରମାଣପତ୍ର ଜାରି କରାଯାଇଛି',
    },
    'zglyos2j': {
      'en': 'Application Status',
      'or': 'ଆବେଦନ ସ୍ଥିତି',
    },
    '3js9p74l': {
      'en': 'Approved',
      'or': 'ଅନୁମୋଦିତ ହୋଇଛି',
    },
    '3vi1061r': {
      'en': 'Pending',
      'or': 'ବିଚାରାଧୀନ ଅଛି',
    },
    'ablmhgqv': {
      'en': 'Rejected',
      'or': 'ପ୍ରତ୍ୟାଖ୍ୟାନ କରାଗଲା',
    },
    'fgc64xix': {
      'en': 'You’ve almost reached your limit',
      'or': 'ଆପଣ ପ୍ରାୟ ଆପଣଙ୍କ ସୀମାରେ ପହଞ୍ଚି ଯାଇଛନ୍ତି',
    },
    'zm7x8tu0': {
      'en':
          'You have used 80% of your available requests. Upgrade plan to make more network requests.',
      'or':
          'ଆପଣ ଆପଣଙ୍କର ଉପଲବ୍ଧ ଅନୁରୋଧଗୁଡ଼ିକର 80% ବ୍ୟବହାର କରିସାରିଛନ୍ତି। ଅଧିକ ନେଟୱାର୍କ ଅନୁରୋଧ କରିବା ପାଇଁ ଯୋଜନାକୁ ଅପଗ୍ରେଡ୍ କରନ୍ତୁ।',
    },
    'lcyzpyzo': {
      'en': 'OTS Form Applications',
      'or': 'OTS ଫର୍ମ ଆବେଦନ',
    },
    'wunigng6': {
      'en': 'Search your loan number...',
      'or': 'ଋଣ ନମ୍ବର ଖୋଜନ୍ତୁ',
    },
    'rr159asl': {
      'en': 'Search',
      'or': 'ଖୋଜନ୍ତୁ',
    },
    '0u17up71': {
      'en': 'Clear',
      'or': 'ଖାଲି କରନ୍ତୁ',
    },
    '2k9hn5gh': {
      'en': 'loan number is required',
      'or': '',
    },
    'rv0re3ex': {
      'en': 'Enter full 13-character loan number.',
      'or': '',
    },
    'php8lev2': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    '8ot259jw': {
      'en': 'Loan Number',
      'or': 'ଋଣ ନମ୍ବର',
    },
    'cbfckt4l': {
      'en': 'User Name',
      'or': 'ଉପଯୋଗକର୍ତ୍ତା ନାମ',
    },
    'd6ucjsyf': {
      'en': 'Apply Date',
      'or': 'ଆବେଦନ ତାରିଖ',
    },
    'lird6nw3': {
      'en': 'Status',
      'or': 'ସ୍ଥିତି',
    },
    't8j3kosj': {
      'en': 'Actions',
      'or': 'କାର୍ଯ୍ୟ',
    },
    '1xdoxs37': {
      'en': 'Rows per pages:',
      'or': 'ପ୍ରତି ପୃଷ୍ଠା ଧାଡ଼ି:',
    },
    'd0w2zxbt': {
      'en': '10',
      'or': '୧୦',
    },
    'bql6ht72': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'qgwp6qwm': {
      'en': '5',
      'or': '5',
    },
    'b4ewnp67': {
      'en': '10',
      'or': '୧୦',
    },
    'xy0hhs8n': {
      'en': '25',
      'or': '୨୫',
    },
    'sp02j7du': {
      'en': '50',
      'or': '୫୦',
    },
    'e8tbxjop': {
      'en': '100',
      'or': '୧୦୦',
    },
    'qvbdcm0g': {
      'en': '-',
      'or': '-',
    },
    '0dysuc3n': {
      'en': ' of ',
      'or': 'ର',
    },
    '9vmw67tp': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    'xn4ytqmx': {
      'en': '1',
      'or': '୧',
    },
    'ayh0cjuw': {
      'en': 'General Settings',
      'or': 'ସାଧାରଣ ସେଟିଂ',
    },
    'uzlndv91': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    'h8qmive6': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    '2ad48m3c': {
      'en': 'Edit',
      'or': 'ସମ୍ପାଦନ କରନ୍ତୁ',
    },
    'xb04016p': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    'hr8z62nu': {
      'en': 'Amos',
      'or': 'ଆମୋଷ',
    },
    '7x7p5dzf': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    'jm8kthvx': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    'h8clss5z': {
      'en': 'Email address',
      'or': 'ଇମେଲ ଠିକଣା',
    },
    'pnmxcc1f': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    'o09q43xk': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    '9veh6okr': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    'nlwifjz4': {
      'en': 'Languages',
      'or': 'ଭାଷାଗୁଡ଼ିକ',
    },
    'byuzuqi2': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    '47qwzgjt': {
      'en': 'Change',
      'or': 'ପରିବର୍ତ୍ତନ କରନ୍ତୁ',
    },
    'bxbqh1uk': {
      'en': 'App appearance',
      'or': 'ଆପ୍‌ର ଦୃଶ୍ୟମାନତା',
    },
    'yb9btyd5': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'c07gg4po': {
      'en': 'Light mode',
      'or': 'ଲାଇଟ୍ ମୋଡ୍',
    },
    'iwo66iy9': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'jflhoavx': {
      'en': 'System preference',
      'or': 'ସିଷ୍ଟମର ପସନ୍ଦ',
    },
    'lf5gg0pe': {
      'en': 'Help and Support',
      'or': 'ସାହାଯ୍ୟ ଏବଂ ସମର୍ଥନ',
    },
    'sxathsrs': {
      'en': 'Looking for info about us?',
      'or': 'ଆମ ବିଷୟରେ ସୂଚନା ଚାହୁଁଛନ୍ତି କି?',
    },
    'kvo6dx31': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'nrstqlxf': {
      'en': 'Tips on how to use Pandora?',
      'or': 'ପାଣ୍ଡୋରା ବ୍ୟବହାର କରିବା ପାଇଁ ଟିପ୍ସ?',
    },
    '8phith36': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'vp3gomkf': {
      'en': 'Need something else?',
      'or': 'ଆଉ କିଛି ଦରକାର କି?',
    },
    '0s4gjn79': {
      'en': 'Contact support',
      'or': 'ସହାୟତା ପାଇଁ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    '3qi483ou': {
      'en': 'FAQs',
      'or': 'ସାଧାରଣ ପ୍ରଶ୍ନ',
    },
    't2s1in4l': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // ApplicationListBranch
  {
    'qxmhejy1': {
      'en': 'Applications',
      'or': 'ଆପ୍ଲିକେସନ୍‌ଗୁଡ଼ିକ',
    },
    'rhdgdd70': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'rxckc9a1': {
      'en': 'All',
      'or': 'ସମସ୍ତ',
    },
    'ynmvtjtb': {
      'en': 'OTS Form Applications',
      'or': 'OTS ଫର୍ମ ଆବେଦନ',
    },
    'o2o28lhu': {
      'en': 'Search your loan number...',
      'or': 'ଋଣ ନମ୍ବର ଖୋଜନ୍ତୁ',
    },
    '6wn86c5e': {
      'en': 'Search',
      'or': 'ଖୋଜନ୍ତୁ',
    },
    'u4ao7ak2': {
      'en': 'Clear',
      'or': 'ଖାଲି କରନ୍ତୁ',
    },
    '6x1ty9pa': {
      'en': 'loan number is required',
      'or': '',
    },
    'rwf03co3': {
      'en': 'Enter full 13-character loan number.',
      'or': '',
    },
    '2o9f6bcz': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'xvff9zk8': {
      'en': 'Loan Number',
      'or': 'ଋଣ ନମ୍ବର',
    },
    'hrw3t1w4': {
      'en': 'User Name',
      'or': 'ଉପଯୋଗକର୍ତ୍ତା ନାମ',
    },
    'zmlfva7m': {
      'en': 'Apply Date',
      'or': 'ଆବେଦନ ତାରିଖ',
    },
    'qv155vz1': {
      'en': 'Status',
      'or': 'ସ୍ଥିତି',
    },
    '41ykf7cd': {
      'en': 'Actions',
      'or': 'କାର୍ଯ୍ୟ',
    },
    'ingh8xqt': {
      'en': 'Rows per pages:',
      'or': 'ପ୍ରତି ପୃଷ୍ଠା ଧାଡ଼ି:',
    },
    'wsn7s8mb': {
      'en': '10',
      'or': '୧୦',
    },
    'p8e9h6t2': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    '383mro3x': {
      'en': '5',
      'or': '5',
    },
    'l8i04zkn': {
      'en': '10',
      'or': '୧୦',
    },
    'by4v3jfj': {
      'en': '25',
      'or': '୨୫',
    },
    'dvqdq74e': {
      'en': '50',
      'or': '୫୦',
    },
    'udw7sz1a': {
      'en': '100',
      'or': '୧୦୦',
    },
    '6a9wpbvc': {
      'en': '-',
      'or': '-',
    },
    'cr7gabbu': {
      'en': ' of ',
      'or': 'ର',
    },
    'xuawflro': {
      'en': 'Pending',
      'or': 'ବିଚାରାଧୀନ ଅଛି',
    },
    'rnnl8u49': {
      'en': 'OTS Pending Applications',
      'or': 'OTS ବିଚାରାଧୀନ ଆବେଦନଗୁଡ଼ିକ',
    },
    'like2gk2': {
      'en': 'Search Loan Number',
      'or': 'ଋଣ ନମ୍ବର ଖୋଜନ୍ତୁ',
    },
    't57rsv3v': {
      'en': 'Search',
      'or': 'ଖୋଜନ୍ତୁ',
    },
    'vq3usvtj': {
      'en': 'Clear',
      'or': 'ଖାଲି କରନ୍ତୁ',
    },
    'uip269ab': {
      'en': ' Loan Number is required',
      'or': '',
    },
    'uwi2pnze': {
      'en': 'Enter full 13-character loan number.',
      'or': '',
    },
    'pabczuzv': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'uiye3r3g': {
      'en': 'Loan Number',
      'or': 'ଋଣ ନମ୍ବର',
    },
    'gsc39bvg': {
      'en': 'User Name',
      'or': 'ଉପଯୋଗକର୍ତ୍ତା ନାମ',
    },
    'x7j6m109': {
      'en': 'Apply Date',
      'or': 'ଆବେଦନ ତାରିଖ',
    },
    '9oh9ngbu': {
      'en': 'Status',
      'or': 'ସ୍ଥିତି',
    },
    'lc3pc60z': {
      'en': 'Actions',
      'or': 'କାର୍ଯ୍ୟ',
    },
    'ezbt3knc': {
      'en': 'Rows per pages:',
      'or': 'ପ୍ରତି ପୃଷ୍ଠା ଧାଡ଼ି:',
    },
    'y82f50de': {
      'en': '10',
      'or': '୧୦',
    },
    'wevs74ub': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    '7vxioior': {
      'en': '5',
      'or': '5',
    },
    'w20e83eh': {
      'en': '10',
      'or': '୧୦',
    },
    'ug3ozx3a': {
      'en': '25',
      'or': '୨୫',
    },
    '8he68a4h': {
      'en': '50',
      'or': '୫୦',
    },
    'oadlqt7y': {
      'en': '100',
      'or': '୧୦୦',
    },
    '79jkz1kx': {
      'en': '-',
      'or': '-',
    },
    'y69chczg': {
      'en': ' of ',
      'or': 'ର',
    },
    'xx68sljx': {
      'en': 'Approved',
      'or': 'ଅନୁମୋଦିତ ହୋଇଛି',
    },
    '0xoxjagb': {
      'en': 'OTS Approved Applications',
      'or': 'OTS ଅନୁମୋଦିତ ଆବେଦନପତ୍ରଗୁଡ଼ିକ',
    },
    '7av5m231': {
      'en': 'Search Loan Number',
      'or': 'ଋଣ ନମ୍ବର ଖୋଜନ୍ତୁ',
    },
    '9g8uzxsb': {
      'en': 'Search',
      'or': 'ଖୋଜନ୍ତୁ',
    },
    '47r2mfoe': {
      'en': 'Clear',
      'or': 'ଖାଲି କରନ୍ତୁ',
    },
    'lta4gnqu': {
      'en': 'Loan Number is required',
      'or': '',
    },
    'p7td64s0': {
      'en': 'Enter full 13-character loan number.',
      'or': '',
    },
    'tmetd476': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'ml0twf6k': {
      'en': 'Loan Number',
      'or': 'ଋଣ ନମ୍ବର',
    },
    'vjw44wye': {
      'en': 'User Name',
      'or': 'ଉପଯୋଗକର୍ତ୍ତା ନାମ',
    },
    'q84rguwm': {
      'en': 'Apply Date',
      'or': 'ଆବେଦନ ତାରିଖ',
    },
    'caw48e8n': {
      'en': 'Status',
      'or': 'ସ୍ଥିତି',
    },
    'sue3p8tn': {
      'en': 'Actions',
      'or': 'କାର୍ଯ୍ୟ',
    },
    'nyxigj8t': {
      'en': 'Rows per pages:',
      'or': 'ପ୍ରତି ପୃଷ୍ଠା ଧାଡ଼ି:',
    },
    '7389xneb': {
      'en': '10',
      'or': '୧୦',
    },
    'e3kveql7': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'z9s8s9wc': {
      'en': '5',
      'or': '5',
    },
    '3npjzoow': {
      'en': '10',
      'or': '୧୦',
    },
    'proiom9w': {
      'en': '25',
      'or': '୨୫',
    },
    '46prscv9': {
      'en': '50',
      'or': '୫୦',
    },
    '4tofyh4i': {
      'en': '100',
      'or': '୧୦୦',
    },
    '14wnnck8': {
      'en': '-',
      'or': '-',
    },
    'mgua8coc': {
      'en': ' of ',
      'or': 'ର',
    },
    '0bqgxcai': {
      'en': 'Rejected',
      'or': 'ପ୍ରତ୍ୟାଖ୍ୟାନ କରାଗଲା',
    },
    'g3zcdho7': {
      'en': 'OTS Form Applications',
      'or': 'OTS ଫର୍ମ ଆବେଦନ',
    },
    '2jp8oupm': {
      'en': 'Search Loan Number',
      'or': 'ଋଣ ନମ୍ବର ଖୋଜନ୍ତୁ',
    },
    'xbcph7fj': {
      'en': 'Search',
      'or': 'ଖୋଜନ୍ତୁ',
    },
    'p0dogi0a': {
      'en': 'Clear',
      'or': 'ଖାଲି କରନ୍ତୁ',
    },
    'c6mo0afg': {
      'en': 'Search Loan Number is required',
      'or': '',
    },
    'ik6kfeoz': {
      'en': 'Enter full 13-character loan number.',
      'or': '',
    },
    'ou88d8hy': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'zwdf2k9j': {
      'en': 'Loan Number',
      'or': 'ଋଣ ନମ୍ବର',
    },
    '5i2kvadk': {
      'en': 'User Name',
      'or': 'ଉପଯୋଗକର୍ତ୍ତା ନାମ',
    },
    'zjs2kd9o': {
      'en': 'Apply Date',
      'or': 'ଆବେଦନ ତାରିଖ',
    },
    'eb2rtiun': {
      'en': 'Status',
      'or': 'ସ୍ଥିତି',
    },
    '574fjvfl': {
      'en': 'Actions',
      'or': 'କାର୍ଯ୍ୟ',
    },
    '71kl43vq': {
      'en': 'Rows per pages:',
      'or': 'ପ୍ରତି ପୃଷ୍ଠା ଧାଡ଼ି:',
    },
    '8ktc2wr8': {
      'en': '10',
      'or': '୧୦',
    },
    'tib97hi4': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    '2t1vse57': {
      'en': '5',
      'or': '5',
    },
    'f3wi6udy': {
      'en': '10',
      'or': '୧୦',
    },
    'hqt5gtwn': {
      'en': '25',
      'or': '୨୫',
    },
    'g6z2wps8': {
      'en': '50',
      'or': '୫୦',
    },
    '0apnbf7d': {
      'en': '100',
      'or': '୧୦୦',
    },
    'biby9272': {
      'en': '-',
      'or': '-',
    },
    'x5vxotxo': {
      'en': ' of ',
      'or': 'ର',
    },
    'ge13h3a8': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // MemorandomBranch
  {
    'bm3p3ue0': {
      'en': 'Memorandom',
      'or': 'ସ୍ମାରକୀ',
    },
    'fmwzgeyk': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'ys04uu6e': {
      'en': 'Upload Memorandum',
      'or': 'ମେମୋରାଣ୍ଡମ୍ ଅପଲୋଡ୍ କରନ୍ତୁ',
    },
    'dom0l7fg': {
      'en': 'Enter Loan number...',
      'or': 'ଋଣ ନମ୍ବର ପ୍ରବେଶ କରନ୍ତୁ...',
    },
    'hj7tnh68': {
      'en': 'Upload PDF',
      'or': 'PDF ଅପଲୋଡ୍ କରନ୍ତୁ',
    },
    'wummnua3': {
      'en': 'Submit',
      'or': 'ଦାଖଲ କରନ୍ତୁ',
    },
    'c1v9hlr0': {
      'en': 'Loan number is required',
      'or': '',
    },
    'anvhkw39': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    '23olj5p9': {
      'en': 'Memorandom Status',
      'or': 'ସ୍ମାରକୀ ସ୍ଥିତି',
    },
    '7woa2l0h': {
      'en': 'Select...',
      'or': 'ଚୟନ କରନ୍ତୁ...',
    },
    'nt4kmvsf': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    '8gmnrt7z': {
      'en': 'Select',
      'or': 'ଚୟନ କରନ୍ତୁ',
    },
    '0zc035oq': {
      'en': 'Approved',
      'or': 'ଅନୁମୋଦିତ ହୋଇଛି',
    },
    'd1uvma3g': {
      'en': 'Pending',
      'or': 'ବିଚାରାଧୀନ ଅଛି',
    },
    'k2r3kvwm': {
      'en': 'Rejected',
      'or': 'ପ୍ରତ୍ୟାଖ୍ୟାନ କରାଗଲା',
    },
    'bpqhqnbb': {
      'en': 'Search your loan number...',
      'or': 'ଋଣ ନମ୍ବର ଖୋଜନ୍ତୁ',
    },
    'r0qwa5cb': {
      'en': 'Search',
      'or': 'ଖୋଜନ୍ତୁ',
    },
    'h8hkayde': {
      'en': 'Clear',
      'or': 'ଖାଲି କରନ୍ତୁ',
    },
    'xot8qf2g': {
      'en': 'Search your loan number... is required',
      'or': '',
    },
    '1a435648': {
      'en': 'Enter full 13-character loan number.',
      'or': '',
    },
    'uh6tg6ok': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    '7nk0ciwz': {
      'en': 'Loan Number',
      'or': 'ଋଣ ନମ୍ବର',
    },
    '0hxr2djt': {
      'en': 'User Name',
      'or': 'ଉପଯୋଗକର୍ତ୍ତା ନାମ',
    },
    'jbjcg2ie': {
      'en': 'Number',
      'or': 'ସଂଖ୍ୟା',
    },
    'jeqhl1ks': {
      'en': 'Remarks',
      'or': 'ମନ୍ତବ୍ୟ',
    },
    'ixxzxw80': {
      'en': 'Actions',
      'or': 'କାର୍ଯ୍ୟ',
    },
    '11e9vr7d': {
      'en': 'Rows per pages:',
      'or': 'ପ୍ରତି ପୃଷ୍ଠା ଧାଡ଼ି:',
    },
    'ejmtjwqf': {
      'en': '10',
      'or': '୧୦',
    },
    'ruk3i9jh': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    's5jpp9wn': {
      'en': '5',
      'or': '5',
    },
    'f7hfsx2e': {
      'en': '10',
      'or': '୧୦',
    },
    'hv9iiuu2': {
      'en': '25',
      'or': '୨୫',
    },
    '1km2nxli': {
      'en': '50',
      'or': '୫୦',
    },
    'fqcygnii': {
      'en': '100',
      'or': '୧୦୦',
    },
    's68e9rxz': {
      'en': '-',
      'or': '-',
    },
    'ij1tbt02': {
      'en': ' of ',
      'or': 'ର',
    },
    '197gvz9v': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // ClosingStock
  {
    'w4ij93vd': {
      'en': 'Closing Stock',
      'or': 'କ୍ଲୋଜିଂ ଷ୍ଟକ୍',
    },
    'h9twww5h': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'o50tczsa': {
      'en': 'A-',
      'or': 'କ-',
    },
    'xdw8ohub': {
      'en': 'A',
      'or': 'କ',
    },
    'wotyq4rc': {
      'en': 'A+',
      'or': 'କ+',
    },
    'zxvzm0mo': {
      'en': 'Language',
      'or': 'ଭାଷା',
    },
    'jf0mbhec': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'od03nsxx': {
      'en': 'Oriya',
      'or': 'ଓଡ଼ିଆ',
    },
    'dkpata7f': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    'z8k8ya4w': {
      'en': 'OKVI',
      'or': 'ଓକେଭିଆଇ',
    },
    'mbnschqp': {
      'en': 'admin@gmail.com',
      'or': 'ଆଡମିନ୍@gmail.com',
    },
    'd008tjfg': {
      'en': 'Closing Stock Details',
      'or': 'ଷ୍ଟକ୍ ଶେଷ ବିବରଣୀ',
    },
    '7sggawx3': {
      'en': 'Add',
      'or': 'ଯୋଡନ୍ତୁ',
    },
    'ut1tjhda': {
      'en': 'Festival Name:',
      'or': 'ମହୋତ୍ସବର ନାମ:',
    },
    'oc6dim9n': {
      'en': 'Select Festival',
      'or': 'ଉତ୍ସବ ଚୟନ କରନ୍ତୁ',
    },
    'yd9vbey4': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'qghx06il': {
      'en': '0',
      'or': '0',
    },
    'mkrrayce': {
      'en': '1',
      'or': '୧',
    },
    '67qlfdsw': {
      'en': 'Head:',
      'or': 'ମୁଖ୍ୟ:',
    },
    'klhb7ts7': {
      'en': 'Select Head',
      'or': 'ମୁଖ୍ୟ ଚୟନ କରନ୍ତୁ',
    },
    'rohfe1vh': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    '3niybp0n': {
      'en': '0',
      'or': '0',
    },
    'hxcf0uw9': {
      'en': '1',
      'or': '୧',
    },
    '0ver2o8r': {
      'en': 'Sub head Details',
      'or': 'ଉପମୁଖ୍ୟ ବିବରଣୀ',
    },
    'dw340gjc': {
      'en': 'Sub head (Product Name):',
      'or': 'ଉପମୁଖ୍ୟ (ଉତ୍ପାଦ ନାମ):',
    },
    '75n4oeqe': {
      'en': 'Enter Sub head (Product Name)',
      'or': 'ସବ୍ ହେଡ୍ (ଉତ୍ପାଦ ନାମ) ପ୍ରବେଶ କରନ୍ତୁ',
    },
    'mgymzcz0': {
      'en': 'Unit Type:',
      'or': 'ୟୁନିଟ୍ ପ୍ରକାର:',
    },
    '0v3q5o75': {
      'en': 'Select Unit',
      'or': 'ୟୁନିଟ୍ ଚୟନ କରନ୍ତୁ',
    },
    'h48b7hda': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    '4hcw650d': {
      'en':
          'Settlement amount to be paid with 60 days of its formal communication',
      'or': 'ଆନୁଷ୍ଠାନିକ ଯୋଗାଯୋଗର 60 ଦିନ ମଧ୍ୟରେ ସମାଧାନ ପରିମାଣ ପୈଠ କରିବାକୁ ପଡିବ',
    },
    '56kebjj5': {
      'en':
          'To be paid within one year from the date of issue of settlement order in 12 equated monthly installments with amount beyond 30 days. (Strike off whichever is not applicable)',
      'or':
          'ସମାଧାନ ଅର୍ଡର ଜାରି ହେବାର ଏକ ବର୍ଷ ମଧ୍ୟରେ 30 ଦିନରୁ ଅଧିକ ପରିମାଣର 12ଟି ସମାନ ମାସିକ କିସ୍ତିରେ ପୈଠ କରାଯିବ। (ଯେଉଁଟି ପ୍ରଯୁଜ୍ୟ ନୁହେଁ ତାହା କାଟି ଦିଅନ୍ତୁ)',
    },
    '7cvwvrmy': {
      'en':
          'All in eligible loan dues shall be paid along with the settlement amount within the period as at \"a\" above.',
      'or':
          'ଉପରୋକ୍ତ \"କ\" ରେ ଥିବା ସମୟ ମଧ୍ୟରେ ସମସ୍ତ ଯୋଗ୍ୟ ଋଣ ଦେୟ ସମାଧାନ ପରିମାଣ ସହିତ ପରିଶୋଧ କରାଯିବ।',
    },
    '8bol14aw': {
      'en': 'Unit Price:',
      'or': 'ୟୁନିଟ୍ ମୂଲ୍ୟ:',
    },
    'j4nudehw': {
      'en': 'Enter Unit Price',
      'or': 'ୟୁନିଟ୍ ମୂଲ୍ୟ ଲେଖନ୍ତୁ',
    },
    'olxcha2x': {
      'en': 'Quantity:',
      'or': 'ପରିମାଣ:',
    },
    'm98orcxt': {
      'en': 'Enter Closing Stock',
      'or': 'କ୍ଲୋଜିଂ ଷ୍ଟକ୍ ପ୍ରବେଶ କରନ୍ତୁ',
    },
    'a36ph012': {
      'en': 'Total price:',
      'or': 'ମୋଟ ମୂଲ୍ୟ:',
    },
    'bth6mq3p': {
      'en': 'Enter Total price',
      'or': 'ମୋଟ ମୂଲ୍ୟ ଲେଖନ୍ତୁ',
    },
    '7mpw591d': {
      'en': 'Sumbit',
      'or': 'ସମ୍ବିଟ୍',
    },
    '7nbpoqe3': {
      'en': 'Cancel',
      'or': 'ବାତିଲ କରନ୍ତୁ',
    },
    'oforih6x': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    '5k80ejdo': {
      'en': '1',
      'or': '୧',
    },
    'hrgg1vsf': {
      'en': 'General Settings',
      'or': 'ସାଧାରଣ ସେଟିଂ',
    },
    'xoe3c2pr': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    '35npmivq': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    'anqtjxuu': {
      'en': 'Edit',
      'or': 'ସମ୍ପାଦନ କରନ୍ତୁ',
    },
    'zkfiej31': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    '7fwfa6x6': {
      'en': 'Amos',
      'or': 'ଆମୋଷ',
    },
    'g14dfp8p': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    'g4n9f59z': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    'wapdd4gb': {
      'en': 'Email address',
      'or': 'ଇମେଲ ଠିକଣା',
    },
    'hilaabln': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    'mgx4ut0e': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    'ps640zzo': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    'h1j2w451': {
      'en': 'Languages',
      'or': 'ଭାଷାଗୁଡ଼ିକ',
    },
    'kdxp4406': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    'y96xkuib': {
      'en': 'Change',
      'or': 'ପରିବର୍ତ୍ତନ କରନ୍ତୁ',
    },
    'ug6rkock': {
      'en': 'App appearance',
      'or': 'ଆପ୍‌ର ଦୃଶ୍ୟମାନତା',
    },
    'fr1h4xjt': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'm8knm104': {
      'en': 'Light mode',
      'or': 'ଲାଇଟ୍ ମୋଡ୍',
    },
    'jbgzhq6a': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'vwv3522x': {
      'en': 'System preference',
      'or': 'ସିଷ୍ଟମର ପସନ୍ଦ',
    },
    'gwwv66w1': {
      'en': 'Help and Support',
      'or': 'ସାହାଯ୍ୟ ଏବଂ ସମର୍ଥନ',
    },
    'tjba9la8': {
      'en': 'Looking for info about us?',
      'or': 'ଆମ ବିଷୟରେ ସୂଚନା ଚାହୁଁଛନ୍ତି କି?',
    },
    'dpudwvxe': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'ayqj355d': {
      'en': 'Tips on how to use Pandora?',
      'or': 'ପାଣ୍ଡୋରା ବ୍ୟବହାର କରିବା ପାଇଁ ଟିପ୍ସ?',
    },
    'a92ccusx': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'ea2oqzgm': {
      'en': 'Need something else?',
      'or': 'ଆଉ କିଛି ଦରକାର କି?',
    },
    'w71rx55a': {
      'en': 'Contact support',
      'or': 'ସହାୟତା ପାଇଁ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    'wbgf7e82': {
      'en': 'FAQs',
      'or': 'ସାଧାରଣ ପ୍ରଶ୍ନ',
    },
    '763w4yq3': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // OpeningStockList
  {
    'bymoid7x': {
      'en': 'Opening Stock List',
      'or': 'ଷ୍ଟକ୍ ତାଲିକା ଖୋଲୁଛି',
    },
    '2q5k1yis': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'qyyun0y7': {
      'en': 'A-',
      'or': 'କ-',
    },
    'u1ji74d9': {
      'en': 'A',
      'or': 'କ',
    },
    'u4z3r1aw': {
      'en': 'A+',
      'or': 'କ+',
    },
    'bq8jhtvq': {
      'en': 'Language',
      'or': 'ଭାଷା',
    },
    's08sjhzk': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    '9lp4jr4j': {
      'en': 'Oriya',
      'or': 'ଓଡ଼ିଆ',
    },
    '1536edyl': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    'a7z0bvmt': {
      'en': 'OKVI',
      'or': 'ଓକେଭିଆଇ',
    },
    'z4die1pk': {
      'en': 'admin@gmail.com',
      'or': 'ଆଡମିନ୍@gmail.com',
    },
    'ydivbtjn': {
      'en': 'Submitted Documents for Rebate Proposal',
      'or': 'ରିହାତି ପ୍ରସ୍ତାବ ପାଇଁ ଦାଖଲ ହୋଇଥିବା ଡକ୍ୟୁମେଣ୍ଟଗୁଡ଼ିକ',
    },
    'oe8jmogv': {
      'en': 'Select Document',
      'or': 'ଡକ୍ୟୁମେଣ୍ଟ ଚୟନ କରନ୍ତୁ',
    },
    '7dfaf78g': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'jwbz46fv': {
      'en': '0',
      'or': '0',
    },
    'hu6ly40v': {
      'en': '1',
      'or': '୧',
    },
    '9krwbc8y': {
      'en': 'Select Festive Name',
      'or': 'ଉତ୍ସବର ନାମ ଚୟନ କରନ୍ତୁ',
    },
    'e5d8xnk6': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'andhpyas': {
      'en': '0',
      'or': '0',
    },
    'xu83sl53': {
      'en': '1',
      'or': '୧',
    },
    'b45enpuu': {
      'en': 'Clear Filter',
      'or': 'ଫିଲ୍ଟର୍ ଖାଲି କରନ୍ତୁ',
    },
    'v8aou21n': {
      'en': 'Sl. No',
      'or': 'କ୍ରମିକ ନାଁ',
    },
    '3iiy7g16': {
      'en': 'Financial Year',
      'or': 'ଆର୍ଥିକ ବର୍ଷ',
    },
    'qx8daepr': {
      'en': 'Festive Name',
      'or': 'ଉତ୍ସବର ନାମ',
    },
    'lrp5n1uo': {
      'en': 'Spell Start Date',
      'or': 'ବନାନ ଆରମ୍ଭ ତାରିଖ',
    },
    '3k1gaw8f': {
      'en': 'Spell End Date',
      'or': 'ବନାନ ଶେଷ ତାରିଖ',
    },
    'vi3wfael': {
      'en': 'Actions',
      'or': 'କାର୍ଯ୍ୟ',
    },
    'iwpvwlkl': {
      'en': '1',
      'or': '୧',
    },
    '56d9pi2e': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'wd1hb928': {
      'en': 'Tapan Mohanty',
      'or': 'ତପନ ମହାନ୍ତି',
    },
    '4o01zeqi': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'nnodterd': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'wqz4i4mj': {
      'en': 'View',
      'or': 'ଦର୍ଶନ',
    },
    't6lm9fhd': {
      'en': '2',
      'or': '୨',
    },
    'vi4njimx': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    '3z13k8gf': {
      'en': 'Chittaranjan Panda',
      'or': 'ଚିତ୍ତରଞ୍ଜନ ପଣ୍ଡା',
    },
    'sm2io3ti': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'y7wkzrib': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'avd44b48': {
      'en': 'View',
      'or': 'ଦର୍ଶନ',
    },
    '3045njwb': {
      'en': '3',
      'or': '3',
    },
    't76xbudg': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'qupod5yp': {
      'en': 'Ajay Kumar Mohapatra',
      'or': 'ଅଜୟ କୁମାର ମହାପାତ୍ର',
    },
    'obh9mn6l': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    '6vrgomca': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    '3v88ctkj': {
      'en': 'View',
      'or': 'ଦର୍ଶନ',
    },
    'zxkjz1aq': {
      'en': '4',
      'or': '୪',
    },
    'fcdppcel': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'w8gut31p': {
      'en': 'Tapas Sahu',
      'or': 'ତାପସ ସାହୁ',
    },
    '9sf58xun': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    '2bqxkoih': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'to63to52': {
      'en': 'View',
      'or': 'ଦର୍ଶନ',
    },
    'cltzdmz2': {
      'en': '5',
      'or': '5',
    },
    '93rtvcn9': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    '70i28r60': {
      'en': 'Rajkishore Das',
      'or': 'ରାଜକିଶୋର ଦାସ',
    },
    'h98ega0v': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    '0rbarj57': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'jnwi9pit': {
      'en': 'View',
      'or': 'ଦର୍ଶନ',
    },
    'utn21k8h': {
      'en': '6',
      'or': '6',
    },
    'wv0dcdmc': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    '1q9czywg': {
      'en': 'Rajkishore Das',
      'or': 'ରାଜକିଶୋର ଦାସ',
    },
    'e3itiuzo': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    '1xn1piip': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    '8yidyfz6': {
      'en': 'View',
      'or': 'ଦର୍ଶନ',
    },
    '2gzjidg4': {
      'en': '7',
      'or': '7',
    },
    't7w6kh92': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'yni0n2ge': {
      'en': 'Rajkishore Das',
      'or': 'ରାଜକିଶୋର ଦାସ',
    },
    'k8kbuyq6': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'h40pb1r6': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    't80gsqrm': {
      'en': 'View',
      'or': 'ଦର୍ଶନ',
    },
    'uy3bd01t': {
      'en': 'Card Header',
      'or': 'କାର୍ଡ ହେଡର୍',
    },
    'wmrheg3p': {
      'en': 'Create tables and ui elements that work below.',
      'or': 'ତଳେ କାମ କରୁଥିବା ସାରଣୀ ଏବଂ ui ଉପାଦାନଗୁଡ଼ିକ ତିଆରି କରନ୍ତୁ।',
    },
    'keedx6ri': {
      'en': 'Add New',
      'or': 'ନୂତନ ଯୋଡନ୍ତୁ',
    },
    '30rsvwid': {
      'en': 'Work Type',
      'or': 'କାର୍ଯ୍ୟ ପ୍ରକାର',
    },
    'thjy5rjn': {
      'en': 'Assigned User',
      'or': 'ନିଯୁକ୍ତ ଉପଯୋଗକର୍ତ୍ତା',
    },
    'c0xzwwrg': {
      'en': 'Contract Amount',
      'or': 'ଚୁକ୍ତି ପରିମାଣ',
    },
    '7i2d15q9': {
      'en': 'Status',
      'or': 'ସ୍ଥିତି',
    },
    '49i7ib94': {
      'en': 'Actions',
      'or': 'କାର୍ଯ୍ୟ',
    },
    'iwlgzmwn': {
      'en': 'Design Work',
      'or': 'ଡିଜାଇନ୍ କାର୍ଯ୍ୟ',
    },
    '86pf1bd3': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    'h42kqvxg': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    '4capbxff': {
      'en': '\$2,100',
      'or': '\$୨,୧୦୦',
    },
    'kejqtjay': {
      'en': 'Paid',
      'or': 'ଦେୟ ଦିଆଯାଇଛି',
    },
    'i4c9uge1': {
      'en': 'Design Work',
      'or': 'ଡିଜାଇନ୍ କାର୍ଯ୍ୟ',
    },
    'qszsfbqx': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    '8gpdpxx6': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    'q9knnmb5': {
      'en': '\$2,100',
      'or': '\$୨,୧୦୦',
    },
    'qvqtka2v': {
      'en': 'Paid',
      'or': 'ଦେୟ ଦିଆଯାଇଛି',
    },
    'igq1ix3v': {
      'en': 'Design Work',
      'or': 'ଡିଜାଇନ୍ କାର୍ଯ୍ୟ',
    },
    'ig83jcs5': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    'xyo2zks3': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    '5953hk8n': {
      'en': '\$2,100',
      'or': '\$୨,୧୦୦',
    },
    '9wn6bh94': {
      'en': 'Paid',
      'or': 'ଦେୟ ଦିଆଯାଇଛି',
    },
    'gr64fqwt': {
      'en': 'Design Work',
      'or': 'ଡିଜାଇନ୍ କାର୍ଯ୍ୟ',
    },
    '72j5umt2': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    '2n2k423b': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    '282y833x': {
      'en': '\$2,100',
      'or': '\$୨,୧୦୦',
    },
    'f50iwpo7': {
      'en': 'Paid',
      'or': 'ଦେୟ ଦିଆଯାଇଛି',
    },
    'fb1gi65d': {
      'en': 'Design Work',
      'or': 'ଡିଜାଇନ୍ କାର୍ଯ୍ୟ',
    },
    'udtqah9l': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    'n6q1usew': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    'dux2qo9i': {
      'en': '\$2,100',
      'or': '\$୨,୧୦୦',
    },
    'hzi85obv': {
      'en': 'Pending',
      'or': 'ବିଚାରାଧୀନ ଅଛି',
    },
    'xhwcn9ih': {
      'en': 'Design Work',
      'or': 'ଡିଜାଇନ୍ କାର୍ଯ୍ୟ',
    },
    '35pnoxv3': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    'jkq8xwot': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    'tv27zt91': {
      'en': '\$2,100',
      'or': '\$୨,୧୦୦',
    },
    'rejcrm51': {
      'en': 'Pending',
      'or': 'ବିଚାରାଧୀନ ଅଛି',
    },
    'jw04vc3n': {
      'en': 'Design Work',
      'or': 'ଡିଜାଇନ୍ କାର୍ଯ୍ୟ',
    },
    'xq0ufa5o': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    'p6lhvo4c': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    'txpg5ax8': {
      'en': '\$2,100',
      'or': '\$୨,୧୦୦',
    },
    'd1zow7bj': {
      'en': 'Pending',
      'or': 'ବିଚାରାଧୀନ ଅଛି',
    },
    '0vz6iofb': {
      'en': 'Search',
      'or': 'ଖୋଜନ୍ତୁ',
    },
    '44bsmhqk': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    'iovk71w7': {
      'en': 'Financial Year',
      'or': 'ଆର୍ଥିକ ବର୍ଷ',
    },
    '2igkfvy5': {
      'en': 'Select...',
      'or': 'ଚୟନ କରନ୍ତୁ...',
    },
    'klvet7qz': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'fcgm8mym': {
      'en': '0',
      'or': '0',
    },
    '2zh01zll': {
      'en': '1',
      'or': '୧',
    },
    '4tut94j6': {
      'en': 'Festive Name',
      'or': 'ଉତ୍ସବର ନାମ',
    },
    '8xwm9tok': {
      'en': 'Select...',
      'or': 'ଚୟନ କରନ୍ତୁ...',
    },
    'dcak9ih0': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'znfohlnu': {
      'en': '0',
      'or': '0',
    },
    'bwos40cn': {
      'en': '1',
      'or': '୧',
    },
    '6eobh6ii': {
      'en': 'Search',
      'or': 'ଖୋଜନ୍ତୁ',
    },
    '2cfkiyo1': {
      'en': 'Cancel',
      'or': 'ବାତିଲ କରନ୍ତୁ',
    },
    'zgfd8p9u': {
      'en': 'Detail List',
      'or': 'ବିବରଣୀ ତାଲିକା',
    },
    '8lwldg3f': {
      'en': 'Select Festive Name',
      'or': 'ଉତ୍ସବର ନାମ ଚୟନ କରନ୍ତୁ',
    },
    'n9j1iv9r': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    '0zeef8hp': {
      'en': '0',
      'or': '0',
    },
    'sdq1cnzh': {
      'en': '1',
      'or': '୧',
    },
    'nkmn9iai': {
      'en': 'Select Financial Year',
      'or': 'ଆର୍ଥିକ ବର୍ଷ ଚୟନ କରନ୍ତୁ',
    },
    'n83x5dfi': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'rmgcsabv': {
      'en': '0',
      'or': '0',
    },
    'rr8bsi2n': {
      'en': '1',
      'or': '୧',
    },
    'b8c0str5': {
      'en': 'Clear Filter',
      'or': 'ଫିଲ୍ଟର୍ ଖାଲି କରନ୍ତୁ',
    },
    'nnyeqhjr': {
      'en': 'Sl. No',
      'or': 'କ୍ରମିକ ନାଁ',
    },
    'lp87ln3r': {
      'en': 'Financial Year',
      'or': 'ଆର୍ଥିକ ବର୍ଷ',
    },
    'mewozau1': {
      'en': 'Festive Name',
      'or': 'ଉତ୍ସବର ନାମ',
    },
    'hdxdfx0m': {
      'en': '1',
      'or': '୧',
    },
    't2xrp4go': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'hfouffuk': {
      'en': 'Randy Peterson ',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    'iu4gskmo': {
      'en': 'Spell Start Date',
      'or': 'ବନାନ ଆରମ୍ଭ ତାରିଖ',
    },
    '2qz19xol': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'ks59olmw': {
      'en': 'Spell End Date',
      'or': 'ବନାନ ଶେଷ ତାରିଖ',
    },
    'b9n5k7wa': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    '3r24bqlk': {
      'en': 'View Details',
      'or': 'ବିବରଣୀ ଦେଖନ୍ତୁ',
    },
    'dibzz8z4': {
      'en': 'View',
      'or': 'ଦର୍ଶନ',
    },
    'zi2nishc': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    '4uifc8ge': {
      'en': '1',
      'or': '୧',
    },
    'h6vaemy1': {
      'en': 'General Settings',
      'or': 'ସାଧାରଣ ସେଟିଂ',
    },
    '3wk6mgnw': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    '2l4rdz55': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    'cs4gpylv': {
      'en': 'Edit',
      'or': 'ସମ୍ପାଦନ କରନ୍ତୁ',
    },
    'n71ciw2n': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    'x6nmeoxh': {
      'en': 'Amos',
      'or': 'ଆମୋଷ',
    },
    'rebyaa83': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    'ijx18o4r': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    'bv5gr0e5': {
      'en': 'Email address',
      'or': 'ଇମେଲ ଠିକଣା',
    },
    'cmb66fc6': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    'opiklkl0': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    't61i8pbj': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    'wqws2m51': {
      'en': 'Languages',
      'or': 'ଭାଷାଗୁଡ଼ିକ',
    },
    'ykdv461u': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    'qg6s2ah3': {
      'en': 'Change',
      'or': 'ପରିବର୍ତ୍ତନ କରନ୍ତୁ',
    },
    '28nb3853': {
      'en': 'App appearance',
      'or': 'ଆପ୍‌ର ଦୃଶ୍ୟମାନତା',
    },
    'mytbebsr': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    '6m0cu2fq': {
      'en': 'Light mode',
      'or': 'ଲାଇଟ୍ ମୋଡ୍',
    },
    'm4yupq39': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'o00nv7zt': {
      'en': 'System preference',
      'or': 'ସିଷ୍ଟମର ପସନ୍ଦ',
    },
    '8q7z3k6j': {
      'en': 'Help and Support',
      'or': 'ସାହାଯ୍ୟ ଏବଂ ସମର୍ଥନ',
    },
    '7e8alvvq': {
      'en': 'Looking for info about us?',
      'or': 'ଆମ ବିଷୟରେ ସୂଚନା ଚାହୁଁଛନ୍ତି କି?',
    },
    'm9l7o4rp': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'k62cyuyl': {
      'en': 'Tips on how to use Pandora?',
      'or': 'ପାଣ୍ଡୋରା ବ୍ୟବହାର କରିବା ପାଇଁ ଟିପ୍ସ?',
    },
    'n3rdcmy8': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'tluwda32': {
      'en': 'Need something else?',
      'or': 'ଆଉ କିଛି ଦରକାର କି?',
    },
    's69dsi14': {
      'en': 'Contact support',
      'or': 'ସହାୟତା ପାଇଁ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    'jc3zn0wx': {
      'en': 'FAQs',
      'or': 'ସାଧାରଣ ପ୍ରଶ୍ନ',
    },
    'vbd61x2v': {
      'en': '© 2025 Directorate of Industries, Odisha. All rights reserved.',
      'or': '© ୨୦୨୫ ଶିଳ୍ପ ନିର୍ଦ୍ଦେଶାଳୟ, ଓଡ଼ିଶା। ସର୍ବସତ୍ତ୍ୱ ସଂରକ୍ଷିତ।',
    },
    'hufsqc9c': {
      'en': 'Design & Developed by Qwegle, Odisha State Centre.',
      'or': 'ଡିଜାଇନ୍ ଏବଂ ବିକଶିତ କ୍ୱେଗଲ୍, ଓଡ଼ିଶା ରାଜ୍ୟ କେନ୍ଦ୍ର ଦ୍ୱାରା।',
    },
    'h9cya8n0': {
      'en': 'Design & Developed by Qwegle, Odisha State Centre.',
      'or': 'ଡିଜାଇନ୍ ଏବଂ ବିକଶିତ କ୍ୱେଗଲ୍, ଓଡ଼ିଶା ରାଜ୍ୟ କେନ୍ଦ୍ର ଦ୍ୱାରା।',
    },
    'qz8don7w': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // ViewSumbitedClaimDocument
  {
    '3fnxnyvs': {
      'en': 'Dashboard',
      'or': 'ଡ୍ୟାସବୋର୍ଡ',
    },
    'nsevwox8': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'ns5by61p': {
      'en': 'A-',
      'or': 'କ-',
    },
    'pnyoqt25': {
      'en': 'A',
      'or': 'କ',
    },
    '57ohamq4': {
      'en': 'A+',
      'or': 'କ+',
    },
    'l2ugmwbr': {
      'en': 'Language',
      'or': 'ଭାଷା',
    },
    'asajdv1e': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    '82vr38dh': {
      'en': 'Oriya',
      'or': 'ଓଡ଼ିଆ',
    },
    'x4bsd4pe': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    'xdhraxhl': {
      'en': 'OKVI',
      'or': 'ଓକେଭିଆଇ',
    },
    'zljrtxwa': {
      'en': 'admin@gmail.com',
      'or': 'ଆଡମିନ୍@gmail.com',
    },
    'rb3qhqjt': {
      'en': 'Card Header',
      'or': 'କାର୍ଡ ହେଡର୍',
    },
    '8825fe0f': {
      'en': 'Create tables and ui elements that work below.',
      'or': 'ତଳେ କାମ କରୁଥିବା ସାରଣୀ ଏବଂ ui ଉପାଦାନଗୁଡ଼ିକ ତିଆରି କରନ୍ତୁ।',
    },
    '7c4eja6u': {
      'en': 'Add New',
      'or': 'ନୂତନ ଯୋଡନ୍ତୁ',
    },
    'acn8hhj8': {
      'en': 'Work Type',
      'or': 'କାର୍ଯ୍ୟ ପ୍ରକାର',
    },
    'dzphkxfc': {
      'en': 'Assigned User',
      'or': 'ନିଯୁକ୍ତ ଉପଯୋଗକର୍ତ୍ତା',
    },
    'q6ipgxr7': {
      'en': 'Contract Amount',
      'or': 'ଚୁକ୍ତି ପରିମାଣ',
    },
    'rddn28v8': {
      'en': 'Status',
      'or': 'ସ୍ଥିତି',
    },
    'p7npdpkp': {
      'en': 'Actions',
      'or': 'କାର୍ଯ୍ୟ',
    },
    'n5d588y6': {
      'en': 'Design Work',
      'or': 'ଡିଜାଇନ୍ କାର୍ଯ୍ୟ',
    },
    'yui0kymn': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    'xodjmus7': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    'yxr4li0r': {
      'en': '\$2,100',
      'or': '\$୨,୧୦୦',
    },
    '9kae556c': {
      'en': 'Paid',
      'or': 'ଦେୟ ଦିଆଯାଇଛି',
    },
    '3q4iqw4b': {
      'en': 'Design Work',
      'or': 'ଡିଜାଇନ୍ କାର୍ଯ୍ୟ',
    },
    'sufqdgwu': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    'xz16t8x3': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    'bd1cu94e': {
      'en': '\$2,100',
      'or': '\$୨,୧୦୦',
    },
    'vdg8nzsr': {
      'en': 'Paid',
      'or': 'ଦେୟ ଦିଆଯାଇଛି',
    },
    '0meydjd9': {
      'en': 'Design Work',
      'or': 'ଡିଜାଇନ୍ କାର୍ଯ୍ୟ',
    },
    'nvwry90k': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    'a52ign47': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    'wcknqfrt': {
      'en': '\$2,100',
      'or': '\$୨,୧୦୦',
    },
    'xrfj484e': {
      'en': 'Paid',
      'or': 'ଦେୟ ଦିଆଯାଇଛି',
    },
    '51g2r4f1': {
      'en': 'Design Work',
      'or': 'ଡିଜାଇନ୍ କାର୍ଯ୍ୟ',
    },
    'as6a02hm': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    '3ibjuyhe': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    'satw1yb0': {
      'en': '\$2,100',
      'or': '\$୨,୧୦୦',
    },
    'f27z0uxe': {
      'en': 'Paid',
      'or': 'ଦେୟ ଦିଆଯାଇଛି',
    },
    'z2p0gss8': {
      'en': 'Design Work',
      'or': 'ଡିଜାଇନ୍ କାର୍ଯ୍ୟ',
    },
    'a60bnkkd': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    'udzkyygg': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    'qih046cc': {
      'en': '\$2,100',
      'or': '\$୨,୧୦୦',
    },
    'vnhrntam': {
      'en': 'Pending',
      'or': 'ବିଚାରାଧୀନ ଅଛି',
    },
    'ck1eurmw': {
      'en': 'Design Work',
      'or': 'ଡିଜାଇନ୍ କାର୍ଯ୍ୟ',
    },
    '618yyd8e': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    '1ar2p8sh': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    '3jrybvcu': {
      'en': '\$2,100',
      'or': '\$୨,୧୦୦',
    },
    'x2aqu82i': {
      'en': 'Pending',
      'or': 'ବିଚାରାଧୀନ ଅଛି',
    },
    'gktesy7g': {
      'en': 'Design Work',
      'or': 'ଡିଜାଇନ୍ କାର୍ଯ୍ୟ',
    },
    'rp5cmya3': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    '0bsvy2fz': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    '5l3gzre4': {
      'en': '\$2,100',
      'or': '\$୨,୧୦୦',
    },
    'co8k6kxs': {
      'en': 'Pending',
      'or': 'ବିଚାରାଧୀନ ଅଛି',
    },
    '5beubkrl': {
      'en': 'Pending Application ',
      'or': 'ବିଚାରାଧୀନ ଆବେଦନ',
    },
    'mlcwftza': {
      'en': '567,402',
      'or': '୫୬୭,୪୦୨',
    },
    'lcc4vm2n': {
      'en': 'Approved Application',
      'or': 'ଅନୁମୋଦିତ ଆବେଦନ',
    },
    '46lw7wdc': {
      'en': '2,208',
      'or': '୨,୨୦୮',
    },
    'q3humdtg': {
      'en': 'Pending No Due Certificate ',
      'or': 'ବାକି ଥିବା କୌଣସି ଦେୟ ପ୍ରମାଣପତ୍ର ନାହିଁ',
    },
    '3anf87ts': {
      'en': '567,402',
      'or': '୫୬୭,୪୦୨',
    },
    'gs3f06h3': {
      'en': 'Approved No Due Certificate',
      'or': 'ଅନୁମୋଦିତ କୌଣସି ଦେୟ ନାହିଁ ପ୍ରମାଣପତ୍ର',
    },
    'b3ftrwxb': {
      'en': '2,208',
      'or': '୨,୨୦୮',
    },
    '71rd5s2g': {
      'en': 'Application Status',
      'or': 'ଆବେଦନ ସ୍ଥିତି',
    },
    'x49o21a2': {
      'en': 'No Due Certificate Status',
      'or': 'କୌଣସି ବାକି ସାର୍ଟିଫିକେଟ୍ ସ୍ଥିତି ନାହିଁ',
    },
    '0cg1puqd': {
      'en': 'Approved',
      'or': 'ଅନୁମୋଦିତ ହୋଇଛି',
    },
    'ttos392z': {
      'en': 'Pending',
      'or': 'ବିଚାରାଧୀନ ଅଛି',
    },
    'a69t8azf': {
      'en': 'Rejected',
      'or': 'ପ୍ରତ୍ୟାଖ୍ୟାନ କରାଗଲା',
    },
    'z1mzypgl': {
      'en': 'Approved',
      'or': 'ଅନୁମୋଦିତ ହୋଇଛି',
    },
    '9omtr4ho': {
      'en': 'Pending',
      'or': 'ବିଚାରାଧୀନ ଅଛି',
    },
    'v8vnbe0n': {
      'en': 'Rejected',
      'or': 'ପ୍ରତ୍ୟାଖ୍ୟାନ କରାଗଲା',
    },
    'yzs6w26l': {
      'en': 'You’ve almost reached your limit',
      'or': 'ଆପଣ ପ୍ରାୟ ଆପଣଙ୍କ ସୀମାରେ ପହଞ୍ଚି ଯାଇଛନ୍ତି',
    },
    'dtcsbpkz': {
      'en':
          'You have used 80% of your available requests. Upgrade plan to make more network requests.',
      'or':
          'ଆପଣ ଆପଣଙ୍କର ଉପଲବ୍ଧ ଅନୁରୋଧଗୁଡ଼ିକର 80% ବ୍ୟବହାର କରିସାରିଛନ୍ତି। ଅଧିକ ନେଟୱାର୍କ ଅନୁରୋଧ କରିବା ପାଇଁ ଯୋଜନାକୁ ଅପଗ୍ରେଡ୍ କରନ୍ତୁ।',
    },
    'cpa1snsi': {
      'en': 'Status',
      'or': 'ସ୍ଥିତି',
    },
    'rux3ssd6': {
      'en': 'Select...',
      'or': 'ଚୟନ କରନ୍ତୁ...',
    },
    '29hykls7': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'urhfyjmq': {
      'en': 'Select',
      'or': 'ଚୟନ କରନ୍ତୁ',
    },
    'y0bi19ew': {
      'en': 'Application',
      'or': 'ପ୍ରୟୋଗ',
    },
    'rqvhn1yj': {
      'en': 'Certificate',
      'or': 'ସାର୍ଟିଫିକେଟ୍',
    },
    '5bsndbvn': {
      'en': 'Search.....',
      'or': 'ଖୋଜନ୍ତୁ.....',
    },
    'zmbvkl8j': {
      'en': 'Loan Number',
      'or': 'ଋଣ ନମ୍ବର',
    },
    '0rucu9d0': {
      'en': 'User Name',
      'or': 'ଉପଯୋଗକର୍ତ୍ତା ନାମ',
    },
    'rq4pqrn9': {
      'en': 'Loan Amount',
      'or': 'ଋଣ ରାଶି',
    },
    'im3wazso': {
      'en': '5498*****',
      'or': '୫୪୯୮*****',
    },
    'ki1pwpw4': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    'dk1e6quu': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    'o0zvmlcm': {
      'en': '₹2,10,567',
      'or': '₹୨,୧୦,୫୬୭',
    },
    '8x77eqtg': {
      'en': 'Status',
      'or': 'ସ୍ଥିତି',
    },
    'cn490zwk': {
      'en': 'Approved',
      'or': 'ଅନୁମୋଦିତ ହୋଇଛି',
    },
    'ofzs1um5': {
      'en': 'Actions',
      'or': 'କାର୍ଯ୍ୟ',
    },
    'ftgp2moo': {
      'en': 'View',
      'or': 'ଦର୍ଶନ',
    },
    'kadpehko': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    'ba20umku': {
      'en': '1',
      'or': '୧',
    },
    'rtin8h40': {
      'en': 'General Settings',
      'or': 'ସାଧାରଣ ସେଟିଂ',
    },
    '0hn3cbp6': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    '8t1da256': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    '1jbkivmo': {
      'en': 'Edit',
      'or': 'ସମ୍ପାଦନ କରନ୍ତୁ',
    },
    'jg8j0i01': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    'a9q16d1d': {
      'en': 'Amos',
      'or': 'ଆମୋଷ',
    },
    'l1pipvw0': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    'iyvcco0k': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    'j72u7qgk': {
      'en': 'Email address',
      'or': 'ଇମେଲ ଠିକଣା',
    },
    'xdceeeel': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    'z2e15hop': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    'u8br600n': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    '0aw7avrq': {
      'en': 'Languages',
      'or': 'ଭାଷାଗୁଡ଼ିକ',
    },
    'kqqikh0n': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    'n4001rp1': {
      'en': 'Change',
      'or': 'ପରିବର୍ତ୍ତନ କରନ୍ତୁ',
    },
    '4gyaueg1': {
      'en': 'App appearance',
      'or': 'ଆପ୍‌ର ଦୃଶ୍ୟମାନତା',
    },
    'hvhnxpve': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'mfhkxxnu': {
      'en': 'Light mode',
      'or': 'ଲାଇଟ୍ ମୋଡ୍',
    },
    '1ryqhtei': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'ihaqdsy5': {
      'en': 'System preference',
      'or': 'ସିଷ୍ଟମର ପସନ୍ଦ',
    },
    'tnms8v0l': {
      'en': 'Help and Support',
      'or': 'ସାହାଯ୍ୟ ଏବଂ ସମର୍ଥନ',
    },
    '1ms6zis4': {
      'en': 'Looking for info about us?',
      'or': 'ଆମ ବିଷୟରେ ସୂଚନା ଚାହୁଁଛନ୍ତି କି?',
    },
    'jdo8wlwj': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'shij3dyn': {
      'en': 'Tips on how to use Pandora?',
      'or': 'ପାଣ୍ଡୋରା ବ୍ୟବହାର କରିବା ପାଇଁ ଟିପ୍ସ?',
    },
    '11gigbpq': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'zvihzfke': {
      'en': 'Need something else?',
      'or': 'ଆଉ କିଛି ଦରକାର କି?',
    },
    '6yi47mqe': {
      'en': 'Contact support',
      'or': 'ସହାୟତା ପାଇଁ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    'rcbmwi9m': {
      'en': 'FAQs',
      'or': 'ସାଧାରଣ ପ୍ରଶ୍ନ',
    },
    'vk0laoj4': {
      'en': '© 2025 Directorate of Industries, Odisha. All rights reserved.',
      'or': '© ୨୦୨୫ ଶିଳ୍ପ ନିର୍ଦ୍ଦେଶାଳୟ, ଓଡ଼ିଶା। ସର୍ବସତ୍ତ୍ୱ ସଂରକ୍ଷିତ।',
    },
    'et682hbz': {
      'en': 'Design & Developed by Qwegle, Odisha State Centre.',
      'or': 'ଡିଜାଇନ୍ ଏବଂ ବିକଶିତ କ୍ୱେଗଲ୍, ଓଡ଼ିଶା ରାଜ୍ୟ କେନ୍ଦ୍ର ଦ୍ୱାରା।',
    },
    'u6vg4n39': {
      'en': 'Design & Developed by Qwegle, Odisha State Centre.',
      'or': 'ଡିଜାଇନ୍ ଏବଂ ବିକଶିତ କ୍ୱେଗଲ୍, ଓଡ଼ିଶା ରାଜ୍ୟ କେନ୍ଦ୍ର ଦ୍ୱାରା।',
    },
    'vz1nl89o': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // Member
  {
    '3tpmxtys': {
      'en': 'Dashboard',
      'or': 'ଡ୍ୟାସବୋର୍ଡ',
    },
    'ctq7k9n3': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'hqfunlkn': {
      'en': 'A-',
      'or': 'କ-',
    },
    '58s7hewi': {
      'en': 'A',
      'or': 'କ',
    },
    'z87hu6lg': {
      'en': 'A+',
      'or': 'କ+',
    },
    'xrm1v0c9': {
      'en': 'Language',
      'or': 'ଭାଷା',
    },
    'twiueddc': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'txi336t9': {
      'en': 'Oriya',
      'or': 'ଓଡ଼ିଆ',
    },
    'sxcn7k1d': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    'f2khdn7x': {
      'en': 'OKVI',
      'or': 'ଓକେଭିଆଇ',
    },
    '1of7qhmk': {
      'en': 'admin@gmail.com',
      'or': 'ଆଡମିନ୍@gmail.com',
    },
    '831q0wb9': {
      'en': 'Card Header',
      'or': 'କାର୍ଡ ହେଡର୍',
    },
    'b511qbyk': {
      'en': 'Create tables and ui elements that work below.',
      'or': 'ତଳେ କାମ କରୁଥିବା ସାରଣୀ ଏବଂ ui ଉପାଦାନଗୁଡ଼ିକ ତିଆରି କରନ୍ତୁ।',
    },
    'bn2lbnjx': {
      'en': 'Add New',
      'or': 'ନୂତନ ଯୋଡନ୍ତୁ',
    },
    '3i8hv1qi': {
      'en': 'Work Type',
      'or': 'କାର୍ଯ୍ୟ ପ୍ରକାର',
    },
    'tbxmgvk4': {
      'en': 'Assigned User',
      'or': 'ନିଯୁକ୍ତ ଉପଯୋଗକର୍ତ୍ତା',
    },
    'xz8hdllw': {
      'en': 'Contract Amount',
      'or': 'ଚୁକ୍ତି ପରିମାଣ',
    },
    'qzwdfkf0': {
      'en': 'Status',
      'or': 'ସ୍ଥିତି',
    },
    'dhvhhikz': {
      'en': 'Actions',
      'or': 'କାର୍ଯ୍ୟ',
    },
    'pzb9ssa9': {
      'en': 'Design Work',
      'or': 'ଡିଜାଇନ୍ କାର୍ଯ୍ୟ',
    },
    'osw1yy78': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    'qh4m0g6v': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    'ak3t69cs': {
      'en': '\$2,100',
      'or': '\$୨,୧୦୦',
    },
    's1mjgp7c': {
      'en': 'Paid',
      'or': 'ଦେୟ ଦିଆଯାଇଛି',
    },
    '6js4rup7': {
      'en': 'Design Work',
      'or': 'ଡିଜାଇନ୍ କାର୍ଯ୍ୟ',
    },
    'v3958mgt': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    'o34elhvz': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    '1dypgr2i': {
      'en': '\$2,100',
      'or': '\$୨,୧୦୦',
    },
    'kk3x5za7': {
      'en': 'Paid',
      'or': 'ଦେୟ ଦିଆଯାଇଛି',
    },
    'ctkxrkm8': {
      'en': 'Design Work',
      'or': 'ଡିଜାଇନ୍ କାର୍ଯ୍ୟ',
    },
    'deitsxo5': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    'qv3jrl2z': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    'zqzzhghn': {
      'en': '\$2,100',
      'or': '\$୨,୧୦୦',
    },
    's931vzw6': {
      'en': 'Paid',
      'or': 'ଦେୟ ଦିଆଯାଇଛି',
    },
    '41sqc89i': {
      'en': 'Design Work',
      'or': 'ଡିଜାଇନ୍ କାର୍ଯ୍ୟ',
    },
    'pjfq9cwp': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    'fzo7lc0m': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    'iwo2ior9': {
      'en': '\$2,100',
      'or': '\$୨,୧୦୦',
    },
    'o1dtlq4x': {
      'en': 'Paid',
      'or': 'ଦେୟ ଦିଆଯାଇଛି',
    },
    '1gg8rsj9': {
      'en': 'Design Work',
      'or': 'ଡିଜାଇନ୍ କାର୍ଯ୍ୟ',
    },
    '8z7ec140': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    'lgxbojuo': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    '3nrgcr27': {
      'en': '\$2,100',
      'or': '\$୨,୧୦୦',
    },
    '5k0ssgjg': {
      'en': 'Pending',
      'or': 'ବିଚାରାଧୀନ ଅଛି',
    },
    'zsyrblgj': {
      'en': 'Design Work',
      'or': 'ଡିଜାଇନ୍ କାର୍ଯ୍ୟ',
    },
    'vanoo0kl': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    'ssp089fn': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    'p1c1uj82': {
      'en': '\$2,100',
      'or': '\$୨,୧୦୦',
    },
    'gpyzfb78': {
      'en': 'Pending',
      'or': 'ବିଚାରାଧୀନ ଅଛି',
    },
    'l4ed3mtk': {
      'en': 'Design Work',
      'or': 'ଡିଜାଇନ୍ କାର୍ଯ୍ୟ',
    },
    'b76147ve': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    'ggt8af2o': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    'gu0dw0w9': {
      'en': '\$2,100',
      'or': '\$୨,୧୦୦',
    },
    'voooieo4': {
      'en': 'Pending',
      'or': 'ବିଚାରାଧୀନ ଅଛି',
    },
    'i9ihl0mg': {
      'en': 'Pending Application ',
      'or': 'ବିଚାରାଧୀନ ଆବେଦନ',
    },
    'xqx96oit': {
      'en': '567,402',
      'or': '୫୬୭,୪୦୨',
    },
    'e35cj3rx': {
      'en': 'Approved Application',
      'or': 'ଅନୁମୋଦିତ ଆବେଦନ',
    },
    'cs1dl5ok': {
      'en': '2,208',
      'or': '୨,୨୦୮',
    },
    'r0f8z2dh': {
      'en': 'Pending No Due Certificate ',
      'or': 'ବାକି ଥିବା କୌଣସି ଦେୟ ପ୍ରମାଣପତ୍ର ନାହିଁ',
    },
    'ggzbv3n9': {
      'en': '567,402',
      'or': '୫୬୭,୪୦୨',
    },
    'vlb284tf': {
      'en': 'Approved No Due Certificate',
      'or': 'ଅନୁମୋଦିତ କୌଣସି ଦେୟ ନାହିଁ ପ୍ରମାଣପତ୍ର',
    },
    '02qr4fw2': {
      'en': '2,208',
      'or': '୨,୨୦୮',
    },
    'gson5tdj': {
      'en': 'Application Status',
      'or': 'ଆବେଦନ ସ୍ଥିତି',
    },
    'vby1hibb': {
      'en': 'No Due Certificate Status',
      'or': 'କୌଣସି ବାକି ସାର୍ଟିଫିକେଟ୍ ସ୍ଥିତି ନାହିଁ',
    },
    '13hyg7cz': {
      'en': 'Approved',
      'or': 'ଅନୁମୋଦିତ ହୋଇଛି',
    },
    'fig74f3v': {
      'en': 'Pending',
      'or': 'ବିଚାରାଧୀନ ଅଛି',
    },
    'wzq1ua0m': {
      'en': 'Rejected',
      'or': 'ପ୍ରତ୍ୟାଖ୍ୟାନ କରାଗଲା',
    },
    'hswgiyq1': {
      'en': 'Approved',
      'or': 'ଅନୁମୋଦିତ ହୋଇଛି',
    },
    '4galkm6z': {
      'en': 'Pending',
      'or': 'ବିଚାରାଧୀନ ଅଛି',
    },
    '1tnui0xa': {
      'en': 'Rejected',
      'or': 'ପ୍ରତ୍ୟାଖ୍ୟାନ କରାଗଲା',
    },
    'rc1broyg': {
      'en': 'You’ve almost reached your limit',
      'or': 'ଆପଣ ପ୍ରାୟ ଆପଣଙ୍କ ସୀମାରେ ପହଞ୍ଚି ଯାଇଛନ୍ତି',
    },
    'fmtxgl6n': {
      'en':
          'You have used 80% of your available requests. Upgrade plan to make more network requests.',
      'or':
          'ଆପଣ ଆପଣଙ୍କର ଉପଲବ୍ଧ ଅନୁରୋଧଗୁଡ଼ିକର 80% ବ୍ୟବହାର କରିସାରିଛନ୍ତି। ଅଧିକ ନେଟୱାର୍କ ଅନୁରୋଧ କରିବା ପାଇଁ ଯୋଜନାକୁ ଅପଗ୍ରେଡ୍ କରନ୍ତୁ।',
    },
    'b7lty945': {
      'en': 'Status',
      'or': 'ସ୍ଥିତି',
    },
    'k4z0rsgr': {
      'en': 'Select...',
      'or': 'ଚୟନ କରନ୍ତୁ...',
    },
    'h8r52vhk': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'oqsl4g3n': {
      'en': 'Select',
      'or': 'ଚୟନ କରନ୍ତୁ',
    },
    '76pj2bd7': {
      'en': 'Application',
      'or': 'ପ୍ରୟୋଗ',
    },
    'eo8gys63': {
      'en': 'Certificate',
      'or': 'ସାର୍ଟିଫିକେଟ୍',
    },
    'g1dr8z68': {
      'en': 'Search.....',
      'or': 'ଖୋଜନ୍ତୁ.....',
    },
    'p01exd6z': {
      'en': 'Loan Number',
      'or': 'ଋଣ ନମ୍ବର',
    },
    'iauxsnc9': {
      'en': 'User Name',
      'or': 'ଉପଯୋଗକର୍ତ୍ତା ନାମ',
    },
    'vb5hl4l8': {
      'en': 'Loan Amount',
      'or': 'ଋଣ ରାଶି',
    },
    '18v3dhs8': {
      'en': '5498*****',
      'or': '୫୪୯୮*****',
    },
    'pjwm53zi': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    'tpa87zpi': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    'j5m40y18': {
      'en': '₹2,10,567',
      'or': '₹୨,୧୦,୫୬୭',
    },
    '1cjtjnpy': {
      'en': 'Status',
      'or': 'ସ୍ଥିତି',
    },
    'o5sl852u': {
      'en': 'Approved',
      'or': 'ଅନୁମୋଦିତ ହୋଇଛି',
    },
    'ry5pt5hq': {
      'en': 'Actions',
      'or': 'କାର୍ଯ୍ୟ',
    },
    's2umljyw': {
      'en': 'View',
      'or': 'ଦର୍ଶନ',
    },
    'xevqj3nn': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    'n91xd360': {
      'en': '1',
      'or': '୧',
    },
    'igdiy4x6': {
      'en': 'General Settings',
      'or': 'ସାଧାରଣ ସେଟିଂ',
    },
    '65s6ezrt': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    'er6b4jw3': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    'ghfbbbo8': {
      'en': 'Edit',
      'or': 'ସମ୍ପାଦନ କରନ୍ତୁ',
    },
    'fs3q6dta': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    'p0bw4285': {
      'en': 'Amos',
      'or': 'ଆମୋଷ',
    },
    '5hq2w08v': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    '170bt70i': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    'a6qw7tl9': {
      'en': 'Email address',
      'or': 'ଇମେଲ ଠିକଣା',
    },
    'ed1zz7r8': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    'g6ba1z6n': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    'm8u02lex': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    'rvsd5oi4': {
      'en': 'Languages',
      'or': 'ଭାଷାଗୁଡ଼ିକ',
    },
    'axebutc5': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    'bkbg3k0g': {
      'en': 'Change',
      'or': 'ପରିବର୍ତ୍ତନ କରନ୍ତୁ',
    },
    'tzsjtrb4': {
      'en': 'App appearance',
      'or': 'ଆପ୍‌ର ଦୃଶ୍ୟମାନତା',
    },
    '5avj7aq1': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    't4npnnx9': {
      'en': 'Light mode',
      'or': 'ଲାଇଟ୍ ମୋଡ୍',
    },
    'u8k893z8': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'wc88ljih': {
      'en': 'System preference',
      'or': 'ସିଷ୍ଟମର ପସନ୍ଦ',
    },
    '7w84j8zo': {
      'en': 'Help and Support',
      'or': 'ସାହାଯ୍ୟ ଏବଂ ସମର୍ଥନ',
    },
    'e98dmpy7': {
      'en': 'Looking for info about us?',
      'or': 'ଆମ ବିଷୟରେ ସୂଚନା ଚାହୁଁଛନ୍ତି କି?',
    },
    '73uyl792': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'kokryonu': {
      'en': 'Tips on how to use Pandora?',
      'or': 'ପାଣ୍ଡୋରା ବ୍ୟବହାର କରିବା ପାଇଁ ଟିପ୍ସ?',
    },
    '1braml54': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'hty50th5': {
      'en': 'Need something else?',
      'or': 'ଆଉ କିଛି ଦରକାର କି?',
    },
    'c38t1rj9': {
      'en': 'Contact support',
      'or': 'ସହାୟତା ପାଇଁ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    'ryjv6rg8': {
      'en': 'FAQs',
      'or': 'ସାଧାରଣ ପ୍ରଶ୍ନ',
    },
    'agear0nb': {
      'en': '© 2025 Directorate of Industries, Odisha. All rights reserved.',
      'or': '© ୨୦୨୫ ଶିଳ୍ପ ନିର୍ଦ୍ଦେଶାଳୟ, ଓଡ଼ିଶା। ସର୍ବସତ୍ତ୍ୱ ସଂରକ୍ଷିତ।',
    },
    'opmiyn3f': {
      'en': 'Design & Developed by Qwegle, Odisha State Centre.',
      'or': 'ଡିଜାଇନ୍ ଏବଂ ବିକଶିତ କ୍ୱେଗଲ୍, ଓଡ଼ିଶା ରାଜ୍ୟ କେନ୍ଦ୍ର ଦ୍ୱାରା।',
    },
    'lzpbpz5s': {
      'en': 'Design & Developed by Qwegle, Odisha State Centre.',
      'or': 'ଡିଜାଇନ୍ ଏବଂ ବିକଶିତ କ୍ୱେଗଲ୍, ଓଡ଼ିଶା ରାଜ୍ୟ କେନ୍ଦ୍ର ଦ୍ୱାରା।',
    },
    'ali50xa3': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // ClosingStockList
  {
    '7fwe1da4': {
      'en': 'Closing Stock List',
      'or': 'ଶେଷ ଷ୍ଟକ୍ ତାଲିକା',
    },
    'hpowuva1': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'wrhxbfz6': {
      'en': 'A-',
      'or': 'କ-',
    },
    'g0iwsf6a': {
      'en': 'A',
      'or': 'କ',
    },
    'o91hocx5': {
      'en': 'A+',
      'or': 'କ+',
    },
    'nl9rqf35': {
      'en': 'Language',
      'or': 'ଭାଷା',
    },
    'iq60dnhy': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'amssdlbe': {
      'en': 'Oriya',
      'or': 'ଓଡ଼ିଆ',
    },
    'yazh771p': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    '2xhpjmxg': {
      'en': 'OKVI',
      'or': 'ଓକେଭିଆଇ',
    },
    'e1kfeof8': {
      'en': 'admin@gmail.com',
      'or': 'ଆଡମିନ୍@gmail.com',
    },
    't6tbhrhq': {
      'en': 'Detail List',
      'or': 'ବିବରଣୀ ତାଲିକା',
    },
    'qyonm7yv': {
      'en': 'Select Festive Name',
      'or': 'ଉତ୍ସବର ନାମ ଚୟନ କରନ୍ତୁ',
    },
    'emn7y10v': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    '1p4jkv1n': {
      'en': '0',
      'or': '0',
    },
    'ukd58omn': {
      'en': '1',
      'or': '୧',
    },
    'gs1un9f7': {
      'en': 'Select Financial Year',
      'or': 'ଆର୍ଥିକ ବର୍ଷ ଚୟନ କରନ୍ତୁ',
    },
    'kloe2lq2': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'r7qspgia': {
      'en': '0',
      'or': '0',
    },
    'rcxi81kk': {
      'en': '1',
      'or': '୧',
    },
    'djzkjikx': {
      'en': 'Clear Filter',
      'or': 'ଫିଲ୍ଟର୍ ଖାଲି କରନ୍ତୁ',
    },
    'lnijmspv': {
      'en': 'Sl. No',
      'or': 'କ୍ରମିକ ନାଁ',
    },
    's5wsoj45': {
      'en': 'Financial Year',
      'or': 'ଆର୍ଥିକ ବର୍ଷ',
    },
    'cnniazea': {
      'en': 'Festive Name',
      'or': 'ଉତ୍ସବର ନାମ',
    },
    'fr5km8yp': {
      'en': 'Spell Start Date',
      'or': 'ବନାନ ଆରମ୍ଭ ତାରିଖ',
    },
    '38hd0h9n': {
      'en': 'Spell End Date',
      'or': 'ବନାନ ଶେଷ ତାରିଖ',
    },
    'qjuedd0z': {
      'en': 'Actions',
      'or': 'କାର୍ଯ୍ୟ',
    },
    'el8vvw0x': {
      'en': '1',
      'or': '୧',
    },
    'jleogy3h': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'howaumh6': {
      'en': 'Tapan Mohanty',
      'or': 'ତପନ ମହାନ୍ତି',
    },
    'nto3njky': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'fcjiqwj9': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    '1e18pmrj': {
      'en': 'View',
      'or': 'ଦର୍ଶନ',
    },
    'd9v14r6e': {
      'en': '2',
      'or': '୨',
    },
    '2utdp2ch': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    '1bbt5i4j': {
      'en': 'Chittaranjan Panda',
      'or': 'ଚିତ୍ତରଞ୍ଜନ ପଣ୍ଡା',
    },
    'ixwf9frs': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    '4oj65njw': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'gwmfoi2z': {
      'en': 'View',
      'or': 'ଦର୍ଶନ',
    },
    'yfiwfjqz': {
      'en': '3',
      'or': '3',
    },
    'caw37ymp': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    '3cpql42d': {
      'en': 'Ajay Kumar Mohapatra',
      'or': 'ଅଜୟ କୁମାର ମହାପାତ୍ର',
    },
    'c3xwjns8': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'wloyqefy': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    '0bse1iy3': {
      'en': 'View',
      'or': 'ଦର୍ଶନ',
    },
    'x9edhhxe': {
      'en': '4',
      'or': '୪',
    },
    'f96eqr3f': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'yn2gh6ii': {
      'en': 'Tapas Sahu',
      'or': 'ତାପସ ସାହୁ',
    },
    'jv1gjf1u': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    '3g9557zk': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    '4j0m951c': {
      'en': 'View',
      'or': 'ଦର୍ଶନ',
    },
    'm3n2cvkv': {
      'en': '5',
      'or': '5',
    },
    'n3rgtd2m': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'pitm9jdv': {
      'en': 'Rajkishore Das',
      'or': 'ରାଜକିଶୋର ଦାସ',
    },
    'wlsx74bu': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    '7mjb8jp7': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'my0h5vdl': {
      'en': 'View',
      'or': 'ଦର୍ଶନ',
    },
    '09k9zcgf': {
      'en': '6',
      'or': '6',
    },
    'kxm1coul': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    '96eu4h4a': {
      'en': 'Rajkishore Das',
      'or': 'ରାଜକିଶୋର ଦାସ',
    },
    'phdtot8s': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'gg5deh4d': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'avl5nqca': {
      'en': 'View',
      'or': 'ଦର୍ଶନ',
    },
    'jl0okdwh': {
      'en': '7',
      'or': '7',
    },
    'oe7x97lp': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'fo2x24di': {
      'en': 'Rajkishore Das',
      'or': 'ରାଜକିଶୋର ଦାସ',
    },
    '4kajz6ka': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'v0tn3nu3': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'j2m91paz': {
      'en': 'View',
      'or': 'ଦର୍ଶନ',
    },
    '8cd6i9nl': {
      'en': 'Card Header',
      'or': 'କାର୍ଡ ହେଡର୍',
    },
    'znb02tw8': {
      'en': 'Create tables and ui elements that work below.',
      'or': 'ତଳେ କାମ କରୁଥିବା ସାରଣୀ ଏବଂ ui ଉପାଦାନଗୁଡ଼ିକ ତିଆରି କରନ୍ତୁ।',
    },
    'u5gb93r9': {
      'en': 'Add New',
      'or': 'ନୂତନ ଯୋଡନ୍ତୁ',
    },
    'n5yxofew': {
      'en': 'Work Type',
      'or': 'କାର୍ଯ୍ୟ ପ୍ରକାର',
    },
    'vv5nal0v': {
      'en': 'Assigned User',
      'or': 'ନିଯୁକ୍ତ ଉପଯୋଗକର୍ତ୍ତା',
    },
    '6b2m3skc': {
      'en': 'Contract Amount',
      'or': 'ଚୁକ୍ତି ପରିମାଣ',
    },
    'mzyyjmmp': {
      'en': 'Status',
      'or': 'ସ୍ଥିତି',
    },
    'dg1qv3t9': {
      'en': 'Actions',
      'or': 'କାର୍ଯ୍ୟ',
    },
    'sl244cf5': {
      'en': 'Design Work',
      'or': 'ଡିଜାଇନ୍ କାର୍ଯ୍ୟ',
    },
    'hszvgtha': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    's8ufkp8j': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    'x9twssu1': {
      'en': '\$2,100',
      'or': '\$୨,୧୦୦',
    },
    'dkqvd4h1': {
      'en': 'Paid',
      'or': 'ଦେୟ ଦିଆଯାଇଛି',
    },
    '3nnod8qz': {
      'en': 'Design Work',
      'or': 'ଡିଜାଇନ୍ କାର୍ଯ୍ୟ',
    },
    'k875nzz6': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    'di5414oz': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    'bqlh0lm2': {
      'en': '\$2,100',
      'or': '\$୨,୧୦୦',
    },
    'g5za15sa': {
      'en': 'Paid',
      'or': 'ଦେୟ ଦିଆଯାଇଛି',
    },
    'ekmefmzg': {
      'en': 'Design Work',
      'or': 'ଡିଜାଇନ୍ କାର୍ଯ୍ୟ',
    },
    'mvm0dxca': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    'u6n0zven': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    '5dc98x2f': {
      'en': '\$2,100',
      'or': '\$୨,୧୦୦',
    },
    'rsq5h9kn': {
      'en': 'Paid',
      'or': 'ଦେୟ ଦିଆଯାଇଛି',
    },
    'gzg1mab6': {
      'en': 'Design Work',
      'or': 'ଡିଜାଇନ୍ କାର୍ଯ୍ୟ',
    },
    '1zqa4ntr': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    'w05gals9': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    'y7bwicnj': {
      'en': '\$2,100',
      'or': '\$୨,୧୦୦',
    },
    'jslt91tp': {
      'en': 'Paid',
      'or': 'ଦେୟ ଦିଆଯାଇଛି',
    },
    '1g09vs31': {
      'en': 'Design Work',
      'or': 'ଡିଜାଇନ୍ କାର୍ଯ୍ୟ',
    },
    'nur2pp24': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    '2on02h5o': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    'bv0qgndj': {
      'en': '\$2,100',
      'or': '\$୨,୧୦୦',
    },
    'bkxm2a7c': {
      'en': 'Pending',
      'or': 'ବିଚାରାଧୀନ ଅଛି',
    },
    '5rb7oxnz': {
      'en': 'Design Work',
      'or': 'ଡିଜାଇନ୍ କାର୍ଯ୍ୟ',
    },
    '02kb5m7y': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    'vla9dj1y': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    'lxg5z8r0': {
      'en': '\$2,100',
      'or': '\$୨,୧୦୦',
    },
    'oul9e9uy': {
      'en': 'Pending',
      'or': 'ବିଚାରାଧୀନ ଅଛି',
    },
    've1125jy': {
      'en': 'Design Work',
      'or': 'ଡିଜାଇନ୍ କାର୍ଯ୍ୟ',
    },
    't34zxgut': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    '1uqkse5u': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    'lzsooygs': {
      'en': '\$2,100',
      'or': '\$୨,୧୦୦',
    },
    'sza1t87w': {
      'en': 'Pending',
      'or': 'ବିଚାରାଧୀନ ଅଛି',
    },
    '1anw60fv': {
      'en': 'Search',
      'or': 'ଖୋଜନ୍ତୁ',
    },
    '330dprra': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    'ucc4vhzr': {
      'en': 'Financial Year',
      'or': 'ଆର୍ଥିକ ବର୍ଷ',
    },
    'aockri98': {
      'en': 'Select...',
      'or': 'ଚୟନ କରନ୍ତୁ...',
    },
    '7jpymwfw': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'odtj8l86': {
      'en': '0',
      'or': '0',
    },
    '5o0mfqph': {
      'en': '1',
      'or': '୧',
    },
    'lsao2yzv': {
      'en': 'Festive Name',
      'or': 'ଉତ୍ସବର ନାମ',
    },
    'avh95ceq': {
      'en': 'Select...',
      'or': 'ଚୟନ କରନ୍ତୁ...',
    },
    'bom5znyf': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'fj8vyc52': {
      'en': '0',
      'or': '0',
    },
    'h4t1mbqs': {
      'en': '1',
      'or': '୧',
    },
    'gsk1hqze': {
      'en': 'Search',
      'or': 'ଖୋଜନ୍ତୁ',
    },
    '8bafpn4r': {
      'en': 'Cancel',
      'or': 'ବାତିଲ କରନ୍ତୁ',
    },
    'sotb8z2q': {
      'en': 'Detail List',
      'or': 'ବିବରଣୀ ତାଲିକା',
    },
    'gs3j1g0d': {
      'en': 'Select Festive Name',
      'or': 'ଉତ୍ସବର ନାମ ଚୟନ କରନ୍ତୁ',
    },
    'yco9cr2n': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'n6gu6cb3': {
      'en': '0',
      'or': '0',
    },
    'ke1a89es': {
      'en': '1',
      'or': '୧',
    },
    'wwmixiga': {
      'en': 'Select Financial Year',
      'or': 'ଆର୍ଥିକ ବର୍ଷ ଚୟନ କରନ୍ତୁ',
    },
    'cnkui6mz': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    '58k2w7l3': {
      'en': '0',
      'or': '0',
    },
    'ho8s739u': {
      'en': '1',
      'or': '୧',
    },
    'sif2al7c': {
      'en': 'Clear Filter',
      'or': 'ଫିଲ୍ଟର୍ ଖାଲି କରନ୍ତୁ',
    },
    'qcdmr139': {
      'en': 'Sl. No',
      'or': 'କ୍ରମିକ ନାଁ',
    },
    '6gl3f4sm': {
      'en': 'Financial Year',
      'or': 'ଆର୍ଥିକ ବର୍ଷ',
    },
    '6325bnh1': {
      'en': 'Festive Name',
      'or': 'ଉତ୍ସବର ନାମ',
    },
    '3cyevofk': {
      'en': '1',
      'or': '୧',
    },
    'qvdmpyy1': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'bh5j48s0': {
      'en': 'Randy Peterson ',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    '4a1x1dpm': {
      'en': 'Spell Start Date',
      'or': 'ବନାନ ଆରମ୍ଭ ତାରିଖ',
    },
    'c0ewett4': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'bofbv8an': {
      'en': 'Spell End Date',
      'or': 'ବନାନ ଶେଷ ତାରିଖ',
    },
    'y0wdme29': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'u8dcx2yf': {
      'en': 'View Details',
      'or': 'ବିବରଣୀ ଦେଖନ୍ତୁ',
    },
    '8g3mpk6r': {
      'en': 'View',
      'or': 'ଦର୍ଶନ',
    },
    '4l2u937d': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    'xqycgt1h': {
      'en': '1',
      'or': '୧',
    },
    '02aij1uk': {
      'en': 'General Settings',
      'or': 'ସାଧାରଣ ସେଟିଂ',
    },
    '07zr7yvo': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    'o9fsjoai': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    'izthwv4t': {
      'en': 'Edit',
      'or': 'ସମ୍ପାଦନ କରନ୍ତୁ',
    },
    'z87fgd1h': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    'jtpuy0r2': {
      'en': 'Amos',
      'or': 'ଆମୋଷ',
    },
    'di2ib0rz': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    '4tuvoh6e': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    'o7mwivie': {
      'en': 'Email address',
      'or': 'ଇମେଲ ଠିକଣା',
    },
    'lhag1sd5': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    '5tzgi85x': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    'i6qqga4a': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    't9gtmoc8': {
      'en': 'Languages',
      'or': 'ଭାଷାଗୁଡ଼ିକ',
    },
    'yzx7cxqk': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    'ft0h1bgg': {
      'en': 'Change',
      'or': 'ପରିବର୍ତ୍ତନ କରନ୍ତୁ',
    },
    'slt2mmlk': {
      'en': 'App appearance',
      'or': 'ଆପ୍‌ର ଦୃଶ୍ୟମାନତା',
    },
    'cgewqd98': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    '8na68mwl': {
      'en': 'Light mode',
      'or': 'ଲାଇଟ୍ ମୋଡ୍',
    },
    'g618ezie': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'xtpxyw9a': {
      'en': 'System preference',
      'or': 'ସିଷ୍ଟମର ପସନ୍ଦ',
    },
    'nj3ushlu': {
      'en': 'Help and Support',
      'or': 'ସାହାଯ୍ୟ ଏବଂ ସମର୍ଥନ',
    },
    '17libqtg': {
      'en': 'Looking for info about us?',
      'or': 'ଆମ ବିଷୟରେ ସୂଚନା ଚାହୁଁଛନ୍ତି କି?',
    },
    'y4do30bm': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'x4x01fth': {
      'en': 'Tips on how to use Pandora?',
      'or': 'ପାଣ୍ଡୋରା ବ୍ୟବହାର କରିବା ପାଇଁ ଟିପ୍ସ?',
    },
    'craftt8f': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    '269v5wo6': {
      'en': 'Need something else?',
      'or': 'ଆଉ କିଛି ଦରକାର କି?',
    },
    '8vxhob49': {
      'en': 'Contact support',
      'or': 'ସହାୟତା ପାଇଁ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    '40j02k3l': {
      'en': 'FAQs',
      'or': 'ସାଧାରଣ ପ୍ରଶ୍ନ',
    },
    'fidc7f1e': {
      'en': '© 2025 Directorate of Industries, Odisha. All rights reserved.',
      'or': '© ୨୦୨୫ ଶିଳ୍ପ ନିର୍ଦ୍ଦେଶାଳୟ, ଓଡ଼ିଶା। ସର୍ବସତ୍ତ୍ୱ ସଂରକ୍ଷିତ।',
    },
    'jti4m0ds': {
      'en': 'Design & Developed by Qwegle, Odisha State Centre.',
      'or': 'ଡିଜାଇନ୍ ଏବଂ ବିକଶିତ କ୍ୱେଗଲ୍, ଓଡ଼ିଶା ରାଜ୍ୟ କେନ୍ଦ୍ର ଦ୍ୱାରା।',
    },
    'khfstdi7': {
      'en': 'Design & Developed by Qwegle, Odisha State Centre.',
      'or': 'ଡିଜାଇନ୍ ଏବଂ ବିକଶିତ କ୍ୱେଗଲ୍, ଓଡ଼ିଶା ରାଜ୍ୟ କେନ୍ଦ୍ର ଦ୍ୱାରା।',
    },
    'kjrqy99l': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // Documents
  {
    'pasw5y9b': {
      'en': 'Claim Documents',
      'or': 'ଦାବି ଡକ୍ୟୁମେଣ୍ଟଗୁଡ଼ିକ',
    },
    'd24rsypd': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    '5vry2f9o': {
      'en': 'A-',
      'or': 'କ-',
    },
    'fuydywwt': {
      'en': 'A',
      'or': 'କ',
    },
    'tip057of': {
      'en': 'A+',
      'or': 'କ+',
    },
    'yed4zh7r': {
      'en': 'Language',
      'or': 'ଭାଷା',
    },
    'pp7xe37t': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'u2l4sm6l': {
      'en': 'Oriya',
      'or': 'ଓଡ଼ିଆ',
    },
    'eqp1p5ei': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    '06dafdv4': {
      'en': 'OKVI',
      'or': 'ଓକେଭିଆଇ',
    },
    'dxcw47ew': {
      'en': 'admin@gmail.com',
      'or': 'ଆଡମିନ୍@gmail.com',
    },
    '074gx2te': {
      'en': 'Card Header',
      'or': 'କାର୍ଡ ହେଡର୍',
    },
    'ocugwkxn': {
      'en': 'Create tables and ui elements that work below.',
      'or': 'ତଳେ କାମ କରୁଥିବା ସାରଣୀ ଏବଂ ui ଉପାଦାନଗୁଡ଼ିକ ତିଆରି କରନ୍ତୁ।',
    },
    'fwmuamrw': {
      'en': 'Add New',
      'or': 'ନୂତନ ଯୋଡନ୍ତୁ',
    },
    'aiezd2rt': {
      'en': 'Work Type',
      'or': 'କାର୍ଯ୍ୟ ପ୍ରକାର',
    },
    'vhfely0i': {
      'en': 'Assigned User',
      'or': 'ନିଯୁକ୍ତ ଉପଯୋଗକର୍ତ୍ତା',
    },
    '8npqr2j1': {
      'en': 'Contract Amount',
      'or': 'ଚୁକ୍ତି ପରିମାଣ',
    },
    'k1kv0n5r': {
      'en': 'Status',
      'or': 'ସ୍ଥିତି',
    },
    'sa1viy13': {
      'en': 'Actions',
      'or': 'କାର୍ଯ୍ୟ',
    },
    'hxnieqnm': {
      'en': 'Design Work',
      'or': 'ଡିଜାଇନ୍ କାର୍ଯ୍ୟ',
    },
    '2m9m9iwk': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    'ea27836f': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    'wkc8v6gq': {
      'en': '\$2,100',
      'or': '\$୨,୧୦୦',
    },
    'wni8bk84': {
      'en': 'Paid',
      'or': 'ଦେୟ ଦିଆଯାଇଛି',
    },
    'wf737msb': {
      'en': 'Design Work',
      'or': 'ଡିଜାଇନ୍ କାର୍ଯ୍ୟ',
    },
    'c55fzk64': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    'udoafarf': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    '4sgs5gdc': {
      'en': '\$2,100',
      'or': '\$୨,୧୦୦',
    },
    'zrhsnkxa': {
      'en': 'Paid',
      'or': 'ଦେୟ ଦିଆଯାଇଛି',
    },
    'g3frqiqu': {
      'en': 'Design Work',
      'or': 'ଡିଜାଇନ୍ କାର୍ଯ୍ୟ',
    },
    '7zoz2qm8': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    'qba1issw': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    'yt4jmj4h': {
      'en': '\$2,100',
      'or': '\$୨,୧୦୦',
    },
    'je9qkj0r': {
      'en': 'Paid',
      'or': 'ଦେୟ ଦିଆଯାଇଛି',
    },
    '0igo2i3j': {
      'en': 'Design Work',
      'or': 'ଡିଜାଇନ୍ କାର୍ଯ୍ୟ',
    },
    'warbg9h2': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    'sk0v6zky': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    '85qwz7tc': {
      'en': '\$2,100',
      'or': '\$୨,୧୦୦',
    },
    'uf1k613u': {
      'en': 'Paid',
      'or': 'ଦେୟ ଦିଆଯାଇଛି',
    },
    'tzpfd0mu': {
      'en': 'Design Work',
      'or': 'ଡିଜାଇନ୍ କାର୍ଯ୍ୟ',
    },
    '7hfzy2xy': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    'aa8o0ogh': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    'b5dcjo63': {
      'en': '\$2,100',
      'or': '\$୨,୧୦୦',
    },
    'l46lsxzl': {
      'en': 'Pending',
      'or': 'ବିଚାରାଧୀନ ଅଛି',
    },
    '3wt6dnc1': {
      'en': 'Design Work',
      'or': 'ଡିଜାଇନ୍ କାର୍ଯ୍ୟ',
    },
    '0r19myvc': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    'oqu38zm8': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    'fhsnee10': {
      'en': '\$2,100',
      'or': '\$୨,୧୦୦',
    },
    'b90j76ul': {
      'en': 'Pending',
      'or': 'ବିଚାରାଧୀନ ଅଛି',
    },
    'lm89mqja': {
      'en': 'Design Work',
      'or': 'ଡିଜାଇନ୍ କାର୍ଯ୍ୟ',
    },
    '3kfz83y9': {
      'en': 'Randy Peterson',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    '4mof57sz': {
      'en': 'Business Name',
      'or': 'ବ୍ୟବସାୟର ନାମ',
    },
    'h22irv08': {
      'en': '\$2,100',
      'or': '\$୨,୧୦୦',
    },
    'f56ngq7f': {
      'en': 'Pending',
      'or': 'ବିଚାରାଧୀନ ଅଛି',
    },
    'lt2yliec': {
      'en': 'List of Documents to be Filled up for Rebate Proposal',
      'or': 'ରିହାତି ପ୍ରସ୍ତାବ ପାଇଁ ପୂରଣ କରିବାକୁ ଥିବା ଡକ୍ୟୁମେଣ୍ଟଗୁଡ଼ିକର ତାଲିକା',
    },
    'ra8m7e4y': {
      'en': 'Festive Name',
      'or': 'ଉତ୍ସବର ନାମ',
    },
    'q170vzul': {
      'en': 'Select FestiveName',
      'or': 'ଉତ୍ସବର ନାମ ଚୟନ କରନ୍ତୁ',
    },
    'rjvtluzo': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    '8v8kbnz0': {
      'en': '0',
      'or': '0',
    },
    '4wamci7w': {
      'en': '1',
      'or': '୧',
    },
    'mm6k7kbo': {
      'en': 'Document List',
      'or': 'ଡକ୍ୟୁମେଣ୍ଟ ତାଲିକା',
    },
    'xionw5lr': {
      'en': 'Select Document',
      'or': 'ଡକ୍ୟୁମେଣ୍ଟ ଚୟନ କରନ୍ତୁ',
    },
    'lb8s3yq2': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'wufuoatp': {
      'en': 'Select Document',
      'or': 'ଡକ୍ୟୁମେଣ୍ଟ ଚୟନ କରନ୍ତୁ',
    },
    'ogk6scvc': {
      'en': 'FORM V',
      'or': 'ଫର୍ମ V',
    },
    'n5icdzfj': {
      'en': 'FORM VI',
      'or': 'ଫର୍ମ VI',
    },
    '3b1r8jy1': {
      'en': 'Declaration Certificate',
      'or': 'ଘୋଷଣା ପ୍ରମାଣପତ୍ର',
    },
    'he3wgzc9': {
      'en': 'Audit Certificate from Chartered Accountant',
      'or': 'ଚାଟାର୍ଡ ଆକାଉଣ୍ଟାଣ୍ଟଙ୍କଠାରୁ ଅଡିଟ୍ ପ୍ରମାଣପତ୍ର',
    },
    'ukw8p5mh': {
      'en': 'Proof of Bank Deposit of Sale Proceeds',
      'or': 'ବିକ୍ରୟ ଅର୍ଥର ବ୍ୟାଙ୍କ ଜମାର ପ୍ରମାଣ',
    },
    'napswwlc': {
      'en': 'Opening Stock Report',
      'or': 'ଷ୍ଟକ୍ ରିପୋର୍ଟ ଖୋଲିବା',
    },
    'oousrau0': {
      'en': 'Upload',
      'or': 'ଅପଲୋଡ୍ କରନ୍ତୁ',
    },
    'bnle76hz': {
      'en': 'Upload File',
      'or': 'ଫାଇଲ୍ ଅପଲୋଡ୍ କରନ୍ତୁ',
    },
    'vfzosqod': {
      'en': 'Submit',
      'or': 'ଦାଖଲ କରନ୍ତୁ',
    },
    '4nixzrff': {
      'en': 'Submitted Documents for Rebate Proposal',
      'or': 'ରିହାତି ପ୍ରସ୍ତାବ ପାଇଁ ଦାଖଲ ହୋଇଥିବା ଡକ୍ୟୁମେଣ୍ଟଗୁଡ଼ିକ',
    },
    'guonw2an': {
      'en': 'Select Document',
      'or': 'ଡକ୍ୟୁମେଣ୍ଟ ଚୟନ କରନ୍ତୁ',
    },
    '9eu9rwgh': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'yz932xm9': {
      'en': '0',
      'or': '0',
    },
    'ulftl277': {
      'en': '1',
      'or': '୧',
    },
    'hqsp3skd': {
      'en': 'Select Festive Name',
      'or': 'ଉତ୍ସବର ନାମ ଚୟନ କରନ୍ତୁ',
    },
    'yxcqdnxv': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    '8zw7j5fn': {
      'en': '0',
      'or': '0',
    },
    'qzl3aid0': {
      'en': '1',
      'or': '୧',
    },
    'f84tcny2': {
      'en': 'Clear Filter',
      'or': 'ଫିଲ୍ଟର୍ ଖାଲି କରନ୍ତୁ',
    },
    '2fhqm586': {
      'en': 'Sl. No',
      'or': 'କ୍ରମିକ ନାଁ',
    },
    'j3q2e7d7': {
      'en': 'Financial Year',
      'or': 'ଆର୍ଥିକ ବର୍ଷ',
    },
    'qiccr79c': {
      'en': 'Festive Name',
      'or': 'ଉତ୍ସବର ନାମ',
    },
    '1lu5xngi': {
      'en': 'Spell Start Date',
      'or': 'ବନାନ ଆରମ୍ଭ ତାରିଖ',
    },
    'ks1phnf2': {
      'en': 'Spell End Date',
      'or': 'ବନାନ ଶେଷ ତାରିଖ',
    },
    'e6f6sv65': {
      'en': 'Actions',
      'or': 'କାର୍ଯ୍ୟ',
    },
    'y8qridvm': {
      'en': '1',
      'or': '୧',
    },
    'b6fuw33m': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'fyd07ioz': {
      'en': 'Tapan Mohanty',
      'or': 'ତପନ ମହାନ୍ତି',
    },
    '5wtvfv7x': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    '6ecdo1m4': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'rk9o2l85': {
      'en': 'View',
      'or': 'ଦର୍ଶନ',
    },
    '7bd3tpzz': {
      'en': '2',
      'or': '୨',
    },
    'bbas4zg3': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'yh1mgigz': {
      'en': 'Chittaranjan Panda',
      'or': 'ଚିତ୍ତରଞ୍ଜନ ପଣ୍ଡା',
    },
    'uisd49jh': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'i46h342h': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'xq11e53l': {
      'en': 'View',
      'or': 'ଦର୍ଶନ',
    },
    'vonrc05f': {
      'en': '3',
      'or': '3',
    },
    '8y5enjar': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    '314tvikc': {
      'en': 'Ajay Kumar Mohapatra',
      'or': 'ଅଜୟ କୁମାର ମହାପାତ୍ର',
    },
    'zlv8ibzs': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    '2yr5gmal': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'hwjsf1xy': {
      'en': 'View',
      'or': 'ଦର୍ଶନ',
    },
    '5rvnqaae': {
      'en': '4',
      'or': '୪',
    },
    'fesxbf1p': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    't63nj6p8': {
      'en': 'Tapas Sahu',
      'or': 'ତାପସ ସାହୁ',
    },
    'u28athnu': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'ynxf4ioc': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    '99ssfdy1': {
      'en': 'View',
      'or': 'ଦର୍ଶନ',
    },
    'mh541pyq': {
      'en': '5',
      'or': '5',
    },
    '5bziufjy': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'xqe9i0l7': {
      'en': 'Rajkishore Das',
      'or': 'ରାଜକିଶୋର ଦାସ',
    },
    '8nljz1s8': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'gd9jmqap': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'pt4edi56': {
      'en': 'View',
      'or': 'ଦର୍ଶନ',
    },
    'smzf1tcr': {
      'en': '6',
      'or': '6',
    },
    'vf4czavz': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'xq68jtiv': {
      'en': 'Rajkishore Das',
      'or': 'ରାଜକିଶୋର ଦାସ',
    },
    'dvc9lpz3': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    '60rtgftg': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    '9bh01sgc': {
      'en': 'View',
      'or': 'ଦର୍ଶନ',
    },
    '0k2q95hs': {
      'en': '7',
      'or': '7',
    },
    'mfqzp0uv': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    '0v7whfx9': {
      'en': 'Rajkishore Das',
      'or': 'ରାଜକିଶୋର ଦାସ',
    },
    'ca7qdqib': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'xphvz9yp': {
      'en': '15/04/2024',
      'or': '୧୫/୦୪/୨୦୨୪',
    },
    'ieb8ch8p': {
      'en': 'View',
      'or': 'ଦର୍ଶନ',
    },
    'uhdk3izl': {
      'en': 'Submitted Documents for Rebate Proposal',
      'or': 'ରିହାତି ପ୍ରସ୍ତାବ ପାଇଁ ଦାଖଲ ହୋଇଥିବା ଡକ୍ୟୁମେଣ୍ଟଗୁଡ଼ିକ',
    },
    'a6pcmp2g': {
      'en': 'Select Document',
      'or': 'ଡକ୍ୟୁମେଣ୍ଟ ଚୟନ କରନ୍ତୁ',
    },
    'zw0rxsy7': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'elkr39rh': {
      'en': '0',
      'or': '0',
    },
    'j005fa8q': {
      'en': '1',
      'or': '୧',
    },
    'le2cz5m6': {
      'en': 'Select Festive Name',
      'or': 'ଉତ୍ସବର ନାମ ଚୟନ କରନ୍ତୁ',
    },
    '73nj9imy': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'rbyawys5': {
      'en': '0',
      'or': '0',
    },
    '59mn87ek': {
      'en': '1',
      'or': '୧',
    },
    '7qpyi3zp': {
      'en': 'Clear Filter',
      'or': 'ଫିଲ୍ଟର୍ ଖାଲି କରନ୍ତୁ',
    },
    'x7u34d0i': {
      'en': 'Sl. No',
      'or': 'କ୍ରମିକ ନାଁ',
    },
    'f06268ad': {
      'en': 'Festive Name',
      'or': 'ଉତ୍ସବର ନାମ',
    },
    'cux0u249': {
      'en': 'Documents',
      'or': 'ଡକ୍ୟୁମେଣ୍ଟଗୁଡିକ',
    },
    'f83qhspy': {
      'en': '1',
      'or': '୧',
    },
    '55nngiec': {
      'en': 'Randy Peterson ',
      'or': 'ରାଣ୍ଡି ପିଟରସନ୍',
    },
    'kdpmufnq': {
      'en': 'FORM I',
      'or': 'ଫର୍ମ I',
    },
    'zhnxs14g': {
      'en': 'Attachment',
      'or': 'ଆଟାଚମେଣ୍ଟ୍',
    },
    'kn8i01mp': {
      'en': 'Download PDF',
      'or': 'PDF ଡାଉନଲୋଡ୍ କରନ୍ତୁ',
    },
    'u63nmp7w': {
      'en': 'Status',
      'or': 'ସ୍ଥିତି',
    },
    'cj32ubty': {
      'en': '',
      'or': '',
    },
    'gsmdape8': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    'i29h73x8': {
      'en': '1',
      'or': '୧',
    },
    'gnw4zuan': {
      'en': 'General Settings',
      'or': 'ସାଧାରଣ ସେଟିଂ',
    },
    'ocmlyf0n': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    'tmal12st': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    '72t0zoil': {
      'en': 'Edit',
      'or': 'ସମ୍ପାଦନ କରନ୍ତୁ',
    },
    'v2prcefh': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    '8n7h9eiw': {
      'en': 'Amos',
      'or': 'ଆମୋଷ',
    },
    'm3g24joi': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    '51dx20jp': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    'gd0rroic': {
      'en': 'Email address',
      'or': 'ଇମେଲ ଠିକଣା',
    },
    'vfsno106': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    '49o60kmu': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    'ckev7hr9': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    'rttzpxgi': {
      'en': 'Languages',
      'or': 'ଭାଷାଗୁଡ଼ିକ',
    },
    'zufks7y7': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    'rfupqazh': {
      'en': 'Change',
      'or': 'ପରିବର୍ତ୍ତନ କରନ୍ତୁ',
    },
    '77rml2h2': {
      'en': 'App appearance',
      'or': 'ଆପ୍‌ର ଦୃଶ୍ୟମାନତା',
    },
    'ma35phjg': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'ssm05l9r': {
      'en': 'Light mode',
      'or': 'ଲାଇଟ୍ ମୋଡ୍',
    },
    'itijb3bk': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'wsybmyty': {
      'en': 'System preference',
      'or': 'ସିଷ୍ଟମର ପସନ୍ଦ',
    },
    'y9w4lz11': {
      'en': 'Help and Support',
      'or': 'ସାହାଯ୍ୟ ଏବଂ ସମର୍ଥନ',
    },
    'e31mwxaf': {
      'en': 'Looking for info about us?',
      'or': 'ଆମ ବିଷୟରେ ସୂଚନା ଚାହୁଁଛନ୍ତି କି?',
    },
    'kr698rf3': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'f2v9k9b8': {
      'en': 'Tips on how to use Pandora?',
      'or': 'ପାଣ୍ଡୋରା ବ୍ୟବହାର କରିବା ପାଇଁ ଟିପ୍ସ?',
    },
    'nphsaxk8': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'o7pshqua': {
      'en': 'Need something else?',
      'or': 'ଆଉ କିଛି ଦରକାର କି?',
    },
    'z6ig8wii': {
      'en': 'Contact support',
      'or': 'ସହାୟତା ପାଇଁ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    '9qpuqi9v': {
      'en': 'FAQs',
      'or': 'ସାଧାରଣ ପ୍ରଶ୍ନ',
    },
    'ddq16isu': {
      'en': '© 2025 Directorate of Industries, Odisha. All rights reserved.',
      'or': '© ୨୦୨୫ ଶିଳ୍ପ ନିର୍ଦ୍ଦେଶାଳୟ, ଓଡ଼ିଶା। ସର୍ବସତ୍ତ୍ୱ ସଂରକ୍ଷିତ।',
    },
    'eq31yhqk': {
      'en': 'Design & Developed by Qwegle, Odisha State Centre.',
      'or': 'ଡିଜାଇନ୍ ଏବଂ ବିକଶିତ କ୍ୱେଗଲ୍, ଓଡ଼ିଶା ରାଜ୍ୟ କେନ୍ଦ୍ର ଦ୍ୱାରା।',
    },
    'cgw6bj1w': {
      'en': 'Design & Developed by Qwegle, Odisha State Centre.',
      'or': 'ଡିଜାଇନ୍ ଏବଂ ବିକଶିତ କ୍ୱେଗଲ୍, ଓଡ଼ିଶା ରାଜ୍ୟ କେନ୍ଦ୍ର ଦ୍ୱାରା।',
    },
    '090vsyhu': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // GovtOrder
  {
    'uvh8b5qs': {
      'en': 'GOVT ORDER',
      'or': 'ଅକ୍ଷର ସଂଖ୍ୟା',
    },
    '6tbwsilq': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    '4sydgil4': {
      'en': 'Application',
      'or': 'ପ୍ରୟୋଗ',
    },
    'qz0myi8k': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    '7e1dgf7j': {
      'en': 'Letter Number',
      'or': 'ଅକ୍ଷର ସଂଖ୍ୟା',
    },
    'l7txlxnv': {
      'en': 'Order title',
      'or': 'ଅର୍ଡର ଟାଇଟେଲ୍',
    },
    'f9q0qcn1': {
      'en': 'Department name',
      'or': 'ବିଭାଗର ନାମ',
    },
    'dduqfl3x': {
      'en': 'Point of contact',
      'or': 'ଯୋଗାଯୋଗ ସ୍ଥାନ',
    },
    'vp2krs7n': {
      'en': 'Contact Number',
      'or': 'ଯୋଗାଯୋଗ ନମ୍ବର',
    },
    '99zhai27': {
      'en': 'Field is required',
      'or': '',
    },
    'oopf23kz': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'lmd33j8r': {
      'en': 'Field is required',
      'or': '',
    },
    'xlu13m5x': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    '70yujwbo': {
      'en': 'Field is required',
      'or': '',
    },
    'iqiax8fu': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    '6r6eesl7': {
      'en': 'Field is required',
      'or': '',
    },
    'sqc6i9uq': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'bno9wxx1': {
      'en': 'Save',
      'or': 'ସେଭ୍ କରନ୍ତୁ',
    },
    '4abd6xr1': {
      'en': 'GOVT ORDER',
      'or': 'ସରକାରୀ ନିର୍ଦ୍ଦେଶ',
    },
    'vmvtbevc': {
      'en': 'Search Loan Number',
      'or': 'ଋଣ ନମ୍ବର ଖୋଜନ୍ତୁ',
    },
    '1ejodanj': {
      'en': 'Search',
      'or': 'ଖୋଜନ୍ତୁ',
    },
    'bjv8wwiz': {
      'en': 'Clear',
      'or': 'ଖାଲି କରନ୍ତୁ',
    },
    '3v7wbmxs': {
      'en': 'Order Title',
      'or': 'ଅର୍ଡର ଟାଇଟଲ୍',
    },
    'frykd6cu': {
      'en': 'Department',
      'or': 'ବିଭାଗ',
    },
    'i0h2910z': {
      'en': 'Contact Person',
      'or': 'ଯୋଗାଯୋଗ ବ୍ୟକ୍ତି',
    },
    '2u3fkm9d': {
      'en': 'Contact No.',
      'or': 'ଯୋଗାଯୋଗ ନମ୍ବର',
    },
    'dv6lb63d': {
      'en': 'Rows per pages:',
      'or': 'ପ୍ରତି ପୃଷ୍ଠା ଧାଡ଼ି:',
    },
    '83u9ecmh': {
      'en': '10',
      'or': '୧୦',
    },
    'lbt8jss5': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'qfwjueut': {
      'en': '5',
      'or': '5',
    },
    'zsfqau7p': {
      'en': '10',
      'or': '୧୦',
    },
    '1w09mrzw': {
      'en': '25',
      'or': '୨୫',
    },
    'c6kua3t2': {
      'en': '50',
      'or': '୫୦',
    },
    'b0uknvw5': {
      'en': '100',
      'or': '୧୦୦',
    },
    'kyhjjqzd': {
      'en': '-',
      'or': '-',
    },
    'ssoc4h1x': {
      'en': ' of ',
      'or': 'ର',
    },
    'n33d6kd8': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    'wjnnxdgw': {
      'en': '1',
      'or': '୧',
    },
    'xzw1a2r4': {
      'en': 'General Settings',
      'or': 'ସାଧାରଣ ସେଟିଂ',
    },
    '1j20zfup': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    '6bgzh2e8': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    'x5zkeoah': {
      'en': 'Edit',
      'or': 'ସମ୍ପାଦନ କରନ୍ତୁ',
    },
    'wceu7a1w': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    'kcmh0n78': {
      'en': 'Amos',
      'or': 'ଆମୋଷ',
    },
    'kks7087c': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    'y1c9idw9': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    '2cvv9ukv': {
      'en': 'Email address',
      'or': 'ଇମେଲ ଠିକଣା',
    },
    'ueum6en3': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    'gzlrsmcq': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    '8vna78g0': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    'w50l5lad': {
      'en': 'Languages',
      'or': 'ଭାଷାଗୁଡ଼ିକ',
    },
    '9x1h4wi1': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    '7du0jy43': {
      'en': 'Change',
      'or': 'ପରିବର୍ତ୍ତନ କରନ୍ତୁ',
    },
    'szbl2jrh': {
      'en': 'App appearance',
      'or': 'ଆପ୍‌ର ଦୃଶ୍ୟମାନତା',
    },
    'polf9xf1': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    '0qtycn36': {
      'en': 'Light mode',
      'or': 'ଲାଇଟ୍ ମୋଡ୍',
    },
    '2bn0zdjj': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    '9y6qs9mr': {
      'en': 'System preference',
      'or': 'ସିଷ୍ଟମର ପସନ୍ଦ',
    },
    'nlouux1n': {
      'en': 'Help and Support',
      'or': 'ସାହାଯ୍ୟ ଏବଂ ସମର୍ଥନ',
    },
    'r3fbdf0c': {
      'en': 'Looking for info about us?',
      'or': 'ଆମ ବିଷୟରେ ସୂଚନା ଚାହୁଁଛନ୍ତି କି?',
    },
    'gqruhzqy': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    '1r61zhu6': {
      'en': 'Tips on how to use Pandora?',
      'or': 'ପାଣ୍ଡୋରା ବ୍ୟବହାର କରିବା ପାଇଁ ଟିପ୍ସ?',
    },
    '1bgv4gb7': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    '7m13bvgp': {
      'en': 'Need something else?',
      'or': 'ଆଉ କିଛି ଦରକାର କି?',
    },
    '8zoenb1q': {
      'en': 'Contact support',
      'or': 'ସହାୟତା ପାଇଁ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    'y2e6tciz': {
      'en': 'FAQs',
      'or': 'ସାଧାରଣ ପ୍ରଶ୍ନ',
    },
    'cud9ppza': {
      'en': 'Home',
      'or': 'ଘର',
    },
    'vscvf0vf': {
      'en': 'Dashboard',
      'or': 'ଡ୍ୟାସବୋର୍ଡ',
    },
    'a8px7vbx': {
      'en': 'Investment',
      'or': 'ନିବେଶ',
    },
    'n3oc5twy': {
      'en': 'Files',
      'or': 'ଫାଇଲ୍‌ଗୁଡ଼ିକ',
    },
    '6qujtl28': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    'rfktwwat': {
      'en': 'Log Out',
      'or': 'ଲଗ ଆଉଟ୍',
    },
    'm3g7qqy3': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // FloatTender
  {
    'i9qiryik': {
      'en': 'Tender Form',
      'or': 'ଟେଣ୍ଡର ଫର୍ମ',
    },
    '1ynsl51a': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'cta47lq2': {
      'en': 'Application',
      'or': 'ପ୍ରୟୋଗ',
    },
    'caj0s5e8': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    '4lyl7d5g': {
      'en': 'Tender Form',
      'or': 'ଟେଣ୍ଡର ଫର୍ମ',
    },
    'm1sxpa8o': {
      'en': 'Tender/RFP Number',
      'or': 'ଟେଣ୍ଡର/ଆରଏଫପି ନମ୍ବର',
    },
    'qgby940l': {
      'en': 'Project Title',
      'or': 'ପ୍ରୋଜେକ୍ଟ ଟାଇଟଲ୍',
    },
    '8aizo3od': {
      'en': 'Tender Date',
      'or': 'ଟେଣ୍ଡର ତାରିଖ',
    },
    '1eh1vffd': {
      'en': 'Prebid Date',
      'or': 'ପୂର୍ବ ବିଡ୍ ତାରିଖ',
    },
    'zcg5ojac': {
      'en': 'Last Tender submission Date',
      'or': 'ଟେଣ୍ଡର ଦାଖଲର ଶେଷ ତାରିଖ',
    },
    'g3gswaef': {
      'en': 'Bid Opening Date',
      'or': 'ବିଡ୍ ଖୋଲିବା ତାରିଖ',
    },
    'jueie0xp': {
      'en': 'Field is required',
      'or': '',
    },
    'soz5b4hp': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'o64uxfrt': {
      'en': 'Field is required',
      'or': '',
    },
    'zzk36khs': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'kptiiu48': {
      'en': 'Save',
      'or': 'ସେଭ୍ କରନ୍ତୁ',
    },
    '3hxoooj2': {
      'en': 'FLOAT TENDER',
      'or': 'ଫ୍ଲୋଟ୍ ଟେଣ୍ଡର',
    },
    'xhtyag4r': {
      'en': 'Select...',
      'or': 'ଚୟନ କରନ୍ତୁ...',
    },
    '9m52y24c': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    't59437mo': {
      'en': 'Govt Order',
      'or': 'ସରକାରୀ ନିର୍ଦ୍ଦେଶ',
    },
    '25fuz0s6': {
      'en': 'Float Tender',
      'or': 'ଫ୍ଲୋଟ୍ ଟେଣ୍ଡର',
    },
    'qhdofds4': {
      'en': 'Supply Order',
      'or': 'ଯୋଗାଣ ଅର୍ଡର',
    },
    'hpzvo0d0': {
      'en': 'Tender Result',
      'or': 'ଟେଣ୍ଡର ଫଳାଫଳ',
    },
    'svv7pwht': {
      'en': 'Search Loan Number',
      'or': 'ଋଣ ନମ୍ବର ଖୋଜନ୍ତୁ',
    },
    'q3q9hpco': {
      'en': 'Search',
      'or': 'ଖୋଜନ୍ତୁ',
    },
    'zvjilbjp': {
      'en': 'Clear',
      'or': 'ଖାଲି କରନ୍ତୁ',
    },
    '9g943yp1': {
      'en': 'Tender No.',
      'or': 'ଟେଣ୍ଡର ନମ୍ବର',
    },
    '87qbv3jj': {
      'en': 'Project Title',
      'or': 'ପ୍ରୋଜେକ୍ଟ ଟାଇଟଲ୍',
    },
    'iuyunjmj': {
      'en': 'Tender Date',
      'or': 'ଟେଣ୍ଡର ତାରିଖ',
    },
    'wc4qtbiq': {
      'en': 'Pre-Bid',
      'or': 'ପ୍ରି-ବିଡ୍',
    },
    '6pr3vhjs': {
      'en': 'Submission',
      'or': 'ଦାଖଲ',
    },
    'mt77wmii': {
      'en': 'Bid Open',
      'or': 'ବିଡ୍ ଖୋଲା',
    },
    'kn62wuz8': {
      'en': 'Rows per pages:',
      'or': 'ପ୍ରତି ପୃଷ୍ଠା ଧାଡ଼ି:',
    },
    'jd2xtmyr': {
      'en': '10',
      'or': '୧୦',
    },
    'dxsuwfog': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'jw38pffd': {
      'en': '5',
      'or': '5',
    },
    'dc4q2p7s': {
      'en': '10',
      'or': '୧୦',
    },
    'gel7n8pe': {
      'en': '25',
      'or': '୨୫',
    },
    '4y27wb5i': {
      'en': '50',
      'or': '୫୦',
    },
    'o4r0mkrs': {
      'en': '100',
      'or': '୧୦୦',
    },
    'mz6jg092': {
      'en': '-',
      'or': '-',
    },
    'z0u3frtq': {
      'en': ' of ',
      'or': 'ର',
    },
    'fm0goj4k': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    'fsujtei8': {
      'en': '1',
      'or': '୧',
    },
    'fdyr2b7n': {
      'en': 'General Settings',
      'or': 'ସାଧାରଣ ସେଟିଂ',
    },
    'wupy7z17': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    'h2004faq': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    'u7beqjno': {
      'en': 'Edit',
      'or': 'ସମ୍ପାଦନ କରନ୍ତୁ',
    },
    '047092de': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    'i6yrec8y': {
      'en': 'Amos',
      'or': 'ଆମୋଷ',
    },
    '2wz4j6ck': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    'dm57gyao': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    'ex7n2zl1': {
      'en': 'Email address',
      'or': 'ଇମେଲ ଠିକଣା',
    },
    'tntk11a2': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    '4cckacka': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    '8boaeatn': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    'g23dxzmi': {
      'en': 'Languages',
      'or': 'ଭାଷାଗୁଡ଼ିକ',
    },
    'lzcqoqc0': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    'a4cvr4ci': {
      'en': 'Change',
      'or': 'ପରିବର୍ତ୍ତନ କରନ୍ତୁ',
    },
    'zkvnm4z2': {
      'en': 'App appearance',
      'or': 'ଆପ୍‌ର ଦୃଶ୍ୟମାନତା',
    },
    'lm08bpz3': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'ucbebcu7': {
      'en': 'Light mode',
      'or': 'ଲାଇଟ୍ ମୋଡ୍',
    },
    'm15o59ry': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'xom884g8': {
      'en': 'System preference',
      'or': 'ସିଷ୍ଟମର ପସନ୍ଦ',
    },
    'a69b6qoe': {
      'en': 'Help and Support',
      'or': 'ସାହାଯ୍ୟ ଏବଂ ସମର୍ଥନ',
    },
    'mc3dkd2k': {
      'en': 'Looking for info about us?',
      'or': 'ଆମ ବିଷୟରେ ସୂଚନା ଚାହୁଁଛନ୍ତି କି?',
    },
    'qrnixmr9': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'rmt1vfvr': {
      'en': 'Tips on how to use Pandora?',
      'or': 'ପାଣ୍ଡୋରା ବ୍ୟବହାର କରିବା ପାଇଁ ଟିପ୍ସ?',
    },
    'ryt9cpio': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'ugeh85bm': {
      'en': 'Need something else?',
      'or': 'ଆଉ କିଛି ଦରକାର କି?',
    },
    '6w5me6km': {
      'en': 'Contact support',
      'or': 'ସହାୟତା ପାଇଁ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    'dhv8zfmo': {
      'en': 'FAQs',
      'or': 'ସାଧାରଣ ପ୍ରଶ୍ନ',
    },
    '6czzcqnn': {
      'en': 'Home',
      'or': 'ଘର',
    },
    'bu1bq775': {
      'en': 'Dashboard',
      'or': 'ଡ୍ୟାସବୋର୍ଡ',
    },
    '9z8nv4qc': {
      'en': 'Investment',
      'or': 'ନିବେଶ',
    },
    'co088v3f': {
      'en': 'Files',
      'or': 'ଫାଇଲ୍‌ଗୁଡ଼ିକ',
    },
    'q4e3o7ng': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    '6qi7d24f': {
      'en': 'Log Out',
      'or': 'ଲଗ ଆଉଟ୍',
    },
    'a2jf4vlx': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // TenderDetails
  {
    'mbzfr2ap': {
      'en': 'Tender Details',
      'or': 'ଟେଣ୍ଡର ଫଳାଫଳ',
    },
    'w4w3uu55': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    '7k8jmi63': {
      'en': 'Application',
      'or': 'ପ୍ରୟୋଗ',
    },
    'c0caivby': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    '0vty1zn4': {
      'en': 'Tender Details',
      'or': 'ଟେଣ୍ଡର ଫଳାଫଳ',
    },
    'wx6flgee': {
      'en': 'Tender Number*',
      'or': 'ଟେଣ୍ଡର ନମ୍ବର',
    },
    '8ybuwwv5': {
      'en': 'Bidder details',
      'or': 'ବିଡର୍ ବିବରଣୀ',
    },
    'sqhddv5c': {
      'en': 'Name*',
      'or': 'ନାମ',
    },
    'jrt7dhua': {
      'en': 'Bid Value',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    'z3vpsad9': {
      'en': 'Bidder Score',
      'or': 'ବିଡର ସ୍କୋର୍',
    },
    'c9wc6fh1': {
      'en': 'ADD',
      'or': 'ସେଭ୍ କରନ୍ତୁ',
    },
    'hevd3agb': {
      'en': 'Tender No.',
      'or': 'ଟେଣ୍ଡର ନମ୍ବର',
    },
    'zfwgessk': {
      'en': 'Bidder Name',
      'or': 'ନିଲାମଦାତାଙ୍କ ନାମ',
    },
    'g8dl3inn': {
      'en': 'Bid Value',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    'ypzyvh7c': {
      'en': 'Bidder Score',
      'or': 'ସ୍ଥିତି',
    },
    'onyzwyaa': {
      'en': 'Action',
      'or': 'ସ୍ଥିତି',
    },
    'r5j7b1e6': {
      'en': 'Save',
      'or': 'ସେଭ୍ କରନ୍ତୁ',
    },
    'zuxno45a': {
      'en': 'TENDER Details',
      'or': 'ଟେଣ୍ଡର ଫଳାଫଳ',
    },
    '6nr157up': {
      'en': 'Select...',
      'or': 'ଚୟନ କରନ୍ତୁ...',
    },
    '2g125t7r': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'kfw487h4': {
      'en': 'Govt Order',
      'or': 'ସରକାରୀ ନିର୍ଦ୍ଦେଶ',
    },
    '0kv4w9d9': {
      'en': 'Float Tender',
      'or': 'ଫ୍ଲୋଟ୍ ଟେଣ୍ଡର',
    },
    'lhbbc2vv': {
      'en': 'Supply Order',
      'or': 'ଯୋଗାଣ ଅର୍ଡର',
    },
    '8gdqqlbr': {
      'en': 'Tender Result',
      'or': 'ଟେଣ୍ଡର ଫଳାଫଳ',
    },
    'aamy6ax4': {
      'en': 'Search Loan Number',
      'or': 'ଋଣ ନମ୍ବର ଖୋଜନ୍ତୁ',
    },
    '5uu2cpbh': {
      'en': 'Search',
      'or': 'ଖୋଜନ୍ତୁ',
    },
    'axkzrbkf': {
      'en': 'Clear',
      'or': 'ଖାଲି କରନ୍ତୁ',
    },
    'omd4hucp': {
      'en': 'Tender No.',
      'or': 'ଟେଣ୍ଡର ନମ୍ବର',
    },
    'uhxk7l15': {
      'en': 'Date',
      'or': 'ସ୍କୋର୍‌',
    },
    '49z1plb3': {
      'en': 'Bidder Details',
      'or': 'ସ୍ଥିତି',
    },
    'z660eb3s': {
      'en': 'View ',
      'or': '',
    },
    'bmaauf3i': {
      'en': 'Rows per pages:',
      'or': 'ପ୍ରତି ପୃଷ୍ଠା ଧାଡ଼ି:',
    },
    'ghshewbc': {
      'en': '10',
      'or': '୧୦',
    },
    'zx9141dl': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'cxcyxy40': {
      'en': '5',
      'or': '5',
    },
    'yecu3k01': {
      'en': '10',
      'or': '୧୦',
    },
    '7jqzt8ou': {
      'en': '25',
      'or': '୨୫',
    },
    'xy0q5ldm': {
      'en': '50',
      'or': '୫୦',
    },
    'y00tk1oe': {
      'en': '100',
      'or': '୧୦୦',
    },
    'uaw39fmz': {
      'en': '-',
      'or': '-',
    },
    'ape9g32h': {
      'en': ' of ',
      'or': 'ର',
    },
    'rtxt9sxm': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    'gac4qv2p': {
      'en': '1',
      'or': '୧',
    },
    '09gy8z6n': {
      'en': 'General Settings',
      'or': 'ସାଧାରଣ ସେଟିଂ',
    },
    'kbdxanz0': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    '0om9or53': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    'ilcbzfw4': {
      'en': 'Edit',
      'or': 'ସମ୍ପାଦନ କରନ୍ତୁ',
    },
    'jvt7bsit': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    'nybo99j2': {
      'en': 'Amos',
      'or': 'ଆମୋଷ',
    },
    'tioa5d6g': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    '17toq0x2': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    's5lu63ah': {
      'en': 'Email address',
      'or': 'ଇମେଲ ଠିକଣା',
    },
    'tgcudg2v': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    'bm6yrfzy': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    'kl9ter3u': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    '7qg9o44d': {
      'en': 'Languages',
      'or': 'ଭାଷାଗୁଡ଼ିକ',
    },
    'ry4gjlq3': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    'olyo5ftt': {
      'en': 'Change',
      'or': 'ପରିବର୍ତ୍ତନ କରନ୍ତୁ',
    },
    'ol4qsh9c': {
      'en': 'App appearance',
      'or': 'ଆପ୍‌ର ଦୃଶ୍ୟମାନତା',
    },
    'qwlrf5ah': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'kkizlhfm': {
      'en': 'Light mode',
      'or': 'ଲାଇଟ୍ ମୋଡ୍',
    },
    '9jatao4q': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'ibwsno9s': {
      'en': 'System preference',
      'or': 'ସିଷ୍ଟମର ପସନ୍ଦ',
    },
    '5yovaw4z': {
      'en': 'Help and Support',
      'or': 'ସାହାଯ୍ୟ ଏବଂ ସମର୍ଥନ',
    },
    '67njlgok': {
      'en': 'Looking for info about us?',
      'or': 'ଆମ ବିଷୟରେ ସୂଚନା ଚାହୁଁଛନ୍ତି କି?',
    },
    'pekbcyip': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    '6zm0e7sp': {
      'en': 'Tips on how to use Pandora?',
      'or': 'ପାଣ୍ଡୋରା ବ୍ୟବହାର କରିବା ପାଇଁ ଟିପ୍ସ?',
    },
    'ny8gtr1l': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    '029t2y0v': {
      'en': 'Need something else?',
      'or': 'ଆଉ କିଛି ଦରକାର କି?',
    },
    'ulf6m82s': {
      'en': 'Contact support',
      'or': 'ସହାୟତା ପାଇଁ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    'qaj2b3v2': {
      'en': 'FAQs',
      'or': 'ସାଧାରଣ ପ୍ରଶ୍ନ',
    },
    'tf9qdn0h': {
      'en': 'Home',
      'or': 'ଘର',
    },
    'sqyj2j2a': {
      'en': 'Dashboard',
      'or': 'ଡ୍ୟାସବୋର୍ଡ',
    },
    's62kta11': {
      'en': 'Investment',
      'or': 'ନିବେଶ',
    },
    '2khbfy60': {
      'en': 'Files',
      'or': 'ଫାଇଲ୍‌ଗୁଡ଼ିକ',
    },
    'et6ieiei': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    'mlrve7kj': {
      'en': 'Log Out',
      'or': 'ଲଗ ଆଉଟ୍',
    },
    'ka1gg6mw': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // ChoseL1bidder
  {
    'w1sngm79': {
      'en': 'Chose L1 Bidder',
      'or': 'L1 ବିଡର ବାଛିଲେ',
    },
    'mshalw8g': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'ml2nydd5': {
      'en': 'Application',
      'or': 'ପ୍ରୟୋଗ',
    },
    'dkc7s9hs': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    '4521xntt': {
      'en': 'Tender Number',
      'or': 'ଟେଣ୍ଡର/ଆରଏଫପି ନମ୍ବର',
    },
    'k2r6wcd4': {
      'en': 'Check',
      'or': '',
    },
    'agst2i7k': {
      'en': 'Chose L1 Bidder',
      'or': 'L1 ବିଡର ବାଛିଲେ',
    },
    '6ph2dwa2': {
      'en': 'Chose Consortium',
      'or': 'କନସୋର୍ଟିୟମ୍ ବାଛନ୍ତୁ',
    },
    'rezku6tb': {
      'en': 'Select...',
      'or': 'ଚୟନ କରନ୍ତୁ...',
    },
    'g4p6lvlc': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    '9j2i1ovv': {
      'en': 'Bidder 1',
      'or': 'ବିଡର ୧',
    },
    '3rl7jntk': {
      'en': 'Bidder 2',
      'or': 'ବିଡର ୨',
    },
    'othvvg9w': {
      'en': 'Bidder 3',
      'or': 'ବିଡର ୩',
    },
    '5tuyn61g': {
      'en': 'Prakash Nath',
      'or': 'ପ୍ରକାଶ ନାଥ',
    },
    'm11vd4l1': {
      'en': 'Prakash Nath',
      'or': 'ପ୍ରକାଶ ନାଥ',
    },
    'vq229hrz': {
      'en': 'Prakash Nath',
      'or': 'ପ୍ରକାଶ ନାଥ',
    },
    'hld9hai0': {
      'en': 'Prakash Nath',
      'or': 'ପ୍ରକାଶ ନାଥ',
    },
    'et61d4n3': {
      'en': 'Prakash Nath',
      'or': 'ପ୍ରକାଶ ନାଥ',
    },
    'jlv4qjqr': {
      'en': 'Prakash Nath',
      'or': 'ପ୍ରକାଶ ନାଥ',
    },
    'n6d5558o': {
      'en': 'Prakash Nath',
      'or': 'ପ୍ରକାଶ ନାଥ',
    },
    'stojj4ua': {
      'en': 'Prakash Nath',
      'or': 'ପ୍ରକାଶ ନାଥ',
    },
    'nuc669ww': {
      'en': 'Prakash Nath',
      'or': 'ପ୍ରକାଶ ନାଥ',
    },
    'a34ewjx7': {
      'en': 'Prakash Nath',
      'or': 'ପ୍ରକାଶ ନାଥ',
    },
    '9f4md0vb': {
      'en': 'Prakash Nath',
      'or': 'ପ୍ରକାଶ ନାଥ',
    },
    'm2pid9ls': {
      'en': 'Prakash Nath',
      'or': 'ପ୍ରକାଶ ନାଥ',
    },
    'uibziwxa': {
      'en': 'Prakash Nath',
      'or': 'ପ୍ରକାଶ ନାଥ',
    },
    'y03eqnfw': {
      'en': 'Prakash Nath',
      'or': 'ପ୍ରକାଶ ନାଥ',
    },
    '1cuatovy': {
      'en': 'Save',
      'or': 'ସେଭ୍ କରନ୍ତୁ',
    },
    '4g8psb06': {
      'en': 'Tender Form Lists',
      'or': 'ଟେଣ୍ଡର ଫର୍ମ ତାଲିକା',
    },
    'wye7zcab': {
      'en': 'Search Loan Number',
      'or': 'ଋଣ ନମ୍ବର ଖୋଜନ୍ତୁ',
    },
    'nqsh01bg': {
      'en': 'Search',
      'or': 'ଖୋଜନ୍ତୁ',
    },
    'vt6tpzrz': {
      'en': 'Clear',
      'or': 'ଖାଲି କରନ୍ତୁ',
    },
    'gwl0oe4i': {
      'en': 'Tender No.',
      'or': 'ଟେଣ୍ଡର ନମ୍ବର',
    },
    'dqxcoh45': {
      'en': 'L1 Bidder',
      'or': 'L1 ବିଡର',
    },
    'vodrylgm': {
      'en': 'Consortium',
      'or': 'କନ୍ସୋର୍ଟିୟମ୍',
    },
    'f148netp': {
      'en': 'Rows per pages:',
      'or': 'ପ୍ରତି ପୃଷ୍ଠା ଧାଡ଼ି:',
    },
    'onkzluk5': {
      'en': '10',
      'or': '୧୦',
    },
    '9ci20efq': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'nlbpsvss': {
      'en': '5',
      'or': '5',
    },
    'dytbuvgv': {
      'en': '10',
      'or': '୧୦',
    },
    '0d1f8995': {
      'en': '25',
      'or': '୨୫',
    },
    'wbpnqblr': {
      'en': '50',
      'or': '୫୦',
    },
    '1bq7qboh': {
      'en': '100',
      'or': '୧୦୦',
    },
    '3rf6z7tc': {
      'en': '-',
      'or': '-',
    },
    'qws9vu3p': {
      'en': ' of ',
      'or': 'ର',
    },
    '443o6hii': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    'hj2x1mg2': {
      'en': '1',
      'or': '୧',
    },
    'ygj47rv9': {
      'en': 'General Settings',
      'or': 'ସାଧାରଣ ସେଟିଂ',
    },
    '5q26cea8': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    'skpop4of': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    'n18lawoj': {
      'en': 'Edit',
      'or': 'ସମ୍ପାଦନ କରନ୍ତୁ',
    },
    'ubi8tehj': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    'gcvxncxk': {
      'en': 'Amos',
      'or': 'ଆମୋଷ',
    },
    'j2blath3': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    'it8wqxpk': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    '6rezh8jt': {
      'en': 'Email address',
      'or': 'ଇମେଲ ଠିକଣା',
    },
    'hpif2kx3': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    '7xfz91pr': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    '5vlcobps': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    '94itprfx': {
      'en': 'Languages',
      'or': 'ଭାଷାଗୁଡ଼ିକ',
    },
    '1769nkaa': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    'ail9d3ac': {
      'en': 'Change',
      'or': 'ପରିବର୍ତ୍ତନ କରନ୍ତୁ',
    },
    'ahsxbd11': {
      'en': 'App appearance',
      'or': 'ଆପ୍‌ର ଦୃଶ୍ୟମାନତା',
    },
    'h3kz6erx': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    '0hqve33j': {
      'en': 'Light mode',
      'or': 'ଲାଇଟ୍ ମୋଡ୍',
    },
    'u8plj2lk': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'm50lck1w': {
      'en': 'System preference',
      'or': 'ସିଷ୍ଟମର ପସନ୍ଦ',
    },
    'q0n1g4mk': {
      'en': 'Help and Support',
      'or': 'ସାହାଯ୍ୟ ଏବଂ ସମର୍ଥନ',
    },
    'kye43fmb': {
      'en': 'Looking for info about us?',
      'or': 'ଆମ ବିଷୟରେ ସୂଚନା ଚାହୁଁଛନ୍ତି କି?',
    },
    '16ynb2pz': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'q0nm3cpi': {
      'en': 'Tips on how to use Pandora?',
      'or': 'ପାଣ୍ଡୋରା ବ୍ୟବହାର କରିବା ପାଇଁ ଟିପ୍ସ?',
    },
    'a6i8wg8z': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    '4nv40smj': {
      'en': 'Need something else?',
      'or': 'ଆଉ କିଛି ଦରକାର କି?',
    },
    'lbtw2qoq': {
      'en': 'Contact support',
      'or': 'ସହାୟତା ପାଇଁ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    'eq9x9jsd': {
      'en': 'FAQs',
      'or': 'ସାଧାରଣ ପ୍ରଶ୍ନ',
    },
    'osgaavad': {
      'en': 'Home',
      'or': 'ଘର',
    },
    'uiivf4ul': {
      'en': 'Dashboard',
      'or': 'ଡ୍ୟାସବୋର୍ଡ',
    },
    'qh0oad3z': {
      'en': 'Investment',
      'or': 'ନିବେଶ',
    },
    'cou8lal6': {
      'en': 'Files',
      'or': 'ଫାଇଲ୍‌ଗୁଡ଼ିକ',
    },
    'dvl1okv1': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    'a2xa7a43': {
      'en': 'Log Out',
      'or': 'ଲଗ ଆଉଟ୍',
    },
    '7lmeiym3': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // SupplyOrder
  {
    'ou44dtkq': {
      'en': 'Supply order',
      'or': 'ଯୋଗାଣ ଅର୍ଡର',
    },
    'ebcydbff': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'yhyocvgi': {
      'en': 'Application',
      'or': 'ପ୍ରୟୋଗ',
    },
    '3z71ez6b': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    's0r2mqmf': {
      'en': 'Supply order',
      'or': 'ଯୋଗାଣ ଅର୍ଡର',
    },
    'dz1vkwkw': {
      'en': 'Tender Number',
      'or': 'ଯୋଗାଣ ବିବରଣୀ',
    },
    'zzn9hc97': {
      'en': 'Tender Value',
      'or': 'ଯୋଗାଣର ପ୍ରମାଣ (ସଂଲଗ୍ନ)',
    },
    'iso3kl92': {
      'en': 'Supply Quantity',
      'or': 'ଯୋଗାଣ ବିବରଣୀ',
    },
    'vabwfceo': {
      'en': 'Proof of Supply(Attachment)',
      'or': 'ଯୋଗାଣର ପ୍ରମାଣ (ସଂଲଗ୍ନ)',
    },
    'u5atocvh': {
      'en': 'Upload PDF',
      'or': 'PDF ଅପଲୋଡ୍ କରନ୍ତୁ',
    },
    '41dj7vf8': {
      'en': 'Invoice sumbition (attachment)',
      'or': 'ଇନଭଏସ୍ ଜମା (ସଂଲଗ୍ନ)',
    },
    'ept5iqwa': {
      'en': 'Upload PDF',
      'or': 'PDF ଅପଲୋଡ୍ କରନ୍ତୁ',
    },
    'ptcnpzhe': {
      'en':
          '⚠️ File Size Restriction: Only files 2MB or smaller are allowed. Uploading larger files will prevent form submission.',
      'or': '',
    },
    'qw00vruv': {
      'en': 'Invoice Number',
      'or': 'ଯୋଗାଣ ବିବରଣୀ',
    },
    'n9w0ul3m': {
      'en': 'Invoice Amount',
      'or': 'ଇନଭଏସ୍ ଅନୁସାରେ ପେମେଣ୍ଟ',
    },
    'pscvnayz': {
      'en': 'Field is required',
      'or': '',
    },
    'os96rt87': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    '2uitqvmq': {
      'en': 'Field is required',
      'or': '',
    },
    'h4vckry7': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'r6j7foom': {
      'en': 'Field is required',
      'or': '',
    },
    'vzr80kn9': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'd07kon2e': {
      'en': 'Field is required',
      'or': '',
    },
    'w4q3qw4i': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'p9gwfjej': {
      'en': 'Field is required',
      'or': '',
    },
    'nsw1vrog': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'pf0vcyfo': {
      'en': 'Save',
      'or': 'ସେଭ୍ କରନ୍ତୁ',
    },
    '04wbfdn5': {
      'en': 'SUPPLY ORDER',
      'or': 'ଯୋଗାଣ ଅର୍ଡର',
    },
    '0kdm2xe9': {
      'en': 'Search Loan Number',
      'or': 'ଋଣ ନମ୍ବର ଖୋଜନ୍ତୁ',
    },
    '84o009d5': {
      'en': 'Search',
      'or': 'ଖୋଜନ୍ତୁ',
    },
    'xp6ndgb9': {
      'en': 'Clear',
      'or': 'ଖାଲି କରନ୍ତୁ',
    },
    'otb9nl40': {
      'en': 'Supply Details',
      'or': 'ଯୋଗାଣ ବିବରଣୀ',
    },
    'lgs2bicy': {
      'en': 'Proof of Supply',
      'or': 'ଯୋଗାଣର ପ୍ରମାଣ',
    },
    'lvyguep8': {
      'en': 'Invoice Status',
      'or': 'ଇନଭଏସ୍ ସ୍ଥିତି',
    },
    'l3pe0hxi': {
      'en': 'Payment Status',
      'or': 'ପେମେଣ୍ଟ ସ୍ଥିତି',
    },
    'jos9wtva': {
      'en': 'Rows per pages:',
      'or': 'ପ୍ରତି ପୃଷ୍ଠା ଧାଡ଼ି:',
    },
    '93cmipth': {
      'en': '10',
      'or': '୧୦',
    },
    '61vpksn8': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'fdl0ahmh': {
      'en': '5',
      'or': '5',
    },
    'p47n9igt': {
      'en': '10',
      'or': '୧୦',
    },
    'qr5s3ouv': {
      'en': '25',
      'or': '୨୫',
    },
    'ylf3d8ti': {
      'en': '50',
      'or': '୫୦',
    },
    'zwz4ctmg': {
      'en': '100',
      'or': '୧୦୦',
    },
    'fnb4qkvi': {
      'en': '-',
      'or': '-',
    },
    '42iqtaha': {
      'en': ' of ',
      'or': 'ର',
    },
    '421ptz60': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    'wwr4e1rz': {
      'en': '1',
      'or': '୧',
    },
    '7a757h0o': {
      'en': 'General Settings',
      'or': 'ସାଧାରଣ ସେଟିଂ',
    },
    'posiv45w': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    'pg5vlvx7': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    's7kuc1xd': {
      'en': 'Edit',
      'or': 'ସମ୍ପାଦନ କରନ୍ତୁ',
    },
    '3neyuue1': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    'so26q10k': {
      'en': 'Amos',
      'or': 'ଆମୋଷ',
    },
    '44psrie7': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    'v74yfct2': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    'ipc344ri': {
      'en': 'Email address',
      'or': 'ଇମେଲ ଠିକଣା',
    },
    '70gm8tsf': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    '30uqo2u2': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    'zgva706b': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    'hkmp51so': {
      'en': 'Languages',
      'or': 'ଭାଷାଗୁଡ଼ିକ',
    },
    'dyess0lg': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    'ouba8n5s': {
      'en': 'Change',
      'or': 'ପରିବର୍ତ୍ତନ କରନ୍ତୁ',
    },
    'iq0avrtg': {
      'en': 'App appearance',
      'or': 'ଆପ୍‌ର ଦୃଶ୍ୟମାନତା',
    },
    's17zqdfx': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    '1at0fpf8': {
      'en': 'Light mode',
      'or': 'ଲାଇଟ୍ ମୋଡ୍',
    },
    'bo86rjlb': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    '66r0zcyf': {
      'en': 'System preference',
      'or': 'ସିଷ୍ଟମର ପସନ୍ଦ',
    },
    'jhh8h61e': {
      'en': 'Help and Support',
      'or': 'ସାହାଯ୍ୟ ଏବଂ ସମର୍ଥନ',
    },
    'cxpt634i': {
      'en': 'Looking for info about us?',
      'or': 'ଆମ ବିଷୟରେ ସୂଚନା ଚାହୁଁଛନ୍ତି କି?',
    },
    '456d08v8': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    '6ycrn7we': {
      'en': 'Tips on how to use Pandora?',
      'or': 'ପାଣ୍ଡୋରା ବ୍ୟବହାର କରିବା ପାଇଁ ଟିପ୍ସ?',
    },
    '0lts78lf': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    't883suo5': {
      'en': 'Need something else?',
      'or': 'ଆଉ କିଛି ଦରକାର କି?',
    },
    'tzv2vrbc': {
      'en': 'Contact support',
      'or': 'ସହାୟତା ପାଇଁ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    'jbrgsind': {
      'en': 'FAQs',
      'or': 'ସାଧାରଣ ପ୍ରଶ୍ନ',
    },
    'jlo4yo49': {
      'en': 'Home',
      'or': 'ଘର',
    },
    '8u5epqhm': {
      'en': 'Dashboard',
      'or': 'ଡ୍ୟାସବୋର୍ଡ',
    },
    '1q271smu': {
      'en': 'Investment',
      'or': 'ନିବେଶ',
    },
    'fyomg6w3': {
      'en': 'Files',
      'or': 'ଫାଇଲ୍‌ଗୁଡ଼ିକ',
    },
    '08tw171d': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    'tpi8fid1': {
      'en': 'Log Out',
      'or': 'ଲଗ ଆଉଟ୍',
    },
    '54tq9ljj': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // ExsitingLoanApplicationStatusAdmin
  {
    'hobben1z': {
      'en': 'Loan Application',
      'or': 'ଋଣ ଆବେଦନ',
    },
    'ueeuzzi6': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'wk741w8b': {
      'en': 'OTS Form Applications',
      'or': 'OTS ଫର୍ମ ଆବେଦନ',
    },
    'fs2ye7n6': {
      'en': 'Search Loan Number',
      'or': 'ଋଣ ନମ୍ବର ଖୋଜନ୍ତୁ',
    },
    '2qkm597j': {
      'en': 'Search',
      'or': 'ଖୋଜନ୍ତୁ',
    },
    'q3o65bkx': {
      'en': 'Clear',
      'or': 'ଖାଲି କରନ୍ତୁ',
    },
    'c1htoxea': {
      'en': 'Search Loan Number is required',
      'or': '',
    },
    'q6wmuiky': {
      'en': 'Enter full 6-character loan number.',
      'or': '',
    },
    '7mvt2oe5': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'z9442sba': {
      'en': 'Loan Number',
      'or': 'ଋଣ ନମ୍ବର',
    },
    'rauo744a': {
      'en': 'User Name',
      'or': 'ଉପଯୋଗକର୍ତ୍ତା ନାମ',
    },
    '8jz057en': {
      'en': 'Loan Amount',
      'or': 'ଋଣ ରାଶି',
    },
    '5fp13rml': {
      'en': 'Status',
      'or': 'ସ୍ଥିତି',
    },
    'ufnc5s6c': {
      'en': 'Actions',
      'or': 'କାର୍ଯ୍ୟ',
    },
    '0al7wf4o': {
      'en': 'Rows per pages:',
      'or': 'ପ୍ରତି ପୃଷ୍ଠା ଧାଡ଼ି:',
    },
    'kwlulyai': {
      'en': '10',
      'or': '୧୦',
    },
    'bkxx7tv8': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'q4txdyyj': {
      'en': '5',
      'or': '5',
    },
    'hvyrco6s': {
      'en': '10',
      'or': '୧୦',
    },
    '9w966j0i': {
      'en': '25',
      'or': '୨୫',
    },
    's4hmufge': {
      'en': '50',
      'or': '୫୦',
    },
    'l6upgcdu': {
      'en': '100',
      'or': '୧୦୦',
    },
    'tm0m57ou': {
      'en': '-',
      'or': '-',
    },
    'pyj3f1z9': {
      'en': ' of ',
      'or': 'ର',
    },
    '64f0njsv': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // ExLoanAplicStaBranch
  {
    'kcpcfl4t': {
      'en': 'Loan Application',
      'or': 'ଋଣ ଆବେଦନ',
    },
    'ejm6zqpf': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'hze1xxhk': {
      'en': 'OTS Form Applications',
      'or': 'OTS ଫର୍ମ ଆବେଦନ',
    },
    '4kllcj7a': {
      'en': 'Search your loan number...',
      'or': 'ଋଣ ନମ୍ବର ଖୋଜନ୍ତୁ',
    },
    's0la6umh': {
      'en': 'Search',
      'or': 'ଖୋଜନ୍ତୁ',
    },
    'e0q5ur48': {
      'en': 'Clear',
      'or': 'ଖାଲି କରନ୍ତୁ',
    },
    'zaethqva': {
      'en': 'Search your loan number is required',
      'or': '',
    },
    'z1a03hgt': {
      'en': 'Enter full 6-character loan number.',
      'or': '',
    },
    'c958yr00': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'nzsdt0du': {
      'en': 'Loan Number',
      'or': 'ଋଣ ନମ୍ବର',
    },
    'h16vxpu7': {
      'en': 'User Name',
      'or': 'ଉପଯୋଗକର୍ତ୍ତା ନାମ',
    },
    'neqgsw7j': {
      'en': 'Loan Amount',
      'or': 'ଋଣ ରାଶି',
    },
    '9az4wd2u': {
      'en': 'Status',
      'or': 'ସ୍ଥିତି',
    },
    '5jjfb9qr': {
      'en': 'Actions',
      'or': 'କାର୍ଯ୍ୟ',
    },
    'znx9ix0w': {
      'en': 'Rows per pages:',
      'or': 'ପ୍ରତି ପୃଷ୍ଠା ଧାଡ଼ି:',
    },
    'ca2o37nr': {
      'en': '10',
      'or': '୧୦',
    },
    'woxa1rg1': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'qcshbz2t': {
      'en': '5',
      'or': '5',
    },
    'vqkxbnnm': {
      'en': '10',
      'or': '୧୦',
    },
    'kw68kzvk': {
      'en': '25',
      'or': '୨୫',
    },
    '9s9fuwi4': {
      'en': '50',
      'or': '୫୦',
    },
    'grzpkhmg': {
      'en': '100',
      'or': '୧୦୦',
    },
    'l9wlajge': {
      'en': '-',
      'or': '-',
    },
    'wawbbxnx': {
      'en': ' of ',
      'or': 'ର',
    },
    '0hn1ttnx': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // DashboardOsfcAdmin
  {
    '43lsqiq9': {
      'en': 'Dashboard',
      'or': 'ଡ୍ୟାସବୋର୍ଡ',
    },
    'zvtaj4je': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'cd2kzun9': {
      'en': 'Pending Application ',
      'or': 'ବିଚାରାଧୀନ ଆବେଦନ',
    },
    'jsw8aikv': {
      'en': 'Approved Application',
      'or': 'ଅନୁମୋଦିତ ଆବେଦନ',
    },
    '4o4jcpeo': {
      'en': 'Rejected Application',
      'or': 'ପ୍ରତ୍ୟାଖ୍ୟାନ କରାଯାଇଥିବା ଆବେଦନ',
    },
    '6wu4iiv6': {
      'en': 'Issued no due Certificate',
      'or': 'କୌଣସି ବକେୟା ପ୍ରମାଣପତ୍ର ଜାରି କରାଯାଇଛି',
    },
    'wsbl7dr0': {
      'en': 'Application Status',
      'or': 'ଆବେଦନ ସ୍ଥିତି',
    },
    '525hoomh': {
      'en': 'Approved',
      'or': 'ଅନୁମୋଦିତ ହୋଇଛି',
    },
    'xolw5gtc': {
      'en': 'Pending',
      'or': 'ବିଚାରାଧୀନ ଅଛି',
    },
    'jmmgit4u': {
      'en': 'Rejected',
      'or': 'ପ୍ରତ୍ୟାଖ୍ୟାନ କରାଗଲା',
    },
    'kwzvcdzc': {
      'en': 'You’ve almost reached your limit',
      'or': 'ଆପଣ ପ୍ରାୟ ଆପଣଙ୍କ ସୀମାରେ ପହଞ୍ଚି ଯାଇଛନ୍ତି',
    },
    'oj8bjkzm': {
      'en':
          'You have used 80% of your available requests. Upgrade plan to make more network requests.',
      'or':
          'ଆପଣ ଆପଣଙ୍କର ଉପଲବ୍ଧ ଅନୁରୋଧଗୁଡ଼ିକର 80% ବ୍ୟବହାର କରିସାରିଛନ୍ତି। ଅଧିକ ନେଟୱାର୍କ ଅନୁରୋଧ କରିବା ପାଇଁ ଯୋଜନାକୁ ଅପଗ୍ରେଡ୍ କରନ୍ତୁ।',
    },
    '0kgq7528': {
      'en': 'OTS Form Applications',
      'or': 'OTS ଫର୍ମ ଆବେଦନ',
    },
    'nb3ukdpu': {
      'en': 'Search Loan Number',
      'or': 'ଋଣ ନମ୍ବର ଖୋଜନ୍ତୁ',
    },
    '873sv0du': {
      'en': 'Search',
      'or': 'ଖୋଜନ୍ତୁ',
    },
    'gtt1i94w': {
      'en': 'Clear',
      'or': 'ଖାଲି କରନ୍ତୁ',
    },
    'hklnii6v': {
      'en': 'Search Loan Number is required',
      'or': '',
    },
    '3zibljs6': {
      'en': 'Enter full 13-character loan number.',
      'or': '',
    },
    'uf0j9hog': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'y7ociuv8': {
      'en': 'Loan Number',
      'or': 'ଋଣ ନମ୍ବର',
    },
    'm23pggy8': {
      'en': 'User Name',
      'or': 'ଉପଯୋଗକର୍ତ୍ତା ନାମ',
    },
    'npzmurdj': {
      'en': 'Apply Date',
      'or': 'ଆବେଦନ ତାରିଖ',
    },
    'rgr1ey2x': {
      'en': 'Status',
      'or': 'ସ୍ଥିତି',
    },
    'gwzyi6kn': {
      'en': 'Actions',
      'or': 'କାର୍ଯ୍ୟ',
    },
    '887p9usu': {
      'en': 'Rows per pages:',
      'or': 'ପ୍ରତି ପୃଷ୍ଠା ଧାଡ଼ି:',
    },
    '5k79fr7x': {
      'en': '10',
      'or': '୧୦',
    },
    'ifzqfjle': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    '4vcqf0e1': {
      'en': '5',
      'or': '5',
    },
    'rb3pkepd': {
      'en': '10',
      'or': '୧୦',
    },
    'muq9mlam': {
      'en': '25',
      'or': '୨୫',
    },
    'j6oius9n': {
      'en': '50',
      'or': '୫୦',
    },
    't18cqqsz': {
      'en': '100',
      'or': '୧୦୦',
    },
    'ukfql3sb': {
      'en': '-',
      'or': '-',
    },
    'lb5wqjwc': {
      'en': ' of ',
      'or': 'ର',
    },
    'enzn4q64': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    't5ok3zss': {
      'en': '1',
      'or': '୧',
    },
    'dj92lem6': {
      'en': 'General Settings',
      'or': 'ସାଧାରଣ ସେଟିଂ',
    },
    'tahr45ia': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    'n3r2b4h6': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    'qdypj0nf': {
      'en': 'Edit',
      'or': 'ସମ୍ପାଦନ କରନ୍ତୁ',
    },
    'km6ie45i': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    'ihasgfvl': {
      'en': 'Amos',
      'or': 'ଆମୋଷ',
    },
    '39qhe58b': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    'r47ud4yd': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    'r7yr6mnj': {
      'en': 'Email address',
      'or': 'ଇମେଲ ଠିକଣା',
    },
    'pqru0so6': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    'tzchv8n7': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    '47aqitos': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    'afruc8l5': {
      'en': 'Languages',
      'or': 'ଭାଷାଗୁଡ଼ିକ',
    },
    'vilcqxco': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    'xf3h478i': {
      'en': 'Change',
      'or': 'ପରିବର୍ତ୍ତନ କରନ୍ତୁ',
    },
    'q3ucuthr': {
      'en': 'App appearance',
      'or': 'ଆପ୍‌ର ଦୃଶ୍ୟମାନତା',
    },
    'zid473wx': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    '0ds34uca': {
      'en': 'Light mode',
      'or': 'ଲାଇଟ୍ ମୋଡ୍',
    },
    'ehuy6fx4': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'vzu3rr48': {
      'en': 'System preference',
      'or': 'ସିଷ୍ଟମର ପସନ୍ଦ',
    },
    'n8izxmyj': {
      'en': 'Help and Support',
      'or': 'ସାହାଯ୍ୟ ଏବଂ ସମର୍ଥନ',
    },
    '4aavt1r0': {
      'en': 'Looking for info about us?',
      'or': 'ଆମ ବିଷୟରେ ସୂଚନା ଚାହୁଁଛନ୍ତି କି?',
    },
    'ns66ols6': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    '51r5m06b': {
      'en': 'Tips on how to use Pandora?',
      'or': 'ପାଣ୍ଡୋରା ବ୍ୟବହାର କରିବା ପାଇଁ ଟିପ୍ସ?',
    },
    't4rx9845': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'ljq7mwrr': {
      'en': 'Need something else?',
      'or': 'ଆଉ କିଛି ଦରକାର କି?',
    },
    'ecgtdcpj': {
      'en': 'Contact support',
      'or': 'ସହାୟତା ପାଇଁ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    'sswfrtxq': {
      'en': 'FAQs',
      'or': 'ସାଧାରଣ ପ୍ରଶ୍ନ',
    },
    '64jitjee': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // AcknowledgementSlipUser
  {
    'tgms0y6d': {
      'en': 'Acknowledgement',
      'or': 'ସ୍ୱୀକୃତି',
    },
    'd90bhvtw': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'ykasm7rd': {
      'en': 'A-',
      'or': 'କ-',
    },
    'plrz7q01': {
      'en': 'A',
      'or': 'କ',
    },
    'faqpealg': {
      'en': 'A+',
      'or': 'କ+',
    },
    '0zm2acjo': {
      'en': 'Search your loan number...',
      'or': 'ଆପଣଙ୍କର ଋଣ ନମ୍ବର ଖୋଜନ୍ତୁ...',
    },
    'gas1na3t': {
      'en': 'Search your loan number is required',
      'or': '',
    },
    'zu2snpkg': {
      'en': 'Enter full 13-character loan number.',
      'or': '',
    },
    '8hhqpk1l': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    '6w16txi6': {
      'en': 'Search',
      'or': 'ଖୋଜନ୍ତୁ',
    },
    '8kw68bpm': {
      'en': 'Reset',
      'or': 'ରିସେଟ୍ କରନ୍ତୁ',
    },
    'i13g2tso': {
      'en': ' ',
      'or': '',
    },
    'fhywike7': {
      'en': 'Loan No',
      'or': 'ଋଣ ନମ୍ବର',
    },
    'n2gubtww': {
      'en': ': ',
      'or': ':',
    },
    '8n56ry8l': {
      'en': 'Rows per pages:',
      'or': 'ପ୍ରତି ପୃଷ୍ଠା ଧାଡ଼ି:',
    },
    '4njqk0ys': {
      'en': '10',
      'or': '୧୦',
    },
    'kcq8hz2d': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'c7r1vkg3': {
      'en': '5',
      'or': '5',
    },
    'hsi8m9pj': {
      'en': '10',
      'or': '୧୦',
    },
    'r14qji86': {
      'en': '25',
      'or': '୨୫',
    },
    'r0ok6gj2': {
      'en': '50',
      'or': '୫୦',
    },
    '13ygcwvx': {
      'en': '100',
      'or': '୧୦୦',
    },
    'r6a9vyt2': {
      'en': '-',
      'or': '-',
    },
    'w2n2qf9c': {
      'en': ' of ',
      'or': 'ର',
    },
    'fq6reowx': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    'rjat8mub': {
      'en': '1',
      'or': '୧',
    },
    't79m1inp': {
      'en': 'General Settings',
      'or': 'ସାଧାରଣ ସେଟିଂ',
    },
    'hneswae5': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    'djq8nihr': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    'qghiw6mr': {
      'en': 'Edit',
      'or': 'ସମ୍ପାଦନ କରନ୍ତୁ',
    },
    '4lgu0qpl': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    '0jtrpxd3': {
      'en': 'Amos',
      'or': 'ଆମୋଷ',
    },
    'u5a6rsob': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    'ssoi6qwq': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    'nt8tfo13': {
      'en': 'Email address',
      'or': 'ଇମେଲ ଠିକଣା',
    },
    'rwlyrdgh': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    'zmyaks1g': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    'ebi3dc76': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    'r7jq3r99': {
      'en': 'Languages',
      'or': 'ଭାଷାଗୁଡ଼ିକ',
    },
    'hbegc3g4': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    'kud2f0hh': {
      'en': 'Change',
      'or': 'ପରିବର୍ତ୍ତନ କରନ୍ତୁ',
    },
    'z1psdb7l': {
      'en': 'App appearance',
      'or': 'ଆପ୍‌ର ଦୃଶ୍ୟମାନତା',
    },
    'ca9kd2og': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'js6qp1py': {
      'en': 'Light mode',
      'or': 'ଲାଇଟ୍ ମୋଡ୍',
    },
    'mhx3s781': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    '0i2f25z7': {
      'en': 'System preference',
      'or': 'ସିଷ୍ଟମର ପସନ୍ଦ',
    },
    '8naypvv8': {
      'en': 'Help and Support',
      'or': 'ସାହାଯ୍ୟ ଏବଂ ସମର୍ଥନ',
    },
    '2erkp43i': {
      'en': 'Looking for info about us?',
      'or': 'ଆମ ବିଷୟରେ ସୂଚନା ଖୋଜୁଛନ୍ତି କି?',
    },
    'fkddc5ol': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    '8qpwcotk': {
      'en': 'Tips on how to use Pandora?',
      'or': 'ପାଣ୍ଡୋରା ବ୍ୟବହାର କରିବା ପାଇଁ ଟିପ୍ସ?',
    },
    '3hvmghbc': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'bge6zvpi': {
      'en': 'Need something else?',
      'or': 'ଆଉ କିଛି ଦରକାର କି?',
    },
    '9wkyy6wt': {
      'en': 'Contact support',
      'or': 'ସହାୟତା ପାଇଁ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    'h6xcljjz': {
      'en': 'FAQs',
      'or': 'ସାଧାରଣ ପ୍ରଶ୍ନ',
    },
    'iqn42lmx': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // AcknowledgementSlipAdmin
  {
    'hlovyd06': {
      'en': 'Acknowledgement Slip',
      'or': 'ସ୍ୱୀକୃତି ସ୍ଲିପ୍',
    },
    'bqqif5n8': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'jh01pics': {
      'en': 'Search your loan number...',
      'or': 'ଆପଣଙ୍କର ଋଣ ନମ୍ବର ଖୋଜନ୍ତୁ...',
    },
    'ad2aca1i': {
      'en': 'Search your loan number... is required',
      'or': '',
    },
    'urmnpgt3': {
      'en': 'Enter full 13-character loan number.',
      'or': '',
    },
    'vwo0stpf': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    '4khijxw3': {
      'en': 'Search',
      'or': 'ଖୋଜନ୍ତୁ',
    },
    '1qdopubd': {
      'en': 'Reset',
      'or': 'ରିସେଟ୍ କରନ୍ତୁ',
    },
    'lyc5y459': {
      'en': ' ',
      'or': '',
    },
    'okptu9dh': {
      'en': 'Loan No',
      'or': 'ଋଣ ନମ୍ବର',
    },
    'xhmunbwj': {
      'en': ': ',
      'or': ':',
    },
    'leos4yps': {
      'en': 'Download Slip',
      'or': 'ସ୍ଲିପ୍ ଡାଉନଲୋଡ୍ କରନ୍ତୁ',
    },
    'wlf4qi8a': {
      'en': 'Rows per pages:',
      'or': 'ପ୍ରତି ପୃଷ୍ଠା ଧାଡ଼ି:',
    },
    'ltzsua09': {
      'en': '10',
      'or': '୧୦',
    },
    'gv0czasx': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    '23oyl7qe': {
      'en': '5',
      'or': '5',
    },
    'gvkmd0md': {
      'en': '10',
      'or': '୧୦',
    },
    '8g0uwwte': {
      'en': '25',
      'or': '୨୫',
    },
    'ecnirjf3': {
      'en': '50',
      'or': '୫୦',
    },
    'p8m6wjr4': {
      'en': '100',
      'or': '୧୦୦',
    },
    'pvekinuj': {
      'en': '-',
      'or': '-',
    },
    'xqbkhph8': {
      'en': ' of ',
      'or': 'ର',
    },
    '9fhos60u': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    'g85bj8c4': {
      'en': '1',
      'or': '୧',
    },
    'hks63ztg': {
      'en': 'General Settings',
      'or': 'ସାଧାରଣ ସେଟିଂ',
    },
    'zlv24z0v': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    'o6ayhkbd': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    'dbhvg0y3': {
      'en': 'Edit',
      'or': 'ସମ୍ପାଦନ କରନ୍ତୁ',
    },
    'q9ehllpa': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    'l8zpyq2s': {
      'en': 'Amos',
      'or': 'ଆମୋଷ',
    },
    'e7km0k8d': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    'vbyrwoqk': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    'x31aoswq': {
      'en': 'Email address',
      'or': 'ଇମେଲ ଠିକଣା',
    },
    'abnp14d9': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    'ud6pdqyx': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    '65hlepbw': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    'nvmzn5fm': {
      'en': 'Languages',
      'or': 'ଭାଷାଗୁଡ଼ିକ',
    },
    'vr2scisv': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    '15thj7v1': {
      'en': 'Change',
      'or': 'ପରିବର୍ତ୍ତନ କରନ୍ତୁ',
    },
    '94ysdggk': {
      'en': 'App appearance',
      'or': 'ଆପ୍‌ର ଦୃଶ୍ୟମାନତା',
    },
    '23g9z0ft': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'dowwqfrq': {
      'en': 'Light mode',
      'or': 'ଲାଇଟ୍ ମୋଡ୍',
    },
    'ph7rdluf': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'l6si71w4': {
      'en': 'System preference',
      'or': 'ସିଷ୍ଟମର ପସନ୍ଦ',
    },
    'f4873ac2': {
      'en': 'Help and Support',
      'or': 'ସାହାଯ୍ୟ ଏବଂ ସମର୍ଥନ',
    },
    '202fc4a0': {
      'en': 'Looking for info about us?',
      'or': 'ଆମ ବିଷୟରେ ସୂଚନା ଚାହୁଁଛନ୍ତି କି?',
    },
    't8w45g0i': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'd9vdgvm4': {
      'en': 'Tips on how to use Pandora?',
      'or': 'ପାଣ୍ଡୋରା ବ୍ୟବହାର କରିବା ପାଇଁ ଟିପ୍ସ?',
    },
    'tkjtguip': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'sc7k1ei3': {
      'en': 'Need something else?',
      'or': 'ଆଉ କିଛି ଦରକାର କି?',
    },
    'gdqawnmf': {
      'en': 'Contact support',
      'or': 'ସହାୟତା ପାଇଁ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    'uhntj7ik': {
      'en': 'FAQs',
      'or': 'ସାଧାରଣ ପ୍ରଶ୍ନ',
    },
    'zawxzdfe': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // AckSlipBranch
  {
    '6nqq025o': {
      'en': 'Acknowledgement Slip',
      'or': 'ସ୍ୱୀକୃତି ସ୍ଲିପ୍',
    },
    '2ihyqbvi': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'xabqn28w': {
      'en': 'Search your loan number...',
      'or': 'ଆପଣଙ୍କର ଋଣ ନମ୍ବର ଖୋଜନ୍ତୁ...',
    },
    'g9xhjtpz': {
      'en': 'Search your loan number is required',
      'or': '',
    },
    '9zqg24z1': {
      'en': 'Enter full 13-character loan number.',
      'or': '',
    },
    'g8x1z7in': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'gg23wn9h': {
      'en': 'Search',
      'or': 'ଖୋଜନ୍ତୁ',
    },
    'qg1md0rd': {
      'en': 'Reset',
      'or': 'ରିସେଟ୍ କରନ୍ତୁ',
    },
    'qjmbi9ty': {
      'en': 'Upload Acknowledgement',
      'or': 'ସ୍ୱୀକୃତି ଅପଲୋଡ୍ କରନ୍ତୁ',
    },
    'befdx2t5': {
      'en': ' ',
      'or': '',
    },
    'y4k73v47': {
      'en': 'Loan No',
      'or': 'ଋଣ ନମ୍ବର',
    },
    'a8yyb1wb': {
      'en': ': ',
      'or': ':',
    },
    'epc6lhx6': {
      'en': 'Download Slip',
      'or': 'ସ୍ଲିପ୍ ଡାଉନଲୋଡ୍ କରନ୍ତୁ',
    },
    'gjly50wa': {
      'en': 'Rows per pages:',
      'or': 'ପ୍ରତି ପୃଷ୍ଠା ଧାଡ଼ି:',
    },
    'kqfwy9yn': {
      'en': '10',
      'or': '୧୦',
    },
    'bnrvmde6': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'jemoefsd': {
      'en': '5',
      'or': '5',
    },
    'kfrew86u': {
      'en': '10',
      'or': '୧୦',
    },
    'vxsaqkxp': {
      'en': '25',
      'or': '୨୫',
    },
    't4mpvd63': {
      'en': '50',
      'or': '୫୦',
    },
    '105ly0m0': {
      'en': '100',
      'or': '୧୦୦',
    },
    'wbdgjkiz': {
      'en': '-',
      'or': '-',
    },
    'zr09uz5a': {
      'en': ' of ',
      'or': 'ର',
    },
    'm6oyhzk7': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    '4oyqd02h': {
      'en': '1',
      'or': '୧',
    },
    'fwo061d6': {
      'en': 'General Settings',
      'or': 'ସାଧାରଣ ସେଟିଂ',
    },
    'wq68ei6k': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    'p2ccpd14': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    'aqe3hrd7': {
      'en': 'Edit',
      'or': 'ସମ୍ପାଦନ କରନ୍ତୁ',
    },
    '5z2jjgmh': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    'dd818wcy': {
      'en': 'Amos',
      'or': 'ଆମୋଷ',
    },
    'ue3l7uxw': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    'ek10f0wm': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    '167rmeq6': {
      'en': 'Email address',
      'or': 'ଇମେଲ ଠିକଣା',
    },
    'mi1fcm8n': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    'ngjzemyk': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    '7fxi8zz8': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    'hhk099c4': {
      'en': 'Languages',
      'or': 'ଭାଷାଗୁଡ଼ିକ',
    },
    'bpck7lt3': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    'n3qntvw1': {
      'en': 'Change',
      'or': 'ପରିବର୍ତ୍ତନ କରନ୍ତୁ',
    },
    'iin9cwum': {
      'en': 'App appearance',
      'or': 'ଆପ୍‌ର ଦୃଶ୍ୟମାନତା',
    },
    'rjrmj5zt': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'vk375p1p': {
      'en': 'Light mode',
      'or': 'ଲାଇଟ୍ ମୋଡ୍',
    },
    'vxkkyu86': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    '71naih9m': {
      'en': 'System preference',
      'or': 'ସିଷ୍ଟମର ପସନ୍ଦ',
    },
    'j15m11rs': {
      'en': 'Help and Support',
      'or': 'ସାହାଯ୍ୟ ଏବଂ ସମର୍ଥନ',
    },
    '90r50eae': {
      'en': 'Looking for info about us?',
      'or': 'ଆମ ବିଷୟରେ ସୂଚନା ଖୋଜୁଛନ୍ତି କି?',
    },
    't60wk4us': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'j5hjsrfw': {
      'en': 'Tips on how to use Pandora?',
      'or': 'ପାଣ୍ଡୋରା ବ୍ୟବହାର କରିବା ପାଇଁ ଟିପ୍ସ?',
    },
    '0uc60fie': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    's9gica4i': {
      'en': 'Need something else?',
      'or': 'ଆଉ କିଛି ଦରକାର କି?',
    },
    't5m9ztmj': {
      'en': 'Contact support',
      'or': 'ସହାୟତା ପାଇଁ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    '3mq96srd': {
      'en': 'FAQs',
      'or': 'ସାଧାରଣ ପ୍ରଶ୍ନ',
    },
    'ht8z0yss': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // landingpage
  {
    'pfoh9tfw': {
      'en': 'MSME',
      'or': 'ଏମଏସଏମଇ',
    },
    'b2muifrc': {
      'en': 'Shri Mohan Charan Majhi',
      'or': 'ଶ୍ରୀ ମୋହନ ଚରଣ ମାଝୀ',
    },
    'gsnpgz6z': {
      'en': 'Hon’ble Chief Minister of Odisha',
      'or': 'ଓଡ଼ିଶାର ମାନ୍ୟବର ମୁଖ୍ୟମନ୍ତ୍ରୀ',
    },
    '3g0h8agl': {
      'en': 'MSME ORTPSA SERVICES',
      'or': 'MSME ORTPSA ସେବା',
    },
    '0g1m9qiq': {
      'en': 'All your e-Applications are here.',
      'or': 'ଆପଣଙ୍କର ସମସ୍ତ ଇ-ଆପ୍ଲିକେସନ୍ ଏଠାରେ ଅଛି।',
    },
    'kznjje0n': {
      'en': 'MSME',
      'or': 'ଏମଏସଏମଇ',
    },
    '6qqn5dl9': {
      'en': 'Shri Mohan Charan Majhi',
      'or': 'ଶ୍ରୀ ମୋହନ ଚରଣ ମାଝୀ',
    },
    'f7my6u5j': {
      'en': 'Hon’ble Chief Minister of Odisha',
      'or': 'ଓଡ଼ିଶାର ମାନ୍ୟବର ମୁଖ୍ୟମନ୍ତ୍ରୀ',
    },
    'x64nhro8': {
      'en': 'MSME ORTPSA SERVICES',
      'or': 'MSME ORTPSA ସେବା',
    },
    'io6twtt7': {
      'en': 'All your e-Applications are here.',
      'or': 'ଆପଣଙ୍କର ସମସ୍ତ ଇ-ଆପ୍ଲିକେସନ୍ ଏଠାରେ ଅଛି।',
    },
    'zwd46rm7': {
      'en': 'Odisha State Financial Corporation (OSFC)',
      'or': 'ଓଡ଼ିଶା ରାଜ୍ୟ ଆର୍ଥିକ ନିଗମ (OSFC)',
    },
    'bwla57u6': {
      'en': 'Odisha Khadi & Village Industries (OK & VI)',
      'or': 'ଓଡ଼ିଶା ଖଦି ଏବଂ ଗ୍ରାମୋଦ୍ୟୋଗ (OK ଏବଂ VI)',
    },
    'v6t8vg0w': {
      'en': 'Odisha Small Industries Corporation (OSIC)',
      'or': 'ଓଡ଼ିଶା କ୍ଷୁଦ୍ର ଶିଳ୍ପ ନିଗମ (OSIC)',
    },
    'uh06a3z7': {
      'en': '© 2025 MSME Department. All rights reserved.',
      'or': '© ୨୦୨୫ ଏମଏସଏମଇ ବିଭାଗ। ସର୍ବସତ୍ତ୍ୱ ସଂରକ୍ଷିତ।',
    },
    'e93k6na9': {
      'en': 'Design & Developed by Qwegle, Odisha State Centre.',
      'or': 'ଡିଜାଇନ୍ ଏବଂ ବିକଶିତ କ୍ୱେଗଲ୍, ଓଡ଼ିଶା ରାଜ୍ୟ କେନ୍ଦ୍ର ଦ୍ୱାରା।',
    },
    'sqjlqujb': {
      'en': 'Design & Developed by Qwegle.',
      'or': 'ଡିଜାଇନ୍ ଏବଂ ବିକଶିତ Qwegle ଦ୍ୱାରା।',
    },
    'aqyafbzt': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // OtsFormViewUsers
  {
    'xv5xgr59': {
      'en': 'Details',
      'or': 'ବିବରଣୀ',
    },
    'gujxif0j': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'o1cqrbjz': {
      'en': 'Details',
      'or': 'ବିବରଣୀ',
    },
    '4b5zbfu2': {
      'en': 'Loan Number: ',
      'or': 'ଋଣ ନମ୍ବର:',
    },
    'd2nck4ny': {
      'en': 'First Name: ',
      'or': 'ପ୍ରଥମ ନାମ:',
    },
    'evooz71c': {
      'en': 'Last Name: ',
      'or': 'ଶେଷ ନାମ:',
    },
    '9yf7x3bf': {
      'en': 'Number: ',
      'or': 'ସଂଖ୍ୟା:',
    },
    '2ljcqbbs': {
      'en': 'E-Mail: ',
      'or': 'ଇ-ମେଲ୍:',
    },
    'gfznb10y': {
      'en': 'Street address: ',
      'or': 'ରାସ୍ତା ଠିକଣା:',
    },
    'k9dljiie': {
      'en': 'State:',
      'or': 'ଅବସ୍ଥା:',
    },
    '5t4ve71w': {
      'en': 'City:',
      'or': 'ସହର:',
    },
    'ec64h3ti': {
      'en': 'Pin-Code:',
      'or': 'ପିନ୍-କୋଡ୍:',
    },
    '55hmfh8t': {
      'en': 'Branch:',
      'or': 'ଶାଖା:',
    },
    'kojxg9v3': {
      'en': 'Total outstanding liablity to OSFC as on the date of application:',
      'or': 'ଆବେଦନ ତାରିଖ ଅନୁଯାୟୀ OSFC ପ୍ରତି ମୋଟ ବକେୟା ଦାୟିତ୍ବ:',
    },
    'fpatexo2': {
      'en': 'Nature of industry/product/type of the unit/company:',
      'or': 'ଶିଳ୍ପ/ଉତ୍ପାଦର ପ୍ରକୃତି/ୟୁନିଟ୍/କମ୍ପାନୀର ପ୍ରକାର:',
    },
    'x3iqcxkv': {
      'en':
          'The Present Level of operation of vehicle with Regn. No. (In case the unit/company is not in operation and reasons thereof.):',
      'or':
          'ରେଜିଷ୍ଟ୍ରେସନ ନମ୍ବର ସହିତ ଯାନର ବର୍ତ୍ତମାନର କାର୍ଯ୍ୟ ସ୍ତର (ଯଦି ୟୁନିଟ୍/କମ୍ପାନୀ କାର୍ଯ୍ୟକ୍ଷମ ନଥାଏ ଏବଂ ତାହାର କାରଣ):',
    },
    '2sevwk9q': {
      'en':
          'Details of dues, to other institutions,Fls,Banks Including details of settlements reached with them if any.:',
      'or':
          'ଅନ୍ୟ ପ୍ରତିଷ୍ଠାନ, ଫ୍ଲାଇଟ, ବ୍ୟାଙ୍କକୁ ଦେୟ ପ୍ରଦାନର ବିବରଣୀ, ସେମାନଙ୍କ ସହିତ ହୋଇଥିବା ସମାଧାନର ବିବରଣୀ ସମେତ, ଯଦି କୌଣସି ଥାଏ:',
    },
    'di9ji9p4': {
      'en': 'Reasons of non-payment of Corporation\'s dues::',
      'or': 'ନିଗମର ଦେୟ ନଦେବାର କାରଣ::',
    },
    '0hxd449r': {
      'en': 'Whether defaulter to other Banks/Fls, if so status of NPA?:',
      'or': 'ଅନ୍ୟ ବ୍ୟାଙ୍କ/ଫ୍ଲାନ୍ସର ଖିଲାପୀ କି, ଯଦି ଅଛି ତେବେ ଏନପିଏର ସ୍ଥିତି?:',
    },
    'y7203ixj': {
      'en':
          'Sailient operational and financial hights of the unit/company for the last 3 financial years in case of disbursement of all eligible loans above rs.30.00 lakh. (Audited Balance Sheet & P/L A/c.of the unit/company for the last 3 years, and Net worth certificate of borrower/applicationt by the Chartered Accountant is enclosed.):',
      'or':
          '୩୦.୦୦ ଲକ୍ଷ ଟଙ୍କାରୁ ଅଧିକ ସମସ୍ତ ଯୋଗ୍ୟ ଋଣ ପ୍ରଦାନ କ୍ଷେତ୍ରରେ ୟୁନିଟ୍/କମ୍ପାନୀର ଗତ ୩ ଆର୍ଥିକ ବର୍ଷ ପାଇଁ ସଜାଗ କାର୍ଯ୍ୟକ୍ଷମ ଏବଂ ଆର୍ଥିକ ଉଚ୍ଚତା। (ଗତ ୩ ବର୍ଷ ପାଇଁ ୟୁନିଟ୍/କମ୍ପାନୀର ଅଡିଟେଡ୍ ବାଲାନ୍ସ ସିଟ୍ ଏବଂ ପି/ଏଲ୍/ସି, ଏବଂ ଚାଟାର୍ଡ ଆକାଉଣ୍ଟାଣ୍ଟଙ୍କ ଦ୍ୱାରା ଋଣଗ୍ରହୀତାଙ୍କ/ଆବେଦନର ନେଟ୍ ୱର୍ଥ ପ୍ରମାଣପତ୍ର ସଂଲଗ୍ନ କରାଯାଇଛି):',
    },
    'j7m8v6j8': {
      'en': 'Reasons for settlement of loan dues under OTS:',
      'or': 'OTS ଅଧୀନରେ ଋଣ ଦେୟ ସମାଧାନର କାରଣ:',
    },
    'strlotb8': {
      'en': 'Sources of payment of settlement amount:',
      'or': 'ସମାଧାନ ପରିମାଣର ଦେୟ ପାଇଁ ଉତ୍ସ:',
    },
    '5q65n5y2': {
      'en': 'Terms of payment of the porposed OTS amount:',
      'or': 'ପ୍ରସ୍ତାବିତ OTS ରାଶିର ଦେୟ ସର୍ତ୍ତାବଳୀ:',
    },
    'xwg0kgdo': {
      'en': 'Any other particulars that may be relevant to mention.',
      'or': 'ଉଲ୍ଲେଖ କରିବା ପାଇଁ ପ୍ରାସଙ୍ଗିକ ହୋଇପାରେ ଏପରି ଅନ୍ୟ କୌଣସି ବିବରଣୀ।',
    },
    'pq3yczzg': {
      'en':
          'I/We would request you to consider my/our above offer and advise me/us of the decision taken in this regard at an early date. I/we would be happy to provide any further information/clarification, if needed, to the corporation:',
      'or':
          'ମୁଁ/ଆମେ ଆପଣଙ୍କୁ ଅନୁରୋଧ କରିବୁ ଯେ ମୋର/ଆମର ଉପରୋକ୍ତ ପ୍ରସ୍ତାବକୁ ଶୀଘ୍ର ବିଚାର କରନ୍ତୁ ଏବଂ ଏ ସମ୍ପର୍କରେ ନିଆଯାଇଥିବା ନିଷ୍ପତ୍ତି ବିଷୟରେ ମୋତେ/ଆମକୁ ଅବଗତ କରାନ୍ତୁ। ଆବଶ୍ୟକ ହେଲେ, ମୁଁ/ଆମେ ନିଗମକୁ ଅଧିକ ସୂଚନା/ସ୍ପଷ୍ଟୀକରଣ ପ୍ରଦାନ କରିବାକୁ ଖୁସି ହେବୁ:',
    },
    '06yptsar': {
      'en': 'Checked',
      'or': 'ଯାଞ୍ଚ କରାଯାଇଛି',
    },
    'yrybpgxj': {
      'en':
          'I/We do here by undertake that I/we Will continue payment towerds my/our current dues in terms of loan agrement pending settlement of dues under the OTS Policy-2011. I/We shall not have any claim on delay decision and/or an unfavorable decision on my/our loan settlemente claims/dues. I/We will not have any claims in case the corporation adjusts the initial deposit(s)  and subsequent payment made for settlement of dues under the OTS Policy-2011 towerds normal loan dues on non-compiance of thge terms and conditions of the policy by me/us either in part or full within stipulated time as prescribed in the policy:',
      'or':
          'ମୁଁ/ଆମେ ଏଠାରେ ପ୍ରତିଶ୍ରୁତି ଦେଉଛୁ ଯେ ମୁଁ/ଆମେ OTS ନୀତି-2011 ଅନୁଯାୟୀ ଦେୟ ସମାଧାନ ପାଇଁ ବିଚାରାଧୀନ ଋଣ ଚୁକ୍ତି ଅନୁଯାୟୀ ମୋର/ଆମର ବର୍ତ୍ତମାନର ଦେୟ ପ୍ରଦାନ ଜାରି ରଖିବୁ। ମୋର/ଆମର ଋଣ ସମାଧାନ ଦାବି/ପାଏ ଉପରେ ବିଳମ୍ବ ନିଷ୍ପତ୍ତି ଏବଂ/ଅଥବା ପ୍ରତିକୂଳ ନିଷ୍ପତ୍ତି ଉପରେ ମୋର/ଆମର କୌଣସି ଦାବି ରହିବ ନାହିଁ। ଯଦି ନିଗମ OTS ନୀତି-2011 ଅନୁଯାୟୀ ଦେୟ ସମାଧାନ ପାଇଁ ପ୍ରାରମ୍ଭିକ ଜମା(ଗୁଡ଼ିକ) ଏବଂ ପରବର୍ତ୍ତୀ ଦେୟକୁ ମୋ/ଆମ ଦ୍ୱାରା ନୀତିରେ ନିର୍ଦ୍ଧାରିତ ସମୟ ମଧ୍ୟରେ ଆଂଶିକ କିମ୍ବା ପୂର୍ଣ୍ଣ ଭାବରେ ପରିଚାଳନା ନକରେ ସମାୟୋଜନ କରେ, ତେବେ ମୋର/ଆମର କୌଣସି ଦାବି ରହିବ ନାହିଁ:',
    },
    'mx90un2r': {
      'en': 'Checked',
      'or': 'ଯାଞ୍ଚ କରାଯାଇଛି',
    },
    'iymrhmco': {
      'en':
          'I/We hereby undertake to pay the settlement of eligible loans as per the scheme parameters:',
      'or':
          'ମୁଁ/ଆମେ ଯୋଜନାର ମାନଦଣ୍ଡ ଅନୁଯାୟୀ ଯୋଗ୍ୟ ଋଣର ସମାଧାନ ପାଇଁ ପ୍ରତିଶ୍ରୁତି ଦେଉଛୁ:',
    },
    'tvv88g84': {
      'en': 'Checked',
      'or': 'ଯାଞ୍ଚ କରାଯାଇଛି',
    },
    '3t6aj4bp': {
      'en':
          'I/We hereby certify that the above information is true to the best of my knowledge.',
      'or':
          'ମୁଁ/ଆମେ ଏହାଦ୍ୱାରା ପ୍ରମାଣିତ କରୁଛୁ ଯେ ଉପରୋକ୍ତ ସୂଚନା ମୋର ସର୍ବୋତ୍ତମ ଜ୍ଞାନ ଅନୁସାରେ ସତ୍ୟ।',
    },
    '29pqc4vh': {
      'en': 'Checked',
      'or': 'ଯାଞ୍ଚ କରାଯାଇଛି',
    },
    '5jjfqdo9': {
      'en': 'Documents',
      'or': 'ଡକ୍ୟୁମେଣ୍ଟଗୁଡିକ',
    },
    'd9h5vdg5': {
      'en': 'Acknowledgement Slip',
      'or': 'ସ୍ୱୀକୃତି ସ୍ଲିପ୍',
    },
    'f1gq8job': {
      'en': 'Re-Upload',
      'or': 'ପୁନଃ ଅପଲୋଡ୍ କରନ୍ତୁ',
    },
    'chqdwprk': {
      'en': 'Download',
      'or': 'ଡାଉନଲୋଡ୍ କରନ୍ତୁ',
    },
    'w55crxjv': {
      'en': 'Memorandom',
      'or': 'ସ୍ମାରକୀ',
    },
    'lnriw092': {
      'en': 'Re-Upload',
      'or': 'ପୁନଃ ଅପଲୋଡ୍ କରନ୍ତୁ',
    },
    'xmh7cepj': {
      'en': 'Download',
      'or': 'ଡାଉନଲୋଡ୍ କରନ୍ତୁ',
    },
    '4uyfsqp8': {
      'en': 'No Due Certificate',
      'or': 'କୌଣସି ଦେୟ ପ୍ରମାଣପତ୍ର ନାହିଁ',
    },
    'sq1ec5fd': {
      'en': 'Download',
      'or': 'ଡାଉନଲୋଡ୍ କରନ୍ତୁ',
    },
    'e1oicd2p': {
      'en': 'Settlement Order',
      'or': 'ସମାଧାନ ଆଦେଶ',
    },
    'ot04w66d': {
      'en': 'Download',
      'or': 'ଡାଉନଲୋଡ୍ କରନ୍ତୁ',
    },
    'ms2vrknb': {
      'en': 'Reject',
      'or': 'ପ୍ରତ୍ୟାଖ୍ୟାନ କରନ୍ତୁ',
    },
    'fjjc3xho': {
      'en': 'Approved',
      'or': 'ଅନୁମୋଦିତ ହୋଇଛି',
    },
    'riupvnmc': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    'odka8449': {
      'en': '1',
      'or': '୧',
    },
    '0nthalng': {
      'en': 'General Settings',
      'or': 'ସାଧାରଣ ସେଟିଂ',
    },
    'wf573kb7': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    'zvyjyubj': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    'd6yl9hzc': {
      'en': 'Edit',
      'or': 'ସମ୍ପାଦନ କରନ୍ତୁ',
    },
    'rvwdxbld': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    'hnj65z8u': {
      'en': 'Amos',
      'or': 'ଆମୋଷ',
    },
    '2h24qyhw': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    'ck2l1ybs': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    '23w5bifv': {
      'en': 'Email address',
      'or': 'ଇମେଲ ଠିକଣା',
    },
    'm8j61bxo': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    'mlqe4doz': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    '2r5drazx': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    'oaff5a0e': {
      'en': 'Languages',
      'or': 'ଭାଷାଗୁଡ଼ିକ',
    },
    'pnh3mfzw': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    '1xxl3y5k': {
      'en': 'Change',
      'or': 'ପରିବର୍ତ୍ତନ କରନ୍ତୁ',
    },
    '2byqfe5h': {
      'en': 'App appearance',
      'or': 'ଆପ୍‌ର ଦୃଶ୍ୟମାନତା',
    },
    'liigxmga': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'aglip39c': {
      'en': 'Light mode',
      'or': 'ଲାଇଟ୍ ମୋଡ୍',
    },
    'wsm2vpz6': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    's8czb5oc': {
      'en': 'System preference',
      'or': 'ସିଷ୍ଟମର ପସନ୍ଦ',
    },
    '7057e7p5': {
      'en': 'Help and Support',
      'or': 'ସାହାଯ୍ୟ ଏବଂ ସମର୍ଥନ',
    },
    '8vq8mewc': {
      'en': 'Looking for info about us?',
      'or': 'ଆମ ବିଷୟରେ ସୂଚନା ଖୋଜୁଛନ୍ତି କି?',
    },
    'b8dlqi5q': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'a798eyhi': {
      'en': 'Tips on how to use Pandora?',
      'or': 'ପାଣ୍ଡୋରା ବ୍ୟବହାର କରିବା ପାଇଁ ଟିପ୍ସ?',
    },
    'ekab4um2': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'uq2yzuqh': {
      'en': 'Need something else?',
      'or': 'ଆଉ କିଛି ଦରକାର କି?',
    },
    '1jegaayd': {
      'en': 'Contact support',
      'or': 'ସହାୟତା ପାଇଁ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    'z4bpav3k': {
      'en': 'FAQs',
      'or': 'ସାଧାରଣ ପ୍ରଶ୍ନ',
    },
    'h2a6p5ez': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // MemorandomAdmin
  {
    'kih8r413': {
      'en': 'Memorandom',
      'or': 'ସ୍ମାରକୀ',
    },
    'ol7v3sc3': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'm55nrvwb': {
      'en': 'Memorandom Status',
      'or': 'ସ୍ମାରକୀ ସ୍ଥିତି',
    },
    'j7174s79': {
      'en': 'Select...',
      'or': 'ଚୟନ କରନ୍ତୁ...',
    },
    '62srva19': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'ykuxc2u1': {
      'en': 'Select',
      'or': 'ଚୟନ କରନ୍ତୁ',
    },
    'iaobuz2g': {
      'en': 'Approved',
      'or': 'ଅନୁମୋଦିତ ହୋଇଛି',
    },
    'sdgnob5m': {
      'en': 'Pending',
      'or': 'ବିଚାରାଧୀନ ଅଛି',
    },
    'feci8ta9': {
      'en': 'Rejected',
      'or': 'ପ୍ରତ୍ୟାଖ୍ୟାନ କରାଗଲା',
    },
    '2bfh1t8z': {
      'en': 'Search Loan Number',
      'or': 'ଋଣ ନମ୍ବର ଖୋଜନ୍ତୁ',
    },
    'okudgkbo': {
      'en': 'Search',
      'or': 'ଖୋଜନ୍ତୁ',
    },
    'z5gicrqe': {
      'en': 'Clear',
      'or': 'ଖାଲି କରନ୍ତୁ',
    },
    '7rb6h29w': {
      'en': 'Search Loan Number is required',
      'or': '',
    },
    'zq1i2hdb': {
      'en': 'Enter full 13-character loan number.',
      'or': '',
    },
    '6k913jan': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'j16s5flo': {
      'en': 'Loan Number',
      'or': 'ଋଣ ନମ୍ବର',
    },
    'aqqa9ucv': {
      'en': 'User Name',
      'or': 'ଉପଯୋଗକର୍ତ୍ତା ନାମ',
    },
    'w5rln1pl': {
      'en': 'Number',
      'or': 'ସଂଖ୍ୟା',
    },
    'lsv190y5': {
      'en': 'Remarks',
      'or': 'ମନ୍ତବ୍ୟ',
    },
    'bpnoh60y': {
      'en': 'Actions',
      'or': 'କାର୍ଯ୍ୟ',
    },
    'ksin2obj': {
      'en': 'Rows per pages:',
      'or': 'ପ୍ରତି ପୃଷ୍ଠା ଧାଡ଼ି:',
    },
    '348qo1jo': {
      'en': '10',
      'or': '୧୦',
    },
    'z6d69d1b': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    '83b5h3ci': {
      'en': '5',
      'or': '5',
    },
    'k22du7ij': {
      'en': '10',
      'or': '୧୦',
    },
    'jymf9988': {
      'en': '25',
      'or': '୨୫',
    },
    'ok2vsxya': {
      'en': '50',
      'or': '୫୦',
    },
    '1udix9df': {
      'en': '100',
      'or': '୧୦୦',
    },
    'd2v71a5b': {
      'en': '-',
      'or': '-',
    },
    '5zantnsy': {
      'en': ' of ',
      'or': 'ର',
    },
    '1l428093': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // MemoApprovalStatus
  {
    '7a3m5qp4': {
      'en': 'Details',
      'or': 'ବିବରଣୀ',
    },
    'zs5546b0': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'y382n430': {
      'en': 'Profile Details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    'tcb9bu2b': {
      'en': 'Loan Number: ',
      'or': 'ଋଣ ନମ୍ବର:',
    },
    'opldlesr': {
      'en': 'First Name: ',
      'or': 'ପ୍ରଥମ ନାମ:',
    },
    'lgm69owz': {
      'en': 'Last Name: ',
      'or': 'ଶେଷ ନାମ:',
    },
    'zdmxxabc': {
      'en': 'Number: ',
      'or': 'ସଂଖ୍ୟା:',
    },
    'gk1j36ii': {
      'en': 'E-Mail: ',
      'or': 'ଇ-ମେଲ୍:',
    },
    's3k5r5d3': {
      'en': 'Street address: ',
      'or': 'ରାସ୍ତା ଠିକଣା:',
    },
    '12djx5xa': {
      'en': 'State:',
      'or': 'ଅବସ୍ଥା:',
    },
    '49msjt0o': {
      'en': 'City:',
      'or': 'ସହର:',
    },
    '6gq5tvgr': {
      'en': 'Pin-Code:',
      'or': 'ପିନ୍-କୋଡ୍:',
    },
    'wtkz8aa3': {
      'en': 'Branch:',
      'or': 'ଶାଖା:',
    },
    'znoyulah': {
      'en': 'Total outstanding liablity to OSFC as on the date of application:',
      'or': 'ଆବେଦନ ତାରିଖ ଅନୁଯାୟୀ OSFC ପ୍ରତି ମୋଟ ବକେୟା ଦାୟିତ୍ବ:',
    },
    '4mj58brf': {
      'en': 'Nature of industry/product/type of the unit/company:',
      'or': 'ଶିଳ୍ପ/ଉତ୍ପାଦର ପ୍ରକୃତି/ୟୁନିଟ୍/କମ୍ପାନୀର ପ୍ରକାର:',
    },
    '7kunsqxo': {
      'en':
          'The Present Level of operation of vehicle with Regn. No. (In case the unit/company is not in operation and reasons thereof.):',
      'or':
          'ରେଜିଷ୍ଟ୍ରେସନ ନମ୍ବର ସହିତ ଯାନର ବର୍ତ୍ତମାନର କାର୍ଯ୍ୟ ସ୍ତର (ଯଦି ୟୁନିଟ୍/କମ୍ପାନୀ କାର୍ଯ୍ୟକ୍ଷମ ନଥାଏ ଏବଂ ତାହାର କାରଣ):',
    },
    'ppu88pc5': {
      'en':
          'Details of dues, to other institutions,Fls,Banks Including details of settlements reached with them if any.:',
      'or':
          'ଅନ୍ୟ ପ୍ରତିଷ୍ଠାନ, ଫ୍ଲାଇଟ, ବ୍ୟାଙ୍କକୁ ଦେୟ ପ୍ରଦାନର ବିବରଣୀ, ସେମାନଙ୍କ ସହିତ ହୋଇଥିବା ସମାଧାନର ବିବରଣୀ ସମେତ, ଯଦି କୌଣସି ଥାଏ:',
    },
    'nwhm4n1q': {
      'en': 'Reasons of non-payment of Corporation\'s dues::',
      'or': 'ନିଗମର ଦେୟ ନଦେବାର କାରଣ::',
    },
    '8za7wl2v': {
      'en': 'Whether defaulter to other Banks/Fls, if so status of NPA?:',
      'or': 'ଅନ୍ୟ ବ୍ୟାଙ୍କ/ଫ୍ଲାନ୍ସର ଖିଲାପୀ କି, ଯଦି ଅଛି ତେବେ ଏନପିଏର ସ୍ଥିତି?:',
    },
    'ss7o7z86': {
      'en':
          'Sailient operational and financial hights of the unit/company for the last 3 financial years in case of disbursement of all eligible loans above rs.30.00 lakh. (Audited Balance Sheet & P/L A/c.of the unit/company for the last 3 years, and Net worth certificate of borrower/applicationt by the Chartered Accountant is enclosed.):',
      'or':
          '୩୦.୦୦ ଲକ୍ଷ ଟଙ୍କାରୁ ଅଧିକ ସମସ୍ତ ଯୋଗ୍ୟ ଋଣ ପ୍ରଦାନ କ୍ଷେତ୍ରରେ ୟୁନିଟ୍/କମ୍ପାନୀର ଗତ ୩ ଆର୍ଥିକ ବର୍ଷ ପାଇଁ ସଜାଗ କାର୍ଯ୍ୟକ୍ଷମ ଏବଂ ଆର୍ଥିକ ଉଚ୍ଚତା। (ଗତ ୩ ବର୍ଷ ପାଇଁ ୟୁନିଟ୍/କମ୍ପାନୀର ଅଡିଟେଡ୍ ବାଲାନ୍ସ ସିଟ୍ ଏବଂ ପି/ଏଲ୍/ସି, ଏବଂ ଚାଟାର୍ଡ ଆକାଉଣ୍ଟାଣ୍ଟଙ୍କ ଦ୍ୱାରା ଋଣଗ୍ରହୀତାଙ୍କ/ଆବେଦନର ନେଟ୍ ୱର୍ଥ ପ୍ରମାଣପତ୍ର ସଂଲଗ୍ନ କରାଯାଇଛି):',
    },
    '5zlgr967': {
      'en': 'Reasons for settlement of loan dues under OTS:',
      'or': 'OTS ଅଧୀନରେ ଋଣ ଦେୟ ସମାଧାନର କାରଣ:',
    },
    '4cspq2ui': {
      'en': 'Sources of payment of settlement amount:',
      'or': 'ସମାଧାନ ପରିମାଣର ଦେୟ ପାଇଁ ଉତ୍ସ:',
    },
    '78u1ufc6': {
      'en': 'Terms of payment of the porposed OTS amount:',
      'or': 'ପ୍ରସ୍ତାବିତ OTS ରାଶିର ଦେୟ ସର୍ତ୍ତାବଳୀ:',
    },
    '4i8yi8po': {
      'en': 'Any other particulars that may be relevant to mention.',
      'or': 'ଉଲ୍ଲେଖ କରିବା ପାଇଁ ପ୍ରାସଙ୍ଗିକ ହୋଇପାରେ ଏପରି ଅନ୍ୟ କୌଣସି ବିବରଣୀ।',
    },
    'litvezh7': {
      'en':
          'I/We would request you to consider my/our above offer and advise me/us of the decision taken in this regard at an early date. I/we would be happy to provide any further information/clarification, if needed, to the corporation:',
      'or':
          'ମୁଁ/ଆମେ ଆପଣଙ୍କୁ ଅନୁରୋଧ କରିବୁ ଯେ ମୋର/ଆମର ଉପରୋକ୍ତ ପ୍ରସ୍ତାବକୁ ଶୀଘ୍ର ବିଚାର କରନ୍ତୁ ଏବଂ ଏ ସମ୍ପର୍କରେ ନିଆଯାଇଥିବା ନିଷ୍ପତ୍ତି ବିଷୟରେ ମୋତେ/ଆମକୁ ଅବଗତ କରାନ୍ତୁ। ଆବଶ୍ୟକ ହେଲେ, ମୁଁ/ଆମେ ନିଗମକୁ ଅଧିକ ସୂଚନା/ସ୍ପଷ୍ଟୀକରଣ ପ୍ରଦାନ କରିବାକୁ ଖୁସି ହେବୁ:',
    },
    'egbgiel0': {
      'en': 'Checked',
      'or': 'ଯାଞ୍ଚ କରାଯାଇଛି',
    },
    'q62mckxw': {
      'en':
          'I/We do here by undertake that I/we Will continue payment towerds my/our current dues in terms of loan agrement pending settlement of dues under the OTS Policy-2011. I/We shall not have any claim on delay decision and/or an unfavorable decision on my/our loan settlemente claims/dues. I/We will not have any claims in case the corporation adjusts the initial deposit(s)  and subsequent payment made for settlement of dues under the OTS Policy-2011 towerds normal loan dues on non-compiance of thge terms and conditions of the policy by me/us either in part or full within stipulated time as prescribed in the policy:',
      'or':
          'ମୁଁ/ଆମେ ଏଠାରେ ପ୍ରତିଶ୍ରୁତି ଦେଉଛୁ ଯେ ମୁଁ/ଆମେ OTS ନୀତି-2011 ଅନୁଯାୟୀ ଦେୟ ସମାଧାନ ପାଇଁ ବିଚାରାଧୀନ ଋଣ ଚୁକ୍ତି ଅନୁଯାୟୀ ମୋର/ଆମର ବର୍ତ୍ତମାନର ଦେୟ ପ୍ରଦାନ ଜାରି ରଖିବୁ। ମୋର/ଆମର ଋଣ ସମାଧାନ ଦାବି/ପାଏ ଉପରେ ବିଳମ୍ବ ନିଷ୍ପତ୍ତି ଏବଂ/ଅଥବା ପ୍ରତିକୂଳ ନିଷ୍ପତ୍ତି ଉପରେ ମୋର/ଆମର କୌଣସି ଦାବି ରହିବ ନାହିଁ। ଯଦି ନିଗମ OTS ନୀତି-2011 ଅନୁଯାୟୀ ଦେୟ ସମାଧାନ ପାଇଁ ପ୍ରାରମ୍ଭିକ ଜମା(ଗୁଡ଼ିକ) ଏବଂ ପରବର୍ତ୍ତୀ ଦେୟକୁ ମୋ/ଆମ ଦ୍ୱାରା ନୀତିରେ ନିର୍ଦ୍ଧାରିତ ସମୟ ମଧ୍ୟରେ ଆଂଶିକ କିମ୍ବା ପୂର୍ଣ୍ଣ ଭାବରେ ପରିଚାଳନା ନକରେ ସମାୟୋଜନ କରେ, ତେବେ ମୋର/ଆମର କୌଣସି ଦାବି ରହିବ ନାହିଁ:',
    },
    '56gcgsmv': {
      'en': 'Checked',
      'or': 'ଯାଞ୍ଚ କରାଯାଇଛି',
    },
    'wde0n6j1': {
      'en':
          'I/We hereby undertake to pay the settlement of eligible loans as per the scheme parameters:',
      'or':
          'ମୁଁ/ଆମେ ଯୋଜନାର ମାନଦଣ୍ଡ ଅନୁଯାୟୀ ଯୋଗ୍ୟ ଋଣର ସମାଧାନ ପାଇଁ ପ୍ରତିଶ୍ରୁତି ଦେଉଛୁ:',
    },
    'hr4xdt44': {
      'en': 'Checked',
      'or': 'ଯାଞ୍ଚ କରାଯାଇଛି',
    },
    '46tcdl7z': {
      'en':
          'I/We hereby certify that the above information is true to the best of my knowledge.',
      'or':
          'ମୁଁ/ଆମେ ଏହାଦ୍ୱାରା ପ୍ରମାଣିତ କରୁଛୁ ଯେ ଉପରୋକ୍ତ ସୂଚନା ମୋର ସର୍ବୋତ୍ତମ ଜ୍ଞାନ ଅନୁସାରେ ସତ୍ୟ।',
    },
    'bl0to544': {
      'en': 'Checked',
      'or': 'ଯାଞ୍ଚ କରାଯାଇଛି',
    },
    'nw9owm97': {
      'en': 'Documents',
      'or': 'ଡକ୍ୟୁମେଣ୍ଟଗୁଡିକ',
    },
    'skdra3es': {
      'en': 'Acknowledgement Slip',
      'or': 'ସ୍ୱୀକୃତି ସ୍ଲିପ୍',
    },
    'hutcu98u': {
      'en': 'Download',
      'or': 'ଡାଉନଲୋଡ୍ କରନ୍ତୁ',
    },
    'adunzd49': {
      'en': 'Memorandom Branch',
      'or': 'ସ୍ମାରକୀ ଶାଖା',
    },
    'gol1bf7w': {
      'en': 'Download',
      'or': 'ଡାଉନଲୋଡ୍ କରନ୍ତୁ',
    },
    'ayq1xvza': {
      'en': 'No Due Certificate',
      'or': 'କୌଣସି ଦେୟ ପ୍ରମାଣପତ୍ର ନାହିଁ',
    },
    'k0nqce4k': {
      'en': 'Download',
      'or': 'ଡାଉନଲୋଡ୍ କରନ୍ତୁ',
    },
    '5at0oedh': {
      'en': 'Reject',
      'or': 'ପ୍ରତ୍ୟାଖ୍ୟାନ କରନ୍ତୁ',
    },
    'pp7kupa6': {
      'en': 'Approved',
      'or': 'ଅନୁମୋଦିତ ହୋଇଛି',
    },
    'f8nlstbn': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    'wvu817c1': {
      'en': '1',
      'or': '୧',
    },
    'on93djaz': {
      'en': 'General Settings',
      'or': 'ସାଧାରଣ ସେଟିଂ',
    },
    'gtufpe21': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    '43g3xryp': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    'y8hfzm7n': {
      'en': 'Edit',
      'or': 'ସମ୍ପାଦନ କରନ୍ତୁ',
    },
    '52682fl7': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    'jhmk2es0': {
      'en': 'Amos',
      'or': 'ଆମୋଷ',
    },
    'ekdmbd4f': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    'qek8y661': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    'mw5otmny': {
      'en': 'Email address',
      'or': 'ଇମେଲ ଠିକଣା',
    },
    'dj9dgvg3': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    'oadum1gl': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    'dff2e85y': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    'nsqircfn': {
      'en': 'Languages',
      'or': 'ଭାଷାଗୁଡ଼ିକ',
    },
    'mf9bie99': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    'smp75heo': {
      'en': 'Change',
      'or': 'ପରିବର୍ତ୍ତନ କରନ୍ତୁ',
    },
    'idppzo3a': {
      'en': 'App appearance',
      'or': 'ଆପ୍‌ର ଦୃଶ୍ୟମାନତା',
    },
    'osfg31gp': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    '06praxv2': {
      'en': 'Light mode',
      'or': 'ଲାଇଟ୍ ମୋଡ୍',
    },
    'hfragnzp': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'r67a6kv7': {
      'en': 'System preference',
      'or': 'ସିଷ୍ଟମର ପସନ୍ଦ',
    },
    'rurzvb2e': {
      'en': 'Help and Support',
      'or': 'ସାହାଯ୍ୟ ଏବଂ ସମର୍ଥନ',
    },
    '836l1nkp': {
      'en': 'Looking for info about us?',
      'or': 'ଆମ ବିଷୟରେ ସୂଚନା ଚାହୁଁଛନ୍ତି କି?',
    },
    'yjex29ss': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    '2yks4oax': {
      'en': 'Tips on how to use Pandora?',
      'or': 'ପାଣ୍ଡୋରା ବ୍ୟବହାର କରିବା ପାଇଁ ଟିପ୍ସ?',
    },
    '66335mlb': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    '3s99yn1e': {
      'en': 'Need something else?',
      'or': 'ଆଉ କିଛି ଦରକାର କି?',
    },
    'c3573w3z': {
      'en': 'Contact support',
      'or': 'ସହାୟତା ପାଇଁ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    '1mbaacy7': {
      'en': 'FAQs',
      'or': 'ସାଧାରଣ ପ୍ରଶ୍ନ',
    },
    'xquebmgv': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // ViewFormDetails
  {
    '449rzy91': {
      'en': 'Details',
      'or': 'ବିବରଣୀ',
    },
    'a4jnkq04': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'ubh1m92k': {
      'en': 'Profile Details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    'cuktsra3': {
      'en': 'Loan Number: ',
      'or': 'ଋଣ ନମ୍ବର:',
    },
    'vykho0ih': {
      'en': 'First Name: ',
      'or': 'ପ୍ରଥମ ନାମ:',
    },
    'dqincaue': {
      'en': 'Last Name: ',
      'or': 'ଶେଷ ନାମ:',
    },
    '2d1r9tbk': {
      'en': 'Number: ',
      'or': 'ସଂଖ୍ୟା:',
    },
    '9ss0n0pe': {
      'en': 'E-Mail: ',
      'or': 'ଇ-ମେଲ୍:',
    },
    'ugwl4a97': {
      'en': 'Street address: ',
      'or': 'ରାସ୍ତା ଠିକଣା:',
    },
    '4y1j79ii': {
      'en': 'State:',
      'or': 'ଅବସ୍ଥା:',
    },
    'gqgllpuv': {
      'en': 'City:',
      'or': 'ସହର:',
    },
    'r2e798rk': {
      'en': 'Pin-Code:',
      'or': 'ପିନ୍-କୋଡ୍:',
    },
    'myr5j9h6': {
      'en': 'Branch:',
      'or': 'ଶାଖା:',
    },
    'u9p9frd9': {
      'en': 'Total outstanding liablity to OSFC as on the date of application:',
      'or': 'ଆବେଦନ ତାରିଖ ଅନୁଯାୟୀ OSFC ପ୍ରତି ମୋଟ ବକେୟା ଦାୟିତ୍ବ:',
    },
    'npp9okbz': {
      'en': 'Nature of industry/product/type of the unit/company:',
      'or': 'ଶିଳ୍ପ/ଉତ୍ପାଦର ପ୍ରକୃତି/ୟୁନିଟ୍/କମ୍ପାନୀର ପ୍ରକାର:',
    },
    'hfw4a8ol': {
      'en':
          'The Present Level of operation of vehicle with Regn. No. (In case the unit/company is not in operation and reasons thereof.):',
      'or':
          'ରେଜିଷ୍ଟ୍ରେସନ ନମ୍ବର ସହିତ ଯାନର ବର୍ତ୍ତମାନର କାର୍ଯ୍ୟ ସ୍ତର (ଯଦି ୟୁନିଟ୍/କମ୍ପାନୀ କାର୍ଯ୍ୟକ୍ଷମ ନଥାଏ ଏବଂ ତାହାର କାରଣ):',
    },
    'v7ythefb': {
      'en':
          'Details of dues, to other institutions,Fls,Banks Including details of settlements reached with them if any.:',
      'or':
          'ଅନ୍ୟ ପ୍ରତିଷ୍ଠାନ, ଫ୍ଲାଇଟ, ବ୍ୟାଙ୍କକୁ ଦେୟ ପ୍ରଦାନର ବିବରଣୀ, ସେମାନଙ୍କ ସହିତ ହୋଇଥିବା ସମାଧାନର ବିବରଣୀ ସମେତ, ଯଦି କୌଣସି ଥାଏ:',
    },
    '22pdko20': {
      'en': 'Reasons of non-payment of Corporation\'s dues::',
      'or': 'ନିଗମର ଦେୟ ନଦେବାର କାରଣ::',
    },
    'koj3d6o6': {
      'en': 'Whether defaulter to other Banks/Fls, if so status of NPA?:',
      'or': 'ଅନ୍ୟ ବ୍ୟାଙ୍କ/ଫ୍ଲାନ୍ସର ଖିଲାପୀ କି, ଯଦି ଅଛି ତେବେ ଏନପିଏର ସ୍ଥିତି?:',
    },
    'gost96sy': {
      'en':
          'Sailient operational and financial hights of the unit/company for the last 3 financial years in case of disbursement of all eligible loans above rs.30.00 lakh. (Audited Balance Sheet & P/L A/c.of the unit/company for the last 3 years, and Net worth certificate of borrower/applicationt by the Chartered Accountant is enclosed.):',
      'or':
          '୩୦.୦୦ ଲକ୍ଷ ଟଙ୍କାରୁ ଅଧିକ ସମସ୍ତ ଯୋଗ୍ୟ ଋଣ ପ୍ରଦାନ କ୍ଷେତ୍ରରେ ୟୁନିଟ୍/କମ୍ପାନୀର ଗତ ୩ ଆର୍ଥିକ ବର୍ଷ ପାଇଁ ସକ୍ରିୟ କାର୍ଯ୍ୟକ୍ଷମ ଏବଂ ଆର୍ଥିକ ଉଚ୍ଚତା। (ଗତ ୩ ବର୍ଷ ପାଇଁ ୟୁନିଟ୍/କମ୍ପାନୀର ଅଡିଟେଡ୍ ବାଲାନ୍ସ ସିଟ୍ ଏବଂ ପି/ଏଲ୍/ସି, ଏବଂ ଚାଟାର୍ଡ ଆକାଉଣ୍ଟାଣ୍ଟଙ୍କ ଦ୍ୱାରା ଋଣଗ୍ରହୀତାଙ୍କ/ଆବେଦନର ନେଟ୍ ୱର୍ଥ ପ୍ରମାଣପତ୍ର ସଂଲଗ୍ନ କରାଯାଇଛି):',
    },
    'qq5zm82p': {
      'en': 'Reasons for settlement of loan dues under OTS:',
      'or': 'OTS ଅଧୀନରେ ଋଣ ଦେୟ ସମାଧାନର କାରଣ:',
    },
    '2yt81omy': {
      'en': 'Sources of payment of settlement amount:',
      'or': 'ସମାଧାନ ପରିମାଣର ଦେୟ ପାଇଁ ଉତ୍ସ:',
    },
    '8mt7nuq9': {
      'en': 'Terms of payment of the porposed OTS amount:',
      'or': 'ପ୍ରସ୍ତାବିତ OTS ରାଶିର ଦେୟ ସର୍ତ୍ତାବଳୀ:',
    },
    'vk9kqoek': {
      'en': 'Any other particulars that may be relevant to mention.',
      'or': 'ଉଲ୍ଲେଖ କରିବା ପାଇଁ ପ୍ରାସଙ୍ଗିକ ହୋଇପାରେ ଏପରି ଅନ୍ୟ କୌଣସି ବିବରଣୀ।',
    },
    'a21m8c9f': {
      'en':
          'I/We would request you to consider my/our above offer and advise me/us of the decision taken in this regard at an early date. I/we would be happy to provide any further information/clarification, if needed, to the corporation:',
      'or':
          'ମୁଁ/ଆମେ ଆପଣଙ୍କୁ ଅନୁରୋଧ କରିବୁ ଯେ ମୋର/ଆମର ଉପରୋକ୍ତ ପ୍ରସ୍ତାବକୁ ଶୀଘ୍ର ବିଚାର କରନ୍ତୁ ଏବଂ ଏ ସମ୍ପର୍କରେ ନିଆଯାଇଥିବା ନିଷ୍ପତ୍ତି ବିଷୟରେ ମୋତେ/ଆମକୁ ଅବଗତ କରାନ୍ତୁ। ଆବଶ୍ୟକ ହେଲେ, ମୁଁ/ଆମେ ନିଗମକୁ ଅଧିକ ସୂଚନା/ସ୍ପଷ୍ଟୀକରଣ ପ୍ରଦାନ କରିବାକୁ ଖୁସି ହେବୁ:',
    },
    '5fb3eq31': {
      'en': 'Checked',
      'or': 'ଯାଞ୍ଚ କରାଯାଇଛି',
    },
    '2xa5q6h8': {
      'en':
          'I/We do here by undertake that I/we Will continue payment towerds my/our current dues in terms of loan agrement pending settlement of dues under the OTS Policy-2011. I/We shall not have any claim on delay decision and/or an unfavorable decision on my/our loan settlemente claims/dues. I/We will not have any claims in case the corporation adjusts the initial deposit(s)  and subsequent payment made for settlement of dues under the OTS Policy-2011 towerds normal loan dues on non-compiance of thge terms and conditions of the policy by me/us either in part or full within stipulated time as prescribed in the policy:',
      'or':
          'ମୁଁ/ଆମେ ଏଠାରେ ପ୍ରତିଶ୍ରୁତି ଦେଉଛୁ ଯେ ମୁଁ/ଆମେ OTS ନୀତି-2011 ଅନୁଯାୟୀ ଦେୟ ସମାଧାନ ପାଇଁ ବିଚାରାଧୀନ ଋଣ ଚୁକ୍ତି ଅନୁଯାୟୀ ମୋର/ଆମର ବର୍ତ୍ତମାନର ଦେୟ ପ୍ରଦାନ ଜାରି ରଖିବୁ। ମୋର/ଆମର ଋଣ ସମାଧାନ ଦାବି/ପାଏ ଉପରେ ବିଳମ୍ବ ନିଷ୍ପତ୍ତି ଏବଂ/ଅଥବା ପ୍ରତିକୂଳ ନିଷ୍ପତ୍ତି ଉପରେ ମୋର/ଆମର କୌଣସି ଦାବି ରହିବ ନାହିଁ। ଯଦି ନିଗମ OTS ନୀତି-2011 ଅନୁଯାୟୀ ଦେୟ ସମାଧାନ ପାଇଁ ପ୍ରାରମ୍ଭିକ ଜମା(ଗୁଡ଼ିକ) ଏବଂ ପରବର୍ତ୍ତୀ ଦେୟକୁ ମୋ/ଆମ ଦ୍ୱାରା ନୀତିରେ ନିର୍ଦ୍ଧାରିତ ସମୟ ମଧ୍ୟରେ ଆଂଶିକ କିମ୍ବା ପୂର୍ଣ୍ଣ ଭାବରେ ପରିଚାଳନା ନକରେ ସମାୟୋଜନ କରେ, ତେବେ ମୋର/ଆମର କୌଣସି ଦାବି ରହିବ ନାହିଁ:',
    },
    's0e5ind3': {
      'en': 'Checked',
      'or': 'ଯାଞ୍ଚ କରାଯାଇଛି',
    },
    'zrv17740': {
      'en':
          'I/We hereby undertake to pay the settlement of eligible loans as per the scheme parameters:',
      'or':
          'ମୁଁ/ଆମେ ଯୋଜନାର ମାନଦଣ୍ଡ ଅନୁଯାୟୀ ଯୋଗ୍ୟ ଋଣର ସମାଧାନ ପାଇଁ ପ୍ରତିଶ୍ରୁତି ଦେଉଛୁ:',
    },
    'jo17dtcn': {
      'en': 'Checked',
      'or': 'ଯାଞ୍ଚ କରାଯାଇଛି',
    },
    '5ftvr3wh': {
      'en':
          'I/We hereby certify that the above information is true to the best of my knowledge.',
      'or':
          'ମୁଁ/ଆମେ ଏହାଦ୍ୱାରା ପ୍ରମାଣିତ କରୁଛୁ ଯେ ଉପରୋକ୍ତ ସୂଚନା ମୋର ସର୍ବୋତ୍ତମ ଜ୍ଞାନ ଅନୁସାରେ ସତ୍ୟ।',
    },
    '27tn0h33': {
      'en': 'Checked',
      'or': 'ଯାଞ୍ଚ କରାଯାଇଛି',
    },
    '1lp22kjf': {
      'en': 'Documents',
      'or': 'ଡକ୍ୟୁମେଣ୍ଟଗୁଡିକ',
    },
    'te59i6rm': {
      'en': 'Acknowledgement Slip',
      'or': 'ସ୍ୱୀକୃତି ସ୍ଲିପ୍',
    },
    '2z6potgs': {
      'en': 'Download',
      'or': 'ଡାଉନଲୋଡ୍ କରନ୍ତୁ',
    },
    'myl9pzur': {
      'en': 'Memorandom Branch',
      'or': 'ସ୍ମାରକୀ ଶାଖା',
    },
    'h2v7ugog': {
      'en': 'Download',
      'or': 'ଡାଉନଲୋଡ୍ କରନ୍ତୁ',
    },
    'ipyo8p21': {
      'en': 'No Due Certificate',
      'or': 'କୌଣସି ଦେୟ ପ୍ରମାଣପତ୍ର ନାହିଁ',
    },
    '5lrupg4z': {
      'en': 'Download',
      'or': 'ଡାଉନଲୋଡ୍ କରନ୍ତୁ',
    },
    '72py3jvv': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    '9nwx27n3': {
      'en': '1',
      'or': '୧',
    },
    'vgbltt29': {
      'en': 'General Settings',
      'or': 'ସାଧାରଣ ସେଟିଂ',
    },
    'ztg1dplc': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    'nzin3wz3': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    'aufifpyl': {
      'en': 'Edit',
      'or': 'ସମ୍ପାଦନ କରନ୍ତୁ',
    },
    '2darar46': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    '4ccd4zps': {
      'en': 'Amos',
      'or': 'ଆମୋଷ',
    },
    '542vghd9': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    '867x6nke': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    'jn9gkzad': {
      'en': 'Email address',
      'or': 'ଇମେଲ ଠିକଣା',
    },
    'w06pqvpk': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    '1zq4ie1s': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    'wzpygct2': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    'wclx0t6k': {
      'en': 'Languages',
      'or': 'ଭାଷାଗୁଡ଼ିକ',
    },
    '67nj2qdk': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    'qcalcr76': {
      'en': 'Change',
      'or': 'ପରିବର୍ତ୍ତନ କରନ୍ତୁ',
    },
    'ermiz40y': {
      'en': 'App appearance',
      'or': 'ଆପ୍‌ର ଦୃଶ୍ୟମାନତା',
    },
    'ru0le6hj': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'su1dk09w': {
      'en': 'Light mode',
      'or': 'ଲାଇଟ୍ ମୋଡ୍',
    },
    'nx9hv7nj': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'r4scr4wn': {
      'en': 'System preference',
      'or': 'ସିଷ୍ଟମର ପସନ୍ଦ',
    },
    '3br8ggup': {
      'en': 'Help and Support',
      'or': 'ସାହାଯ୍ୟ ଏବଂ ସମର୍ଥନ',
    },
    'ik7ekne3': {
      'en': 'Looking for info about us?',
      'or': 'ଆମ ବିଷୟରେ ସୂଚନା ଚାହୁଁଛନ୍ତି କି?',
    },
    'mksb6mfr': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'tknb0z1w': {
      'en': 'Tips on how to use Pandora?',
      'or': 'ପାଣ୍ଡୋରା ବ୍ୟବହାର କରିବା ପାଇଁ ଟିପ୍ସ?',
    },
    'a5b6ntt8': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    '7p19zwfw': {
      'en': 'Need something else?',
      'or': 'ଆଉ କିଛି ଦରକାର କି?',
    },
    '563vbo8v': {
      'en': 'Contact support',
      'or': 'ସହାୟତା ପାଇଁ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    'gs3cbno1': {
      'en': 'FAQs',
      'or': 'ସାଧାରଣ ପ୍ରଶ୍ନ',
    },
    '3e4r70hh': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // SettlementOrder
  {
    'fz0tscov': {
      'en': 'Settlement Order',
      'or': 'ସମାଧାନ ଆଦେଶ',
    },
    'dqll8ose': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'a77okifo': {
      'en': 'Upload Settlement Order',
      'or': 'ସମାଧାନ ଅର୍ଡର ଅପଲୋଡ୍ କରନ୍ତୁ',
    },
    'q5rjtbj2': {
      'en': 'Enter Loan number...',
      'or': 'ଋଣ ନମ୍ବର ପ୍ରବେଶ କରନ୍ତୁ...',
    },
    '5tp1qou0': {
      'en': 'Upload PDF',
      'or': 'PDF ଅପଲୋଡ୍ କରନ୍ତୁ',
    },
    '4198121z': {
      'en': 'Submit',
      'or': 'ଦାଖଲ କରନ୍ତୁ',
    },
    'k8gv7lur': {
      'en': 'Enter Loan number... is required',
      'or': '',
    },
    'gz1a3jzi': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'm4ao2rwj': {
      'en': 'Status',
      'or': 'ସ୍ଥିତି',
    },
    'k00df796': {
      'en': 'Search Loan Number',
      'or': 'ଋଣ ନମ୍ବର ଖୋଜନ୍ତୁ',
    },
    '74fw3cf4': {
      'en': 'Search',
      'or': 'ଖୋଜନ୍ତୁ',
    },
    'u7di4a6p': {
      'en': 'Clear',
      'or': 'ଖାଲି କରନ୍ତୁ',
    },
    'z90w7ccv': {
      'en': 'Search Loan Number is required',
      'or': '',
    },
    'x6spew88': {
      'en': 'Enter full 13-character loan number.',
      'or': '',
    },
    'sj6eh078': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'jj4m9lke': {
      'en': 'Loan Number',
      'or': 'ଋଣ ନମ୍ବର',
    },
    'u7e5tefz': {
      'en': 'User Name',
      'or': 'ଉପଯୋଗକର୍ତ୍ତା ନାମ',
    },
    'wwuz3tx7': {
      'en': 'Apply Date',
      'or': 'ଆବେଦନ ତାରିଖ',
    },
    'bcfuiyzh': {
      'en': 'Uploaded Date',
      'or': 'ଅପଲୋଡ୍ କରାଯାଇଥିବା ତାରିଖ',
    },
    'ntq0my8c': {
      'en': 'Actions',
      'or': 'କାର୍ଯ୍ୟ',
    },
    'kb7afjns': {
      'en': 'Rows per pages:',
      'or': 'ପ୍ରତି ପୃଷ୍ଠା ଧାଡ଼ି:',
    },
    'byij0iwu': {
      'en': '10',
      'or': '୧୦',
    },
    '0e6wrnwu': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'iuzc4nqg': {
      'en': '5',
      'or': '5',
    },
    'elon12hv': {
      'en': '10',
      'or': '୧୦',
    },
    'fq9qm6th': {
      'en': '25',
      'or': '୨୫',
    },
    'ybhe27gu': {
      'en': '50',
      'or': '୫୦',
    },
    'uhmzweyt': {
      'en': '100',
      'or': '୧୦୦',
    },
    'o3zowkw4': {
      'en': '-',
      'or': '-',
    },
    'qqy0cwys': {
      'en': ' of ',
      'or': 'ର',
    },
    'iy6p2jzk': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // OtsFormViewUsersadmin
  {
    's3u4akla': {
      'en': 'Details',
      'or': 'ବିବରଣୀ',
    },
    'ph77jowd': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'o7rhzuu2': {
      'en': 'Profile Details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    'dxcokpcf': {
      'en': 'Loan Number: ',
      'or': 'ଋଣ ନମ୍ବର:',
    },
    'yqic69xx': {
      'en': 'First Name: ',
      'or': 'ପ୍ରଥମ ନାମ:',
    },
    '5b56yszi': {
      'en': 'Last Name: ',
      'or': 'ଶେଷ ନାମ:',
    },
    'stsublf9': {
      'en': 'Number: ',
      'or': 'ସଂଖ୍ୟା:',
    },
    'j39wg4gh': {
      'en': 'E-Mail: ',
      'or': 'ଇ-ମେଲ୍:',
    },
    'jg4fm4yn': {
      'en': 'Street address: ',
      'or': 'ରାସ୍ତା ଠିକଣା:',
    },
    'peh0qkwd': {
      'en': 'State:',
      'or': 'ଅବସ୍ଥା:',
    },
    'nul3h3r9': {
      'en': 'City:',
      'or': 'ସହର:',
    },
    'cnu1luk9': {
      'en': 'Pin-Code:',
      'or': 'ପିନ୍-କୋଡ୍:',
    },
    'cm4p0938': {
      'en': 'Branch:',
      'or': 'ଶାଖା:',
    },
    '2oqfcwj8': {
      'en': 'Total outstanding liablity to OSFC as on the date of application:',
      'or': 'ଆବେଦନ ତାରିଖ ଅନୁଯାୟୀ OSFC ପ୍ରତି ମୋଟ ବକେୟା ଦାୟିତ୍ବ:',
    },
    'dsnekncz': {
      'en': 'Nature of industry/product/type of the unit/company:',
      'or': 'ଶିଳ୍ପ/ଉତ୍ପାଦର ପ୍ରକୃତି/ୟୁନିଟ୍/କମ୍ପାନୀର ପ୍ରକାର:',
    },
    'r8ug2ft8': {
      'en':
          'The Present Level of operation of vehicle with Regn. No. (In case the unit/company is not in operation and reasons thereof.):',
      'or':
          'ରେଜିଷ୍ଟ୍ରେସନ ନମ୍ବର ସହିତ ଯାନର ବର୍ତ୍ତମାନର କାର୍ଯ୍ୟ ସ୍ତର (ଯଦି ୟୁନିଟ୍/କମ୍ପାନୀ କାର୍ଯ୍ୟକ୍ଷମ ନଥାଏ ଏବଂ ତାହାର କାରଣ):',
    },
    'y1lw8cc6': {
      'en':
          'Details of dues, to other institutions,Fls,Banks Including details of settlements reached with them if any.:',
      'or':
          'ଅନ୍ୟ ପ୍ରତିଷ୍ଠାନ, ଫ୍ଲାଇଟ, ବ୍ୟାଙ୍କକୁ ଦେୟ ପ୍ରଦାନର ବିବରଣୀ, ସେମାନଙ୍କ ସହିତ ହୋଇଥିବା ସମାଧାନର ବିବରଣୀ ସମେତ, ଯଦି କୌଣସି ଥାଏ:',
    },
    'vmd19mcf': {
      'en': 'Reasons of non-payment of Corporation\'s dues::',
      'or': 'ନିଗମର ଦେୟ ନଦେବାର କାରଣ::',
    },
    '32grl19o': {
      'en': 'Whether defaulter to other Banks/Fls, if so status of NPA?:',
      'or': 'ଅନ୍ୟ ବ୍ୟାଙ୍କ/ଫ୍ଲାନ୍ସର ଖିଲାପୀ କି, ଯଦି ଅଛି ତେବେ ଏନପିଏର ସ୍ଥିତି?:',
    },
    '8uaxegol': {
      'en':
          'Sailient operational and financial hights of the unit/company for the last 3 financial years in case of disbursement of all eligible loans above rs.30.00 lakh. (Audited Balance Sheet & P/L A/c.of the unit/company for the last 3 years, and Net worth certificate of borrower/applicationt by the Chartered Accountant is enclosed.):',
      'or':
          '୩୦.୦୦ ଲକ୍ଷ ଟଙ୍କାରୁ ଅଧିକ ସମସ୍ତ ଯୋଗ୍ୟ ଋଣ ପ୍ରଦାନ କ୍ଷେତ୍ରରେ ୟୁନିଟ୍/କମ୍ପାନୀର ଗତ ୩ ଆର୍ଥିକ ବର୍ଷ ପାଇଁ ସକ୍ରିୟ କାର୍ଯ୍ୟକ୍ଷମ ଏବଂ ଆର୍ଥିକ ଉଚ୍ଚତା। (ଗତ ୩ ବର୍ଷ ପାଇଁ ୟୁନିଟ୍/କମ୍ପାନୀର ଅଡିଟେଡ୍ ବାଲାନ୍ସ ସିଟ୍ ଏବଂ ପି/ଏଲ୍/ସି, ଏବଂ ଚାଟାର୍ଡ ଆକାଉଣ୍ଟାଣ୍ଟଙ୍କ ଦ୍ୱାରା ଋଣଗ୍ରହୀତାଙ୍କ/ଆବେଦନର ନେଟ୍ ୱର୍ଥ ପ୍ରମାଣପତ୍ର ସଂଲଗ୍ନ କରାଯାଇଛି):',
    },
    'fchf6zw8': {
      'en': 'Reasons for settlement of loan dues under OTS:',
      'or': 'OTS ଅଧୀନରେ ଋଣ ଦେୟ ସମାଧାନର କାରଣ:',
    },
    'vb0492rk': {
      'en': 'Sources of payment of settlement amount:',
      'or': 'ସମାଧାନ ପରିମାଣର ଦେୟ ପାଇଁ ଉତ୍ସ:',
    },
    'glqmqbkk': {
      'en': 'Terms of payment of the porposed OTS amount:',
      'or': 'ପ୍ରସ୍ତାବିତ OTS ରାଶିର ଦେୟ ସର୍ତ୍ତାବଳୀ:',
    },
    'gpnfg5x5': {
      'en': 'Any other particulars that may be relevant to mention.',
      'or': 'ଉଲ୍ଲେଖ କରିବା ପାଇଁ ପ୍ରାସଙ୍ଗିକ ହୋଇପାରେ ଏପରି ଅନ୍ୟ କୌଣସି ବିବରଣୀ।',
    },
    'ggmlgr7p': {
      'en':
          'I/We would request you to consider my/our above offer and advise me/us of the decision taken in this regard at an early date. I/we would be happy to provide any further information/clarification, if needed, to the corporation:',
      'or':
          'ମୁଁ/ଆମେ ଆପଣଙ୍କୁ ଅନୁରୋଧ କରିବୁ ଯେ ମୋର/ଆମର ଉପରୋକ୍ତ ପ୍ରସ୍ତାବକୁ ଶୀଘ୍ର ବିଚାର କରନ୍ତୁ ଏବଂ ଏ ସମ୍ପର୍କରେ ନିଆଯାଇଥିବା ନିଷ୍ପତ୍ତି ବିଷୟରେ ମୋତେ/ଆମକୁ ଅବଗତ କରାନ୍ତୁ। ଆବଶ୍ୟକ ହେଲେ, ମୁଁ/ଆମେ ନିଗମକୁ ଅଧିକ ସୂଚନା/ସ୍ପଷ୍ଟୀକରଣ ପ୍ରଦାନ କରିବାକୁ ଖୁସି ହେବୁ:',
    },
    'rspdp3ml': {
      'en': 'Checked',
      'or': 'ଯାଞ୍ଚ କରାଯାଇଛି',
    },
    '7hrrdud7': {
      'en':
          'I/We do here by undertake that I/we Will continue payment towerds my/our current dues in terms of loan agrement pending settlement of dues under the OTS Policy-2011. I/We shall not have any claim on delay decision and/or an unfavorable decision on my/our loan settlemente claims/dues. I/We will not have any claims in case the corporation adjusts the initial deposit(s)  and subsequent payment made for settlement of dues under the OTS Policy-2011 towerds normal loan dues on non-compiance of thge terms and conditions of the policy by me/us either in part or full within stipulated time as prescribed in the policy:',
      'or':
          'ମୁଁ/ଆମେ ଏଠାରେ ପ୍ରତିଶ୍ରୁତି ଦେଉଛୁ ଯେ ମୁଁ/ଆମେ OTS ନୀତି-2011 ଅନୁଯାୟୀ ଦେୟ ସମାଧାନ ପାଇଁ ବିଚାରାଧୀନ ଋଣ ଚୁକ୍ତି ଅନୁଯାୟୀ ମୋର/ଆମର ବର୍ତ୍ତମାନର ଦେୟ ପ୍ରଦାନ ଜାରି ରଖିବୁ। ମୋର/ଆମର ଋଣ ସମାଧାନ ଦାବି/ପାଏ ଉପରେ ବିଳମ୍ବ ନିଷ୍ପତ୍ତି ଏବଂ/ଅଥବା ପ୍ରତିକୂଳ ନିଷ୍ପତ୍ତି ଉପରେ ମୋର/ଆମର କୌଣସି ଦାବି ରହିବ ନାହିଁ। ଯଦି ନିଗମ OTS ନୀତି-2011 ଅନୁଯାୟୀ ଦେୟ ସମାଧାନ ପାଇଁ ପ୍ରାରମ୍ଭିକ ଜମା(ଗୁଡ଼ିକ) ଏବଂ ପରବର୍ତ୍ତୀ ଦେୟକୁ ମୋ/ଆମ ଦ୍ୱାରା ନୀତିରେ ନିର୍ଦ୍ଧାରିତ ସମୟ ମଧ୍ୟରେ ଆଂଶିକ କିମ୍ବା ପୂର୍ଣ୍ଣ ଭାବରେ ପରିଚାଳନା ନକରେ ସମାୟୋଜନ କରେ, ତେବେ ମୋର/ଆମର କୌଣସି ଦାବି ରହିବ ନାହିଁ:',
    },
    '2k87mg88': {
      'en': 'Checked',
      'or': 'ଯାଞ୍ଚ କରାଯାଇଛି',
    },
    'qdhrs8kg': {
      'en':
          'I/We hereby undertake to pay the settlement of eligible loans as per the scheme parameters:',
      'or':
          'ମୁଁ/ଆମେ ଯୋଜନାର ମାନଦଣ୍ଡ ଅନୁଯାୟୀ ଯୋଗ୍ୟ ଋଣର ସମାଧାନ ପାଇଁ ପ୍ରତିଶ୍ରୁତି ଦେଉଛୁ:',
    },
    'iiflwbef': {
      'en': 'Checked',
      'or': 'ଯାଞ୍ଚ କରାଯାଇଛି',
    },
    'qmeefiwe': {
      'en':
          'I/We hereby certify that the above information is true to the best of my knowledge.',
      'or':
          'ମୁଁ/ଆମେ ଏହାଦ୍ୱାରା ପ୍ରମାଣିତ କରୁଛୁ ଯେ ଉପରୋକ୍ତ ସୂଚନା ମୋର ସର୍ବୋତ୍ତମ ଜ୍ଞାନ ଅନୁସାରେ ସତ୍ୟ।',
    },
    'b6j4saph': {
      'en': 'Checked',
      'or': 'ଯାଞ୍ଚ କରାଯାଇଛି',
    },
    '8giyo4ca': {
      'en': 'Documents',
      'or': 'ଡକ୍ୟୁମେଣ୍ଟଗୁଡିକ',
    },
    'egtvfzx6': {
      'en': 'Acknowledgement Slip',
      'or': 'ସ୍ୱୀକୃତି ସ୍ଲିପ୍',
    },
    'omvdd3pf': {
      'en': 'Download',
      'or': 'ଡାଉନଲୋଡ୍ କରନ୍ତୁ',
    },
    'xh0vma92': {
      'en': 'Memorandom Branch',
      'or': 'ସ୍ମାରକୀ ଶାଖା',
    },
    'm54ksdoi': {
      'en': 'Download',
      'or': 'ଡାଉନଲୋଡ୍ କରନ୍ତୁ',
    },
    'nyaax9cv': {
      'en': 'No Due Certificate',
      'or': 'କୌଣସି ଦେୟ ପ୍ରମାଣପତ୍ର ନାହିଁ',
    },
    'zv7s06aj': {
      'en': 'Re-Upload',
      'or': 'ପୁନଃ ଅପଲୋଡ୍ କରନ୍ତୁ',
    },
    'caqpsl4r': {
      'en': 'Download',
      'or': 'ଡାଉନଲୋଡ୍ କରନ୍ତୁ',
    },
    'p59zzal5': {
      'en': 'Settlement Order',
      'or': 'ସମାଧାନ ଆଦେଶ',
    },
    'g1czi6jv': {
      'en': 'Re-Upload',
      'or': 'ପୁନଃ ଅପଲୋଡ୍ କରନ୍ତୁ',
    },
    '4krjrmdx': {
      'en': 'Download',
      'or': 'ଡାଉନଲୋଡ୍ କରନ୍ତୁ',
    },
    '9oqfvi5u': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    'cq96m7wx': {
      'en': '1',
      'or': '୧',
    },
    'lbxiwza1': {
      'en': 'General Settings',
      'or': 'ସାଧାରଣ ସେଟିଂ',
    },
    'fzm1d33a': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    'hmbesinr': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    'y5sx2rlf': {
      'en': 'Edit',
      'or': 'ସମ୍ପାଦନ କରନ୍ତୁ',
    },
    'ovtfvxhg': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    'mhg7pwc6': {
      'en': 'Amos',
      'or': 'ଆମୋଷ',
    },
    'gtt80ij3': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    '4tv3zitu': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    '6x3u8thp': {
      'en': 'Email address',
      'or': 'ଇମେଲ ଠିକଣା',
    },
    '24kb37zz': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    'h9lmqar1': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    'b71vhacs': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    's495zsjj': {
      'en': 'Languages',
      'or': 'ଭାଷାଗୁଡ଼ିକ',
    },
    'ysuzgssn': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    'hg0bz32h': {
      'en': 'Change',
      'or': 'ପରିବର୍ତ୍ତନ କରନ୍ତୁ',
    },
    '4epg18d8': {
      'en': 'App appearance',
      'or': 'ଆପ୍‌ର ଦୃଶ୍ୟମାନତା',
    },
    'jpaylovd': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    '3pz55n4u': {
      'en': 'Light mode',
      'or': 'ଲାଇଟ୍ ମୋଡ୍',
    },
    '5a4gj03b': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'y7g6xew1': {
      'en': 'System preference',
      'or': 'ସିଷ୍ଟମର ପସନ୍ଦ',
    },
    'flrmkc6y': {
      'en': 'Help and Support',
      'or': 'ସାହାଯ୍ୟ ଏବଂ ସମର୍ଥନ',
    },
    'dv1if0g9': {
      'en': 'Looking for info about us?',
      'or': 'ଆମ ବିଷୟରେ ସୂଚନା ଚାହୁଁଛନ୍ତି କି?',
    },
    'f58z2t7h': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    '07nlaq0e': {
      'en': 'Tips on how to use Pandora?',
      'or': 'ପାଣ୍ଡୋରା ବ୍ୟବହାର କରିବା ପାଇଁ ଟିପ୍ସ?',
    },
    '0jqdk0sn': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'jweqpdjf': {
      'en': 'Need something else?',
      'or': 'ଆଉ କିଛି ଦରକାର କି?',
    },
    'crqvfb36': {
      'en': 'Contact support',
      'or': 'ସହାୟତା ପାଇଁ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    'bgoz758t': {
      'en': 'FAQs',
      'or': 'ସାଧାରଣ ପ୍ରଶ୍ନ',
    },
    'urunce8k': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // SettlementOrderUser
  {
    's8n5y378': {
      'en': 'Settlement Order',
      'or': 'ସମାଧାନ ଆଦେଶ',
    },
    '1wd4z7o6': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'u16xu1ga': {
      'en': 'Status',
      'or': 'ସ୍ଥିତି',
    },
    'awoncm2i': {
      'en': 'Search Loan Number',
      'or': 'ଋଣ ନମ୍ବର ଖୋଜନ୍ତୁ',
    },
    'cv0wkqug': {
      'en': 'Search',
      'or': 'ଖୋଜନ୍ତୁ',
    },
    'p0hk1bkm': {
      'en': 'Clear',
      'or': 'ଖାଲି କରନ୍ତୁ',
    },
    'zr53n234': {
      'en': 'Search Loan Number is required',
      'or': '',
    },
    'jhdffql6': {
      'en': 'Enter full 13-character loan number.',
      'or': '',
    },
    'ikp3q49u': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'i4yrfrqh': {
      'en': 'Loan Number',
      'or': 'ଋଣ ନମ୍ବର',
    },
    'ez7kh5o0': {
      'en': 'User Name',
      'or': 'ଉପଯୋଗକର୍ତ୍ତା ନାମ',
    },
    '828zuz6y': {
      'en': 'Apply Date',
      'or': 'ଆବେଦନ ତାରିଖ',
    },
    'osnqxdml': {
      'en': 'Uploaded Date',
      'or': 'ଅପଲୋଡ୍ କରାଯାଇଥିବା ତାରିଖ',
    },
    'bpacaafc': {
      'en': 'Actions',
      'or': 'କାର୍ଯ୍ୟ',
    },
    'eykcdol9': {
      'en': 'Rows per pages:',
      'or': 'ପ୍ରତି ପୃଷ୍ଠା ଧାଡ଼ି:',
    },
    'pimgl26f': {
      'en': '10',
      'or': '୧୦',
    },
    '034a4vtn': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'cjaad3uc': {
      'en': '5',
      'or': '5',
    },
    'vmqafrej': {
      'en': '10',
      'or': '୧୦',
    },
    '3bnieapp': {
      'en': '25',
      'or': '୨୫',
    },
    'q2tf3rqh': {
      'en': '50',
      'or': '୫୦',
    },
    'r6ry09d0': {
      'en': '100',
      'or': '୧୦୦',
    },
    'd993luuj': {
      'en': '-',
      'or': '-',
    },
    '4cykjg5p': {
      'en': ' of ',
      'or': 'ର',
    },
    'gtl1av7x': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // ClaimDocuments
  {
    'fjwae5ur': {
      'en': 'Claim Document Submission',
      'or': 'ଦାବି ଡକ୍ୟୁମେଣ୍ଟ ଦାଖଲ',
    },
    'vql2otvs': {
      'en': 'Upload required documents for rebate claim processing',
      'or':
          'ରିହାତି ଦାବି ପ୍ରକ୍ରିୟାକରଣ ପାଇଁ ଆବଶ୍ୟକୀୟ ଡକ୍ୟୁମେଣ୍ଟଗୁଡ଼ିକ ଅପଲୋଡ୍ କରନ୍ତୁ।',
    },
    'ezhj4nxi': {
      'en': 'Last login: Today, 09:30 AM',
      'or': 'ଶେଷ ଲଗଇନ୍: ଆଜି, ସକାଳ ୦୯:୩୦',
    },
    'l9ldm2rz': {
      'en': 'Prerequisites',
      'or': 'ପୂର୍ବ ଆବଶ୍ୟକତା',
    },
    's25958v6': {
      'en': 'Opening Stock Submitted',
      'or': 'ଓପନିଂ ଷ୍ଟକ୍ ଦାଖଲ କରାଯାଇଛି',
    },
    'znyxdxqx': {
      'en': 'Closing Stock Submitted',
      'or': 'କ୍ଲୋଜିଂ ଷ୍ଟକ୍ ଦାଖଲ କରାଯାଇଛି',
    },
    'nkahxcr4': {
      'en': 'Action Required',
      'or': 'ପଦକ୍ଷେପ ଆବଶ୍ୟକ',
    },
    'mc4504al': {
      'en':
          'You must submit both opening and closing stock before uploading claim documents.',
      'or':
          'ଦାବି ଡକ୍ୟୁମେଣ୍ଟ ଅପଲୋଡ୍ କରିବା ପୂର୍ବରୁ ଆପଣଙ୍କୁ ଉଭୟ ଖୋଲିବା ଏବଂ ବନ୍ଦ କରିବା ଷ୍ଟକ୍ ଦାଖଲ କରିବାକୁ ପଡିବ।',
    },
    '3hr0t3bb': {
      'en': 'Select Festival Name',
      'or': 'ମହୋତ୍ସବର ନାମ ଚୟନ କରନ୍ତୁ',
    },
    'kkfr4pgw': {
      'en': 'Festival Name:',
      'or': 'ମହୋତ୍ସବର ନାମ:',
    },
    '97thhg14': {
      'en': 'Select...',
      'or': 'ଚୟନ କରନ୍ତୁ...',
    },
    'zli9ynr8': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'z4vutlns': {
      'en': 'Option 1',
      'or': 'ବିକଳ୍ପ 1',
    },
    '3y4vwcei': {
      'en': 'Option 2',
      'or': 'ବିକଳ୍ପ 2',
    },
    '2iwyab4f': {
      'en': 'Option 3',
      'or': 'ବିକଳ୍ପ 3',
    },
    'q627ag7i': {
      'en': 'Required Documents Status',
      'or': 'ଆବଶ୍ୟକୀୟ ଡକ୍ୟୁମେଣ୍ଟ ସ୍ଥିତି',
    },
    'bma5yjfi': {
      'en': 'Form I - Invoice Details',
      'or': 'ଫର୍ମ I - ଇନଭଏସ୍ ବିବରଣୀ',
    },
    '4fm2de6z': {
      'en': 'Not Submitted',
      'or': 'ଦାଖଲ କରାଯାଇନାହିଁ',
    },
    'ci6lzsdg': {
      'en': ' ',
      'or': '',
    },
    'gdvlm0ud': {
      'en': '(',
      'or': '(',
    },
    'wvivfmdx': {
      'en': '0',
      'or': '0',
    },
    'jzyvsahf': {
      'en': ')',
      'or': ')',
    },
    'ykdzp2g1': {
      'en': 'Form V - Total Sale & Rebate',
      'or': 'ଫର୍ମ V - ମୋଟ ବିକ୍ରୟ ଏବଂ ରିହାତି',
    },
    'pf88zlmi': {
      'en': 'Not Submitted',
      'or': 'ଦାଖଲ କରାଯାଇନାହିଁ',
    },
    'cwxlhbsa': {
      'en': ' ',
      'or': '',
    },
    'ijk0u860': {
      'en': '(',
      'or': '(',
    },
    '3ry3vsd2': {
      'en': '0',
      'or': '0',
    },
    '8kffn7ws': {
      'en': ')',
      'or': ')',
    },
    '6hjbosji': {
      'en': 'Form VI - Center-wise Breakdown',
      'or': 'ଫର୍ମ VI - କେନ୍ଦ୍ର ଅନୁଯାୟୀ ବିଭାଜନ',
    },
    'hma4ukdu': {
      'en': 'Not Submitted',
      'or': 'ଦାଖଲ କରାଯାଇନାହିଁ',
    },
    'nqxrv6ee': {
      'en': ' ',
      'or': '',
    },
    'xuouh2jg': {
      'en': '(',
      'or': '(',
    },
    '7nmh454g': {
      'en': '0',
      'or': '0',
    },
    'ze7gxws0': {
      'en': ')',
      'or': ')',
    },
    '0fo7oj0o': {
      'en': 'Declaration Certificate',
      'or': 'ଘୋଷଣା ପ୍ରମାଣପତ୍ର',
    },
    'ijgf9hnk': {
      'en': 'Not Submitted',
      'or': 'ଦାଖଲ କରାଯାଇନାହିଁ',
    },
    'gtqvtjrr': {
      'en': ' ',
      'or': '',
    },
    '7jlmfasw': {
      'en': '(',
      'or': '(',
    },
    '0odefjrb': {
      'en': '0',
      'or': '0',
    },
    'eh7sy3is': {
      'en': ')',
      'or': ')',
    },
    'edld5xkz': {
      'en': 'Audit Certificate',
      'or': 'ଅଡିଟ୍ ସାର୍ଟିଫିକେଟ୍',
    },
    'iwtw0j3s': {
      'en': 'Not Submitted',
      'or': 'ଦାଖଲ କରାଯାଇନାହିଁ',
    },
    'eu8yha9b': {
      'en': ' ',
      'or': '',
    },
    'w06vnm9x': {
      'en': '(',
      'or': '(',
    },
    'vna00yak': {
      'en': '0',
      'or': '0',
    },
    'kjz9alvf': {
      'en': ')',
      'or': ')',
    },
    'd9aov5zg': {
      'en': 'Bank Deposit Proof',
      'or': 'ବ୍ୟାଙ୍କ ଜମା ପ୍ରମାଣପତ୍ର',
    },
    'ku3m7r55': {
      'en': 'Not Submitted',
      'or': 'ଦାଖଲ କରାଯାଇନାହିଁ',
    },
    '7qirs2ou': {
      'en': ' ',
      'or': '',
    },
    '4lr3329v': {
      'en': '(',
      'or': '(',
    },
    'i6dsv2ox': {
      'en': '0',
      'or': '0',
    },
    'n1ziks5a': {
      'en': ')',
      'or': ')',
    },
    '5mts4unt': {
      'en': 'Final Submition Document List',
      'or': 'ଅନ୍ତିମ ଦାଖଲ ଡକ୍ୟୁମେଣ୍ଟ ତାଲିକା',
    },
    'uhkaxn0k': {
      'en': 'Document Type',
      'or': 'ଡକ୍ୟୁମେଣ୍ଟ ପ୍ରକାର',
    },
    'exgx0t1p': {
      'en': 'Festival',
      'or': 'ଉତ୍ସବ',
    },
    '0jrk84lo': {
      'en': 'Submitted',
      'or': 'ଦାଖଲ କରାଯାଇଛି',
    },
    '0grcsxge': {
      'en': 'Status',
      'or': 'ସ୍ଥିତି',
    },
    'kjh0mvy9': {
      'en': 'No documents uploaded yet.',
      'or': 'ଏପର୍ଯ୍ୟନ୍ତ କୌଣସି ଡକ୍ୟୁମେଣ୍ଟ ଅପଲୋଡ୍ ହୋଇନାହିଁ।',
    },
    'ydi8noro': {
      'en': 'Final Submit',
      'or': 'ଶେଷ ଦାଖଲ',
    },
    'jg4aawb5': {
      'en': 'Submitted Documents',
      'or': 'ଦାଖଲ ହୋଇଥିବା ଡକ୍ୟୁମେଣ୍ଟଗୁଡ଼ିକ',
    },
    '4asctogh': {
      'en': 'Document Type',
      'or': 'ଡକ୍ୟୁମେଣ୍ଟ ପ୍ରକାର',
    },
    '5utn16i4': {
      'en': 'Festival',
      'or': 'ଉତ୍ସବ',
    },
    '7yao0s4o': {
      'en': 'Submitted',
      'or': 'ଦାଖଲ କରାଯାଇଛି',
    },
    'soiqzwxi': {
      'en': 'Status',
      'or': 'ସ୍ଥିତି',
    },
    'i7wfdbiw': {
      'en': 'No documents uploaded yet.',
      'or': 'ଏପର୍ଯ୍ୟନ୍ତ କୌଣସି ଡକ୍ୟୁମେଣ୍ଟ ଅପଲୋଡ୍ ହୋଇନାହିଁ।',
    },
    '4nqb13j5': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    'q6whtpyl': {
      'en': '1',
      'or': '୧',
    },
    'txcpsp7n': {
      'en': 'General Settings',
      'or': 'ସାଧାରଣ ସେଟିଂ',
    },
    'r9jb0hdt': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    'gxv8u8ls': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    '3ijhz03m': {
      'en': 'Edit',
      'or': 'ସମ୍ପାଦନ କରନ୍ତୁ',
    },
    'zz8h3rm4': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    'txw9av7f': {
      'en': 'Amos',
      'or': 'ଆମୋଷ',
    },
    'bxwmmej1': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    '31iiledj': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    'b6owt98y': {
      'en': 'Email address',
      'or': 'ଇମେଲ ଠିକଣା',
    },
    'kz1zgk06': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    '4bacb6fe': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    'x25spfi3': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    'lgki2hl3': {
      'en': 'Languages',
      'or': 'ଭାଷାଗୁଡ଼ିକ',
    },
    '93noss4v': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    '033rwjih': {
      'en': 'Change',
      'or': 'ପରିବର୍ତ୍ତନ କରନ୍ତୁ',
    },
    '90y3b39c': {
      'en': 'App appearance',
      'or': 'ଆପ୍‌ର ଦୃଶ୍ୟମାନତା',
    },
    'bjcc8w5p': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'tzx02qwr': {
      'en': 'Light mode',
      'or': 'ଲାଇଟ୍ ମୋଡ୍',
    },
    'fo04vnht': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    '73dqkboy': {
      'en': 'System preference',
      'or': 'ସିଷ୍ଟମର ପସନ୍ଦ',
    },
    'bw6sefhx': {
      'en': 'Help and Support',
      'or': 'ସାହାଯ୍ୟ ଏବଂ ସମର୍ଥନ',
    },
    'tu5qpxyh': {
      'en': 'Looking for info about us?',
      'or': 'ଆମ ବିଷୟରେ ସୂଚନା ଖୋଜୁଛନ୍ତି କି?',
    },
    'rtf8zy7w': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    '0m0imkfo': {
      'en': 'Tips on how to use Pandora?',
      'or': 'ପାଣ୍ଡୋରା ବ୍ୟବହାର କରିବା ପାଇଁ ଟିପ୍ସ?',
    },
    'la7twy1w': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'gdp9ycpa': {
      'en': 'Need something else?',
      'or': 'ଆଉ କିଛି ଦରକାର କି?',
    },
    '1qmvk6ue': {
      'en': 'Contact support',
      'or': 'ସହାୟତା ପାଇଁ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    '1gisqr2h': {
      'en': 'FAQs',
      'or': 'ସାଧାରଣ ପ୍ରଶ୍ନ',
    },
    '4z2g51nb': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // RegisterOkvi
  {
    'tm7k50le': {
      'en': 'Shri Mohan Charan Majhi',
      'or': 'ଶ୍ରୀ ମୋହନ ଚରଣ ମାଝୀ',
    },
    '72g5wxxt': {
      'en': 'Hon’ble Chief Minister of Odisha',
      'or': 'ଓଡ଼ିଶାର ମାନ୍ୟବର ମୁଖ୍ୟମନ୍ତ୍ରୀ',
    },
    'qx5owzoo': {
      'en':
          'Micro, Small & Medium Enterprise Department , Government of Odisha',
      'or': 'ସୂକ୍ଷ୍ମ, କ୍ଷୁଦ୍ର ଏବଂ ମଧ୍ୟମ ଉଦ୍ୟୋଗ ବିଭାଗ, ଓଡ଼ିଶା ସରକାର',
    },
    'mi1x2wzl': {
      'en':
          'Micro, Small & Medium Enterprise Department , Government of Odisha',
      'or': 'ସୂକ୍ଷ୍ମ, କ୍ଷୁଦ୍ର ଏବଂ ମଧ୍ୟମ ଉଦ୍ୟୋଗ ବିଭାଗ, ଓଡ଼ିଶା ସରକାର',
    },
    'wc0t4gg6': {
      'en': 'MSME',
      'or': 'ଏମଏସଏମଇ',
    },
    'bb1wjyn2': {
      'en': 'MSME Web Portal',
      'or': 'MSME ୱେବ୍ ପୋର୍ଟାଲ',
    },
    'msjeclcn': {
      'en': 'Welcome to OKVI ! Signup to your account',
      'or': 'OKVI କୁ ସ୍ୱାଗତ! ଆପଣଙ୍କ ଆକାଉଣ୍ଟରେ ସାଇନ୍ ଅପ୍ କରନ୍ତୁ',
    },
    '4nsgjz02': {
      'en': 'Welcome! Please Verify Your Email to Continue',
      'or': 'ସ୍ୱାଗତ! ଜାରି ରଖିବାକୁ ଦୟାକରି ଆପଣଙ୍କର ଇମେଲ୍ ଯାଞ୍ଚ କରନ୍ତୁ',
    },
    'vj7r0oe1': {
      'en': 'Email ID*',
      'or': 'ଇମେଲ୍ ଆଇଡି*',
    },
    'litrz79g': {
      'en': 'Enter institution email ID',
      'or': 'ସଂସ୍ଥାର ଇମେଲ୍ ID ଲେଖନ୍ତୁ',
    },
    'rzg1hhkv': {
      'en': 'SEND',
      'or': 'ପଠାନ୍ତୁ',
    },
    'i51d64kf': {
      'en': '⚠️ Please enter your email address.',
      'or': '⚠️ ଦୟାକରି ଆପଣଙ୍କର ଇମେଲ୍ ଠିକଣା ପ୍ରବେଶ କରନ୍ତୁ।',
    },
    'cvp4xm5s': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    '0t9qqwej': {
      'en': 'OTP*',
      'or': 'ଓଟିପି*',
    },
    'qbu0jrsx': {
      'en': 'Your OTP',
      'or': 'ଆପଣଙ୍କର OTP',
    },
    'r58oohl8': {
      'en': 'Resend OTP',
      'or': 'OTP ପୁଣି ପଠାନ୍ତୁ',
    },
    '2474q7x4': {
      'en': 'Verify OTP',
      'or': 'OTP ଯାଞ୍ଚ କରନ୍ତୁ',
    },
    'tkiq8ait': {
      'en': '⚠️ Please enter the OTP sent to your email.',
      'or': '⚠️ ଦୟାକରି ଆପଣଙ୍କ ଇମେଲକୁ ପଠାଯାଇଥିବା OTP ପ୍ରବେଶ କରନ୍ତୁ।',
    },
    'h0mpuzhi': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'v3cedc84': {
      'en': '✅ Email Verified',
      'or': '✅ ଇମେଲ୍ ଯାଞ୍ଚ କରାଯାଇଛି',
    },
    '5lvlgdcx': {
      'en':
          'Your email address has been successfully verified. You can now start the registration process below to access all the features of your account.',
      'or':
          'ଆପଣଙ୍କର ଇମେଲ୍ ଠିକଣା ସଫଳତାର ସହ ଯାଞ୍ଚ କରାଯାଇଛି। ଆପଣଙ୍କ ଆକାଉଣ୍ଟର ସମସ୍ତ ବୈଶିଷ୍ଟ୍ୟଗୁଡ଼ିକୁ ଆକ୍ସେସ୍ କରିବା ପାଇଁ ଆପଣ ବର୍ତ୍ତମାନ ନିମ୍ନରେ ପଞ୍ଜୀକରଣ ପ୍ରକ୍ରିୟା ଆରମ୍ଭ କରିପାରିବେ।',
    },
    'iu8jfv5k': {
      'en': 'Institution Information',
      'or': 'ସଂସ୍ଥା ସୂଚନା',
    },
    '7e8pjko4': {
      'en': 'Name*',
      'or': 'ନାମ*',
    },
    'jbmbt7gr': {
      'en': 'Enter institution Name',
      'or': 'ପ୍ରତିଷ୍ଠାନର ନାମ ଲେଖନ୍ତୁ',
    },
    'ca0cqt2y': {
      'en': 'Email ID*',
      'or': 'ଇମେଲ୍ ଆଇଡି*',
    },
    '86qj8eeb': {
      'en': 'Enter institution email ID',
      'or': 'ସଂସ୍ଥାର ଇମେଲ୍ ID ଲେଖନ୍ତୁ',
    },
    'ywiv22i9': {
      'en': 'District*',
      'or': 'ଜିଲ୍ଲା*',
    },
    'sl36j7lq': {
      'en': 'Select District',
      'or': 'ଜିଲ୍ଲା ଚୟନ କରନ୍ତୁ',
    },
    '8p29me05': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    '5i95ux03': {
      'en': 'Option 1',
      'or': 'ବିକଳ୍ପ 1',
    },
    'bv8f249o': {
      'en': 'Option 2',
      'or': 'ବିକଳ୍ପ 2',
    },
    'gt79vkhy': {
      'en': 'Option 3',
      'or': 'ବିକଳ୍ପ 3',
    },
    '974udtjw': {
      'en': 'Aadhaar No*',
      'or': 'ଆଧାର ନମ୍ବର*',
    },
    '0sv70t41': {
      'en': 'Aadhaar No',
      'or': 'ଆଧାର ନମ୍ବର',
    },
    '45sooehd': {
      'en': 'GMDIC/RIC Type*',
      'or': 'GMDIC/RIC ପ୍ରକାର*',
    },
    '6f5e7gyp': {
      'en': 'Select GMDIC',
      'or': 'GMDIC ଚୟନ କରନ୍ତୁ',
    },
    '75l3gvug': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'bhanwt4o': {
      'en': 'Option 1',
      'or': 'ବିକଳ୍ପ 1',
    },
    'hp58814f': {
      'en': 'Option 2',
      'or': 'ବିକଳ୍ପ 2',
    },
    '8mjkzhko': {
      'en': 'Option 3',
      'or': 'ବିକଳ୍ପ 3',
    },
    '2jturvyx': {
      'en': 'PAN No.',
      'or': 'ପାନ୍ ନମ୍ବର',
    },
    'obrex0s6': {
      'en': 'PaAN No (Ex. AAOPG6543T)',
      'or': 'ପାନ୍ ନମ୍ବର (ଉଦାହରଣ AAOPG6543T)',
    },
    'udzxmhqn': {
      'en': 'GST Registration No.',
      'or': 'GST ପଞ୍ଜିକରଣ ନମ୍ବର',
    },
    'sz7n591e': {
      'en': 'GST Registration No  (Ex. 07AAOPG6543T6AZ)',
      'or': 'GST ପଞ୍ଜିକରଣ ନମ୍ବର (ଉଦାହରଣ 07AAOPG6543T6AZ)',
    },
    'cff0sz8o': {
      'en': 'Address *',
      'or': 'ଠିକଣା *',
    },
    'lshw8e8x': {
      'en': 'Enter institution address',
      'or': 'ସଂସ୍ଥାର ଠିକଣା ଲେଖନ୍ତୁ',
    },
    'h22xdc1v': {
      'en': 'Registration Information',
      'or': 'ପଞ୍ଜିକରଣ ସୂଚନା',
    },
    'haq2uxbl': {
      'en': 'Regd. With ADM/DIC*',
      'or': 'ADM/DIC* ସହିତ ପଞ୍ଜୀକୃତ',
    },
    '5qq7j3sl': {
      'en': 'Enter regd. with ADM/DIC',
      'or': 'ADM/DIC ସହିତ regd. ଲେଖନ୍ତୁ',
    },
    'o6oo84vl': {
      'en': 'ADM/DIC Regd. No*',
      'or': 'ADM/DIC ରେଜିଷ୍ଟ୍ରେଟେଡ୍ ନମ୍ବର*',
    },
    '7w4phk5q': {
      'en': 'Enter ADM/DIC regd. no',
      'or': 'ADM/DIC ରେଜିଷ୍ଟର ନମ୍ବର ଲେଖନ୍ତୁ',
    },
    'zpsw8j7b': {
      'en': 'OKVIB Regd. No*',
      'or': 'OKVIB ପଞ୍ଜିକୃତ ନାଁ*',
    },
    'dftyk2wd': {
      'en': 'Enter OKVIB regd. no',
      'or': 'OKVIB ରେଜିଷ୍ଟ୍ରେସନ୍ ନମ୍ବର ଲେଖନ୍ତୁ।',
    },
    'f1yogd6x': {
      'en': 'Regd. With KVIC*',
      'or': 'KVIC ସହିତ ପଞ୍ଜିକୃତ*',
    },
    'dg28udoi': {
      'en': 'Enter regd. with KVIC',
      'or': 'KVIC ସହିତ regd. ଲେଖନ୍ତୁ',
    },
    '77lwnmjd': {
      'en': 'KVIC Regd. No',
      'or': 'KVIC ରେଜିଷ୍ଟର ନମ୍ବର',
    },
    'efszuo6w': {
      'en': 'Enter KVIC regd. no',
      'or': 'KVIC ରେଜିଷ୍ଟର ନମ୍ବର ଲେଖନ୍ତୁ',
    },
    'impwlmye': {
      'en': 'Validity Till',
      'or': 'ବୈଧତା ତାରିଖ ପର୍ଯ୍ୟନ୍ତ',
    },
    '5638b1uy': {
      'en': 'Bank Details',
      'or': 'ବ୍ୟାଙ୍କ ବିବରଣୀ',
    },
    'xp5sgjjr': {
      'en': 'Bank A/C No*',
      'or': 'ବ୍ୟାଙ୍କ ଆକାଉଣ୍ଟ ନମ୍ବର*',
    },
    '0e27koo1': {
      'en': 'Enter bank A/C no',
      'or': 'ବ୍ୟାଙ୍କ ଆକାଉଣ୍ଟ ନମ୍ବର ଲେଖନ୍ତୁ',
    },
    'qtyh89lr': {
      'en': 'A/C Holder Name*',
      'or': 'ଏ/ସି ଧାରକଙ୍କ ନାମ*',
    },
    '8pg8wlsi': {
      'en': 'Enter A/C holder name',
      'or': 'A/C ଧାରକଙ୍କ ନାମ ଲେଖନ୍ତୁ',
    },
    'nxpgwqts': {
      'en': 'IFSC Code*',
      'or': 'IFSC କୋଡ୍*',
    },
    'agpqrsxv': {
      'en': 'Enter IFSC code',
      'or': 'IFSC କୋଡ୍ ଲେଖନ୍ତୁ',
    },
    'tne97dyw': {
      'en': 'Name of the Bank/Branch*',
      'or': 'ବ୍ୟାଙ୍କ/ଶାଖାର ନାମ*',
    },
    'hq4n0lyu': {
      'en': 'Enter name of the Bank/Branch',
      'or': 'ବ୍ୟାଙ୍କ/ଶାଖାର ନାମ ପ୍ରବେଶ କରନ୍ତୁ।',
    },
    'qh0o9qv0': {
      'en': 'Secretary Information',
      'or': 'ସୂଚନା ସଚିବ',
    },
    'uxf9j1fo': {
      'en': 'Name *',
      'or': 'ନାମ *',
    },
    'jq26qofd': {
      'en': 'Enter secretary name',
      'or': 'ସଚିବଙ୍କ ନାମ ଲେଖନ୍ତୁ',
    },
    'eg04gkwk': {
      'en': 'Mobile No*',
      'or': 'ମୋବାଇଲ୍ ନମ୍ବର*',
    },
    '8vi4zz7e': {
      'en': 'Enter secretary mobile no',
      'or': 'ସଚିବଙ୍କ ମୋବାଇଲ୍ ନମ୍ବର ଦିଅନ୍ତୁ',
    },
    'r2j4udgr': {
      'en': 'Address *',
      'or': 'ଠିକଣା *',
    },
    'ihaewluf': {
      'en': 'Enter secretary address',
      'or': 'ସଚିବଙ୍କ ଠିକଣା ଲେଖନ୍ତୁ',
    },
    'pelgd2vr': {
      'en': 'President Information',
      'or': 'ରାଷ୍ଟ୍ରପତି ସୂଚନା',
    },
    '2nfyvi4s': {
      'en': 'Name *',
      'or': 'ନାମ *',
    },
    'mabhjenf': {
      'en': 'Enter president name',
      'or': 'ରାଷ୍ଟ୍ରପତିଙ୍କ ନାମ ଲେଖନ୍ତୁ',
    },
    '3mq5jqf9': {
      'en': 'Mobile No*',
      'or': 'ମୋବାଇଲ୍ ନମ୍ବର*',
    },
    'oyb1ok4o': {
      'en': 'Enter president mobile no',
      'or': 'ରାଷ୍ଟ୍ରପତିଙ୍କ ମୋବାଇଲ୍ ନମ୍ବର ପ୍ରବେଶ କରନ୍ତୁ',
    },
    '79cj5rox': {
      'en': 'Address *',
      'or': 'ଠିକଣା *',
    },
    'fnmr41w6': {
      'en': 'Enter president address',
      'or': 'ରାଷ୍ଟ୍ରପତିଙ୍କ ଅଭିଭାଷଣ ଲେଖନ୍ତୁ',
    },
    'n3mljq5x': {
      'en': 'Commitee Member List',
      'or': 'କମିଟି ସଦସ୍ୟ ତାଲିକା',
    },
    '1a2m7225': {
      'en': 'Name *',
      'or': 'ନାମ *',
    },
    's66wfmro': {
      'en': 'Enter commitee member name',
      'or': 'କମିଟି ସଦସ୍ୟଙ୍କ ନାମ ପ୍ରବେଶ କରନ୍ତୁ',
    },
    'wu8vji2y': {
      'en': 'Mobile No*',
      'or': 'ମୋବାଇଲ୍ ନମ୍ବର*',
    },
    'o5aut95k': {
      'en': 'Enter commitee member mobile no',
      'or': 'କମିଟି ସଦସ୍ୟଙ୍କ ମୋବାଇଲ୍ ନମ୍ବର ପ୍ରବେଶ କରନ୍ତୁ',
    },
    'fozlwm6r': {
      'en': 'Address *',
      'or': 'ଠିକଣା *',
    },
    '55pc7a5g': {
      'en': 'Enter commitee member address',
      'or': 'କମିଟି ସଦସ୍ୟଙ୍କ ଠିକଣା ପ୍ରବେଶ କରନ୍ତୁ',
    },
    '24r10u95': {
      'en': 'ADD',
      'or': 'ଯୋଡନ୍ତୁ',
    },
    '2jw1zext': {
      'en': 'Name',
      'or': 'ନାମ',
    },
    'l7w8e50s': {
      'en': 'Mobile No.',
      'or': 'ମୋବାଇଲ୍ ନମ୍ବର',
    },
    '8ek88m7j': {
      'en': 'Address',
      'or': 'ଠିକଣା',
    },
    'obj95spj': {
      'en': 'Password*',
      'or': 'ପାସୱାର୍ଡ*',
    },
    'sxfdw6tt': {
      'en': 'Password',
      'or': 'ପାସୱାର୍ଡ',
    },
    'yqjlokba': {
      'en': 'Confirm Password*',
      'or': 'ପାସୱାର୍ଡ ସୁନିଶ୍ଚିତ କରନ୍ତୁ*',
    },
    'cwr2t4uv': {
      'en': 'Password',
      'or': 'ପାସୱାର୍ଡ',
    },
    'nfbjem0o': {
      'en': 'Enter institution Name is required',
      'or': 'ଅନୁଷ୍ଠାନ ନାମ ଲେଖନ୍ତୁ ଆବଶ୍ୟକ',
    },
    '3l05kvsy': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'iw9u8cri': {
      'en': 'Enter institution email ID is required',
      'or': 'ସଂସ୍ଥାର ଇମେଲ୍ ID ପ୍ରବେଶ କରିବା ଆବଶ୍ୟକ',
    },
    '5qovu3tn': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'nww8s927': {
      'en': 'Aadhaar No is required',
      'or': 'ଆଧାର ନମ୍ବର ଆବଶ୍ୟକ।',
    },
    'lpuw4rtd': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'x0qf4wvy': {
      'en': 'PaAN No (Ex. AAOPG6543T) is required',
      'or': 'PaAN ନମ୍ବର (ଉଦାହରଣ AAOPG6543T) ଆବଶ୍ୟକ।',
    },
    '3g7189er': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'uxptvogi': {
      'en': 'GST Registration No  (Ex. 07AAOPG6543T6AZ) is required',
      'or': 'GST ପଞ୍ଜିକରଣ ନମ୍ବର (ଉଦାହରଣ 07AAOPG6543T6AZ) ଆବଶ୍ୟକ।',
    },
    'p0zncrio': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'ngq7eiau': {
      'en': 'Enter institution address is required',
      'or': 'ସଂସ୍ଥାର ଠିକଣା ପ୍ରବେଶ କରିବା ଆବଶ୍ୟକ',
    },
    'duohcjtc': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'iw7jko5n': {
      'en': 'Enter regd. with ADM/DIC is required',
      'or': 'ADM/DIC ସହିତ regd. ଲେଖନ୍ତୁ ଆବଶ୍ୟକ।',
    },
    'aw0ho4si': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    '0ltuqrq3': {
      'en': 'Enter ADM/DIC regd. no is required',
      'or': 'ADM/DIC ରେଜିଷ୍ଟର ନମ୍ବର ଲେଖନ୍ତୁ ଆବଶ୍ୟକ ନାହିଁ।',
    },
    'oct165j7': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    '1700o60l': {
      'en': 'Enter OKVIB regd. no is required',
      'or': 'OKVIB ରେଜିଷ୍ଟର ନମ୍ବର ଲେଖନ୍ତୁ। ଆବଶ୍ୟକ ନାହିଁ।',
    },
    'eop99qkf': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'dzrwa2x9': {
      'en': 'Enter regd. with KVIC is required',
      'or': 'KVIC ସହିତ regd. ଲେଖନ୍ତୁ ଆବଶ୍ୟକ।',
    },
    '5mnzq0q4': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    '2na126tf': {
      'en': 'Enter KVIC regd. no is required',
      'or': 'KVIC ରେଜିଷ୍ଟର ନମ୍ବର ଲେଖନ୍ତୁ। ଆବଶ୍ୟକ ନାହିଁ।',
    },
    'u44ubtvu': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'jwk5dehl': {
      'en': 'Enter bank A/C no is required',
      'or': 'ବ୍ୟାଙ୍କ ଆକାଉଣ୍ଟ ନମ୍ବର ଲେଖନ୍ତୁ ଆବଶ୍ୟକ।',
    },
    'hrj98f40': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    '7gw07fmx': {
      'en': 'Enter A/C holder name is required',
      'or': 'A/C ଧାରକଙ୍କ ନାମ ଲେଖିବା ଆବଶ୍ୟକ',
    },
    'knyd7t4q': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'yq7thzjj': {
      'en': 'Enter IFSC code is required',
      'or': 'IFSC କୋଡ୍ ପ୍ରବେଶ କରିବା ଆବଶ୍ୟକ',
    },
    'we5zw2u7': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'v88v5n5d': {
      'en': 'Enter name of the Bank/Branch is required',
      'or': 'ବ୍ୟାଙ୍କ/ଶାଖାର ନାମ ପ୍ରବେଶ କରିବା ଆବଶ୍ୟକ',
    },
    'lz7kpshb': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    '8tcqoowd': {
      'en': 'Enter secretary name is required',
      'or': 'ସଚିବଙ୍କ ନାମ ପ୍ରବେଶ କରିବା ଆବଶ୍ୟକ',
    },
    'tn2q6yld': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    '3hyyr2rr': {
      'en': 'Enter secretary mobile no is required',
      'or': 'ସଚିବଙ୍କ ମୋବାଇଲ୍ ନମ୍ବର ପ୍ରବେଶ କରିବା ଆବଶ୍ୟକ।',
    },
    '36fyio0p': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'ojv8r20n': {
      'en': 'Enter secretary address is required',
      'or': 'ସଚିବଙ୍କ ଠିକଣା ପ୍ରବେଶ କରିବା ଆବଶ୍ୟକ',
    },
    'zhkxrfhp': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'p2ub01yh': {
      'en': 'Enter president name is required',
      'or': 'ରାଷ୍ଟ୍ରପତିଙ୍କ ନାମ ପ୍ରବେଶ କରିବା ଆବଶ୍ୟକ',
    },
    '3ap378u9': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    '65ktbe8a': {
      'en': 'Enter president mobile no is required',
      'or': 'ରାଷ୍ଟ୍ରପତିଙ୍କ ମୋବାଇଲ୍ ନମ୍ବର ଲେଖନ୍ତୁ ଆବଶ୍ୟକ।',
    },
    'ja8i91do': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'bi7wuk3w': {
      'en': 'Enter president address is required',
      'or': 'ରାଷ୍ଟ୍ରପତିଙ୍କ ଠିକଣା ଲେଖିବା ଆବଶ୍ୟକ',
    },
    'iahtuuk6': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    '6mbbq9lz': {
      'en': 'Enter commitee member name is required',
      'or': 'କମିଟି ସଦସ୍ୟଙ୍କ ନାମ ପ୍ରବେଶ କରିବା ଆବଶ୍ୟକ।',
    },
    '1hdmudot': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'avzwi2mq': {
      'en': 'Enter commitee member mobile no is required',
      'or': 'କମିଟି ସଦସ୍ୟଙ୍କ ମୋବାଇଲ୍ ନମ୍ବର ପ୍ରବେଶ କରିବା ଆବଶ୍ୟକ।',
    },
    '2i6ke5l3': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'hauh3ouk': {
      'en': 'Enter commitee member address is required',
      'or': 'କମିଟି ସଦସ୍ୟଙ୍କ ଠିକଣା ପ୍ରବେଶ କରିବା ଆବଶ୍ୟକ।',
    },
    'pm9kgfei': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'x3827kqt': {
      'en': 'Password is required',
      'or': 'ପାସୱାର୍ଡ ଆବଶ୍ୟକ',
    },
    'azu27wfi': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    'roj8mmoz': {
      'en': 'Password is required',
      'or': 'ପାସୱାର୍ଡ ଆବଶ୍ୟକ',
    },
    '83py7rbb': {
      'en': 'Please choose an option from the dropdown',
      'or': 'ଦୟାକରି ଡ୍ରପଡାଉନରୁ ଗୋଟିଏ ବିକଳ୍ପ ବାଛନ୍ତୁ।',
    },
    '93c6vqhu': {
      'en': 'Register Now',
      'or': 'ବର୍ତ୍ତମାନ ପଞ୍ଜିକରଣ କରନ୍ତୁ',
    },
    'u4sbwntn': {
      'en': 'Already have an account? ',
      'or': 'ପୂର୍ବରୁ ଏକ ଖାତା ଅଛି କି?',
    },
    '9dvaaty8': {
      'en': 'Login',
      'or': 'ଲଗ୍ଇନ୍',
    },
    'fjutx6dm': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // DashboardOkvi
  {
    'kbn80rin': {
      'en': 'Dashboard',
      'or': 'ଡ୍ୟାସବୋର୍ଡ',
    },
    'clp65vg6': {
      'en': 'Enter stock details for the festival period',
      'or': 'ପର୍ବ ଅବଧି ପାଇଁ ଷ୍ଟକ୍ ବିବରଣୀ ପ୍ରବେଶ କରନ୍ତୁ',
    },
    '751xi1ng': {
      'en': 'Last login: Today, 09:30 AM',
      'or': 'ଶେଷ ଲଗଇନ୍: ଆଜି, ସକାଳ ୦୯:୩୦',
    },
    'thspddn7': {
      'en': 'Current Festival',
      'or': 'ଚଳିତ ପର୍ବ',
    },
    'pynivt2t': {
      'en': 'Diwali 2024',
      'or': 'ଦୀପାବଳି 2024',
    },
    'ak6pfofj': {
      'en': 'Active',
      'or': 'ସକ୍ରିୟ',
    },
    'd5h90zd9': {
      'en': 'Pending Claims',
      'or': 'ବିଚାରାଧୀନ ଦାବିଗୁଡ଼ିକ',
    },
    'd864exnj': {
      'en': '0',
      'or': '0',
    },
    'p4dceujp': {
      'en': 'Under Review',
      'or': 'ସମୀକ୍ଷା ହେଉଛି',
    },
    'q44ksqj5': {
      'en': 'Approved Amount',
      'or': 'ଅନୁମୋଦିତ ରାଶି',
    },
    '6936co9s': {
      'en': '₹0',
      'or': '₹0',
    },
    '09vm9k7f': {
      'en': 'Sanctioned',
      'or': 'ମଞ୍ଜୁର ହୋଇଛି',
    },
    'waaoyh1h': {
      'en': 'Days Remaining',
      'or': 'ବାକି ଥିବା ଦିନ',
    },
    'r8bpukdf': {
      'en': '0',
      'or': '0',
    },
    'e2d50mxp': {
      'en': 'For Closing Stock',
      'or': 'କ୍ଲୋଜିଂ ଷ୍ଟକ୍ ପାଇଁ',
    },
    'izur4hfb': {
      'en': 'Festival Timeline',
      'or': 'ମହୋତ୍ସବ ସମୟସୀମା',
    },
    'w0oqowoy': {
      'en': 'View All',
      'or': 'ସମସ୍ତ ଦେଖନ୍ତୁ',
    },
    'nzmrq2jd': {
      'en': 'Diwali 2024',
      'or': 'ଦୀପାବଳି 2024',
    },
    '8bep1tid': {
      'en': 'Currently active festival',
      'or': 'ବର୍ତ୍ତମାନ ସକ୍ରିୟ ଉତ୍ସବ',
    },
    '7uqw4kop': {
      'en': 'Opening Stock: Available',
      'or': 'ଆରମ୍ଭ ଷ୍ଟକ୍: ଉପଲବ୍ଧ',
    },
    'gzievrdu': {
      'en': 'Closing Stock: Deadline Passed',
      'or': 'ଶେଷ ଷ୍ଟକ୍: ଶେଷ ତାରିଖ ଅତିକ୍ରମ କରିଛି',
    },
    'tpapzmaz': {
      'en': '10/1/2024 - 11/15/2024',
      'or': '୧୦/୧/୨୦୨୪ - ୧୧/୧୫/୨୦୨୪',
    },
    'ozb1yl0d': {
      'en': 'Diwali 2024',
      'or': 'ଦୀପାବଳି 2024',
    },
    '266c2o9r': {
      'en': 'Currently active festival',
      'or': 'ବର୍ତ୍ତମାନ ସକ୍ରିୟ ଉତ୍ସବ',
    },
    '9d9erobo': {
      'en': 'Opening Stock: Available',
      'or': 'ଆରମ୍ଭ ଷ୍ଟକ୍: ଉପଲବ୍ଧ',
    },
    '53fn9adp': {
      'en': 'Closing Stock: Deadline Passed',
      'or': 'ଶେଷ ଷ୍ଟକ୍: ଶେଷ ତାରିଖ ଅତିକ୍ରମ କରିଛି',
    },
    'budo1iw9': {
      'en': '10/1/2024 - 11/15/2024',
      'or': '୧୦/୧/୨୦୨୪ - ୧୧/୧୫/୨୦୨୪',
    },
    'xz5olfdk': {
      'en': 'Diwali 2024',
      'or': 'ଦୀପାବଳି 2024',
    },
    'nsjczo1r': {
      'en': 'Currently active festival',
      'or': 'ବର୍ତ୍ତମାନ ସକ୍ରିୟ ଉତ୍ସବ',
    },
    'vpbofvdb': {
      'en': 'Opening Stock: Available',
      'or': 'ଆରମ୍ଭ ଷ୍ଟକ୍: ଉପଲବ୍ଧ',
    },
    '0yaspgla': {
      'en': 'Closing Stock: Deadline Passed',
      'or': 'ଶେଷ ଷ୍ଟକ୍: ଶେଷ ତାରିଖ ଅତିକ୍ରମ କରିଛି',
    },
    'z5dzvtfm': {
      'en': '10/1/2024 - 11/15/2024',
      'or': '୧୦/୧/୨୦୨୪ - ୧୧/୧୫/୨୦୨୪',
    },
    'e1zgybvv': {
      'en': 'Quick Actions',
      'or': 'ଦ୍ରୁତ କାର୍ଯ୍ୟ',
    },
    'dj2ecv3y': {
      'en': 'Submit Closing Stock',
      'or': 'କ୍ଲୋଜିଂ ଷ୍ଟକ୍ ଦାଖଲ କରନ୍ତୁ',
    },
    '3a207rek': {
      'en': '0 days remaining',
      'or': '0 ଦିନ ବାକି ଅଛି',
    },
    '26iocq1m': {
      'en': 'Upload Documents',
      'or': 'ଡକ୍ୟୁମେଣ୍ଟଗୁଡିକ ଅପଲୋଡ୍ କରନ୍ତୁ',
    },
    'r97zwq9d': {
      'en': 'Complete your claim',
      'or': 'ଆପଣଙ୍କର ଦାବି ପୂରଣ କରନ୍ତୁ',
    },
    'wso2q9jr': {
      'en': 'View Claims Status',
      'or': 'ଦାବିର ସ୍ଥିତି ଦେଖନ୍ତୁ',
    },
    '83hpwg81': {
      'en': 'Track submissions',
      'or': 'ଦାଖଲଗୁଡ଼ିକୁ ଟ୍ରାକ୍ କରନ୍ତୁ',
    },
    'brnh0xr3': {
      'en': 'KVIC Tag',
      'or': 'KVIC ଟ୍ୟାଗ୍',
    },
    'pcnlg1l6': {
      'en': 'Upload or update',
      'or': 'ଅପଲୋଡ୍ କିମ୍ବା ଅପଡେଟ୍ କରନ୍ତୁ',
    },
    'nnix1dda': {
      'en': 'Recent Document Submissions',
      'or': 'ସାମ୍ପ୍ରତିକ ଡକ୍ୟୁମେଣ୍ଟ ଦାଖଲଗୁଡ଼ିକ',
    },
    'vzuap21t': {
      'en': 'View All',
      'or': 'ସମସ୍ତ ଦେଖନ୍ତୁ',
    },
    'pdocg2jg': {
      'en': 'Document Type',
      'or': 'ଡକ୍ୟୁମେଣ୍ଟ ପ୍ରକାର',
    },
    '5rku0di0': {
      'en': 'Festival',
      'or': 'ଉତ୍ସବ',
    },
    'vpygm36c': {
      'en': 'Submitted',
      'or': 'ଦାଖଲ କରାଯାଇଛି',
    },
    'krwzswh9': {
      'en': 'Status',
      'or': 'ସ୍ଥିତି',
    },
    'xrbzkoqx': {
      'en': 'No documents submitted yet',
      'or': 'ଏପର୍ଯ୍ୟନ୍ତ କୌଣସି ଡକ୍ୟୁମେଣ୍ଟ ଦାଖଲ କରାଯାଇନାହିଁ',
    },
    'ypxymp5y': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    '5bey9pim': {
      'en': '1',
      'or': '୧',
    },
    '9xe5o25q': {
      'en': 'General Settings',
      'or': 'ସାଧାରଣ ସେଟିଂ',
    },
    'w6b904zn': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    '2nmf214p': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    'f3p67x8p': {
      'en': 'Edit',
      'or': 'ସମ୍ପାଦନ କରନ୍ତୁ',
    },
    'strrs6ky': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    'l93n2lop': {
      'en': 'Amos',
      'or': 'ଆମୋଷ',
    },
    'ffqiap40': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    'h5rl89io': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    '3cwls7i3': {
      'en': 'Email address',
      'or': 'ଇମେଲ ଠିକଣା',
    },
    '8tap5jwa': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    '4jb45rck': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    'k56f2fo0': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    'rmxnrxio': {
      'en': 'Languages',
      'or': 'ଭାଷାଗୁଡ଼ିକ',
    },
    '53pue2wx': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    '14x75oh5': {
      'en': 'Change',
      'or': 'ପରିବର୍ତ୍ତନ କରନ୍ତୁ',
    },
    'z1p3biq5': {
      'en': 'App appearance',
      'or': 'ଆପ୍‌ର ଦୃଶ୍ୟମାନତା',
    },
    'aut0ydlz': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'zdmphkp2': {
      'en': 'Light mode',
      'or': 'ଲାଇଟ୍ ମୋଡ୍',
    },
    '3if2xcnk': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    't107vzuu': {
      'en': 'System preference',
      'or': 'ସିଷ୍ଟମର ପସନ୍ଦ',
    },
    'lc7mhotk': {
      'en': 'Help and Support',
      'or': 'ସାହାଯ୍ୟ ଏବଂ ସମର୍ଥନ',
    },
    'p67rhu95': {
      'en': 'Looking for info about us?',
      'or': 'ଆମ ବିଷୟରେ ସୂଚନା ଚାହୁଁଛନ୍ତି କି?',
    },
    'w5uy3dbz': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'uu1yubg3': {
      'en': 'Tips on how to use Pandora?',
      'or': 'ପାଣ୍ଡୋରା ବ୍ୟବହାର କରିବା ପାଇଁ ଟିପ୍ସ?',
    },
    'kuw4uqy3': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    't77ra2wf': {
      'en': 'Need something else?',
      'or': 'ଆଉ କିଛି ଦରକାର କି?',
    },
    'ykltsrrt': {
      'en': 'Contact support',
      'or': 'ସହାୟତା ପାଇଁ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    'ikbpkzug': {
      'en': 'FAQs',
      'or': 'ସାଧାରଣ ପ୍ରଶ୍ନ',
    },
    'ge1ibbyf': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // OpeningStocks
  {
    'kz5mvi91': {
      'en': 'Opening Stock Entry',
      'or': 'ଷ୍ଟକ୍ ଏଣ୍ଟ୍ରି ଖୋଲିବା',
    },
    'yfwbs0rx': {
      'en': 'Enter stock details for the festival period',
      'or': 'ପର୍ବ ଅବଧି ପାଇଁ ଷ୍ଟକ୍ ବିବରଣୀ ପ୍ରବେଶ କରନ୍ତୁ',
    },
    '4tliiynl': {
      'en': 'Entry Closed',
      'or': 'ପ୍ରବେଶ ବନ୍ଦ ଅଛି',
    },
    '73ybmitd': {
      'en': 'Prerequisites',
      'or': 'ପୂର୍ବ ଆବଶ୍ୟକତା',
    },
    'oigsq6eh': {
      'en':
          'Opening stock can only be entered on the festival start date: 10/1/2024',
      'or':
          'ଖୋଲା ଷ୍ଟକ୍ କେବଳ ମହୋତ୍ସବ ଆରମ୍ଭ ତାରିଖ: 10/1/2024 ରେ ପ୍ରବେଶ କରାଯାଇପାରିବ।',
    },
    'jw9ya7rw': {
      'en': 'Festival Name *',
      'or': 'ପର୍ବ ନାମ *',
    },
    'kbhc5j9r': {
      'en': 'Select Festival',
      'or': 'ଉତ୍ସବ ଚୟନ କରନ୍ତୁ',
    },
    'ctqqnx05': {
      'en': 'Head *',
      'or': 'ମୁଣ୍ଡ *',
    },
    '0yw7sdi8': {
      'en': 'Select head',
      'or': 'ମୁଣ୍ଡ ଚୟନ କରନ୍ତୁ',
    },
    'wto8lgk6': {
      'en': 'Sub Head Details',
      'or': 'ଉପମୁଖ୍ୟ ବିବରଣୀ',
    },
    '7vm7bc1e': {
      'en': 'Sub Head(Product Name) *',
      'or': 'ଉପମୁଖ୍ୟ(ଉତ୍ପାଦ ନାମ) *',
    },
    'so8quqvf': {
      'en': 'TextField',
      'or': 'ପାଠ୍ୟକ୍ଷେତ୍ର',
    },
    '4bd52m0h': {
      'en': 'Unit Type *',
      'or': 'ୟୁନିଟ୍ ପ୍ରକାର *',
    },
    'av8dsccr': {
      'en': 'Select...',
      'or': 'ଚୟନ କରନ୍ତୁ...',
    },
    'wuem99wh': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'kdqsqixc': {
      'en': 'Option 1',
      'or': 'ବିକଳ୍ପ 1',
    },
    'e6jkdtfn': {
      'en': 'Option 2',
      'or': 'ବିକଳ୍ପ 2',
    },
    '72m96ztc': {
      'en': 'Option 3',
      'or': 'ବିକଳ୍ପ 3',
    },
    'cf6muij6': {
      'en': 'Unity Price *',
      'or': 'ୟୁନିଟି ମୂଲ୍ୟ *',
    },
    'so5ejeui': {
      'en': '0',
      'or': '0',
    },
    'z5z1e8uk': {
      'en': 'Quantity *',
      'or': 'ପରିମାଣ *',
    },
    '99wzjy4v': {
      'en': '0',
      'or': '0',
    },
    'oq8qdjg8': {
      'en': 'Total Price *',
      'or': 'ମୋଟ ମୂଲ୍ୟ *',
    },
    'ayluykpy': {
      'en': '0',
      'or': '0',
    },
    'wzv3kbw9': {
      'en': 'Submit',
      'or': 'ଦାଖଲ କରନ୍ତୁ',
    },
    '5prkg3s0': {
      'en': 'Stock Entries',
      'or': 'ଷ୍ଟକ୍ ଏଣ୍ଟ୍ରିଗୁଡ଼ିକ',
    },
    'kkdruu2h': {
      'en': 'Document Type',
      'or': 'ଡକ୍ୟୁମେଣ୍ଟ ପ୍ରକାର',
    },
    'qc9z0lf4': {
      'en': 'Festival',
      'or': 'ଉତ୍ସବ',
    },
    's6uu0o69': {
      'en': 'Submitted',
      'or': 'ଦାଖଲ କରାଯାଇଛି',
    },
    'iz7euiwf': {
      'en': 'Status',
      'or': 'ସ୍ଥିତି',
    },
    '50kjwe3d': {
      'en': 'No stock entries found. Add your first entry above.',
      'or':
          'କୌଣସି ଷ୍ଟକ୍ ଏଣ୍ଟ୍ରି ମିଳିଲା ନାହିଁ। ଉପରେ ଆପଣଙ୍କର ପ୍ରଥମ ଏଣ୍ଟ୍ରି ଯୋଡନ୍ତୁ।',
    },
    '2it1p0k4': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    '75jmwq4t': {
      'en': '1',
      'or': '୧',
    },
    'jumwkly5': {
      'en': 'General Settings',
      'or': 'ସାଧାରଣ ସେଟିଂ',
    },
    '0i366vns': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    'ofquw836': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    'gnlw6mo2': {
      'en': 'Edit',
      'or': 'ସମ୍ପାଦନ କରନ୍ତୁ',
    },
    'c6sawtb0': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    '5nvgq9yp': {
      'en': 'Amos',
      'or': 'ଆମୋଷ',
    },
    'lh0m75lw': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    '7v2ihmp4': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    '0jki6ngg': {
      'en': 'Email address',
      'or': 'ଇମେଲ ଠିକଣା',
    },
    'z6b94hml': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    'khs0lxxm': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    'ah1ct4w6': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    '9ozm4h92': {
      'en': 'Languages',
      'or': 'ଭାଷାଗୁଡ଼ିକ',
    },
    '8dwmjx6i': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    'icno6jaj': {
      'en': 'Change',
      'or': 'ପରିବର୍ତ୍ତନ କରନ୍ତୁ',
    },
    '8nht4w4x': {
      'en': 'App appearance',
      'or': 'ଆପ୍‌ର ଦୃଶ୍ୟମାନତା',
    },
    '1vc86uy8': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'i7ryq3vh': {
      'en': 'Light mode',
      'or': 'ଲାଇଟ୍ ମୋଡ୍',
    },
    'uu6w3apy': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'rb3y6o6w': {
      'en': 'System preference',
      'or': 'ସିଷ୍ଟମର ପସନ୍ଦ',
    },
    'ivizhtpm': {
      'en': 'Help and Support',
      'or': 'ସାହାଯ୍ୟ ଏବଂ ସମର୍ଥନ',
    },
    'tf2216tl': {
      'en': 'Looking for info about us?',
      'or': 'ଆମ ବିଷୟରେ ସୂଚନା ଚାହୁଁଛନ୍ତି କି?',
    },
    'aryiutvb': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'sxjplwfs': {
      'en': 'Tips on how to use Pandora?',
      'or': 'ପାଣ୍ଡୋରା ବ୍ୟବହାର କରିବା ପାଇଁ ଟିପ୍ସ?',
    },
    'kkc9hp6n': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'hn2t964h': {
      'en': 'Need something else?',
      'or': 'ଆଉ କିଛି ଦରକାର କି?',
    },
    '4fo9n3nx': {
      'en': 'Contact support',
      'or': 'ସହାୟତା ପାଇଁ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    'oi61pcm4': {
      'en': 'FAQs',
      'or': 'ସାଧାରଣ ପ୍ରଶ୍ନ',
    },
    'pknzjke6': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // ClosingStockLatest
  {
    'jgrzr9ck': {
      'en': 'Closing Stock Entry',
      'or': 'ଷ୍ଟକ୍ ପ୍ରବେଶ ବନ୍ଦ କରିବା',
    },
    'mr7uzt87': {
      'en': 'Enter stock details for the festival period',
      'or': 'ପର୍ବ ଅବଧି ପାଇଁ ଷ୍ଟକ୍ ବିବରଣୀ ପ୍ରବେଶ କରନ୍ତୁ',
    },
    '6onusogq': {
      'en': 'Entry Closed',
      'or': 'ପ୍ରବେଶ ବନ୍ଦ ଅଛି',
    },
    '1a2114dh': {
      'en': 'Add Closing Stock Entry',
      'or': 'କ୍ଲୋଜିଂ ଷ୍ଟକ୍ ଏଣ୍ଟ୍ରି ଯୋଡନ୍ତୁ',
    },
    'x4mhr8w2': {
      'en':
          'Opening stock can only be entered on the festival start date: 10/1/2024',
      'or':
          'ଖୋଲା ଷ୍ଟକ୍ କେବଳ ମହୋତ୍ସବ ଆରମ୍ଭ ତାରିଖ: 10/1/2024 ରେ ପ୍ରବେଶ କରାଯାଇପାରିବ।',
    },
    's0ip3siy': {
      'en': 'Festival Name *',
      'or': 'ପର୍ବ ନାମ *',
    },
    'y4zet4jb': {
      'en': 'Select Fastive',
      'or': 'ଫାଷ୍ଟିଭ୍ ଚୟନ କରନ୍ତୁ',
    },
    'vf7nbbrn': {
      'en': 'Head *',
      'or': 'ମୁଣ୍ଡ *',
    },
    'dtoy3y7c': {
      'en': 'Select head',
      'or': 'ମୁଣ୍ଡ ଚୟନ କରନ୍ତୁ',
    },
    'x0tgke1n': {
      'en': 'Closing Stock Details',
      'or': 'ଷ୍ଟକ୍ ଶେଷ ବିବରଣୀ',
    },
    'f3i854jf': {
      'en': 'Sub Head(Product Name) *',
      'or': 'ଉପମୁଖ୍ୟ(ଉତ୍ପାଦ ନାମ) *',
    },
    'gcxhjjt4': {
      'en': 'Enter Sub head',
      'or': 'ସବ୍ ହେଡ୍ ଏଣ୍ଟର୍ କରନ୍ତୁ',
    },
    'z3xszxpk': {
      'en': 'Unit Type *',
      'or': 'ୟୁନିଟ୍ ପ୍ରକାର *',
    },
    'qjb43n4b': {
      'en': 'Select Unit',
      'or': 'ୟୁନିଟ୍ ଚୟନ କରନ୍ତୁ',
    },
    'qa07bk7r': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    '5ko5fqyt': {
      'en': 'Option 1',
      'or': 'ବିକଳ୍ପ 1',
    },
    'krl1vdcu': {
      'en': 'Option 2',
      'or': 'ବିକଳ୍ପ 2',
    },
    '1obze18c': {
      'en': 'Option 3',
      'or': 'ବିକଳ୍ପ 3',
    },
    'xu9incc4': {
      'en': 'Unity Price *',
      'or': 'ୟୁନିଟି ମୂଲ୍ୟ *',
    },
    '2bkwfooh': {
      'en': '0',
      'or': '0',
    },
    'lq9hz2pl': {
      'en': 'Quantity *',
      'or': 'ପରିମାଣ *',
    },
    '5i61p9xg': {
      'en': '0',
      'or': '0',
    },
    '8j9hp1cr': {
      'en': 'Total Price *',
      'or': 'ମୋଟ ମୂଲ୍ୟ *',
    },
    'zmfj3p3y': {
      'en': '0',
      'or': '0',
    },
    'i9y3kk5n': {
      'en': 'Submit',
      'or': 'ଦାଖଲ କରନ୍ତୁ',
    },
    'lk0unky2': {
      'en': 'Stock Entries',
      'or': 'ଷ୍ଟକ୍ ଏଣ୍ଟ୍ରିଗୁଡ଼ିକ',
    },
    '0nd2eqlc': {
      'en': 'Document Type',
      'or': 'ଡକ୍ୟୁମେଣ୍ଟ ପ୍ରକାର',
    },
    'ojnfs1bm': {
      'en': 'Festival',
      'or': 'ଉତ୍ସବ',
    },
    'hcori03b': {
      'en': 'Submitted',
      'or': 'ଦାଖଲ କରାଯାଇଛି',
    },
    'k9skyyla': {
      'en': 'Status',
      'or': 'ସ୍ଥିତି',
    },
    '28wm0lxx': {
      'en': 'No stock entries found. Add your first entry above.',
      'or':
          'କୌଣସି ଷ୍ଟକ୍ ଏଣ୍ଟ୍ରି ମିଳିଲା ନାହିଁ। ଉପରେ ଆପଣଙ୍କର ପ୍ରଥମ ଏଣ୍ଟ୍ରି ଯୋଡନ୍ତୁ।',
    },
    'n59hmds1': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    '75ysijyy': {
      'en': '1',
      'or': '୧',
    },
    'jund2ug9': {
      'en': 'General Settings',
      'or': 'ସାଧାରଣ ସେଟିଂ',
    },
    'frp6a1z4': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    'i49p4je9': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    'bearqdf1': {
      'en': 'Edit',
      'or': 'ସମ୍ପାଦନ କରନ୍ତୁ',
    },
    'mjsrtgwi': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    '4uoia3lq': {
      'en': 'Amos',
      'or': 'ଆମୋଷ',
    },
    'rm4bz8kq': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    'bve1kpwb': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    'kri4wpvy': {
      'en': 'Email address',
      'or': 'ଇମେଲ ଠିକଣା',
    },
    'kb1c25bc': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    'aw1rbwmm': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    'k81h2jcc': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    'e80xv4nb': {
      'en': 'Languages',
      'or': 'ଭାଷାଗୁଡ଼ିକ',
    },
    't6tw4280': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    '6zbh6a2f': {
      'en': 'Change',
      'or': 'ପରିବର୍ତ୍ତନ କରନ୍ତୁ',
    },
    '5cosr5eo': {
      'en': 'App appearance',
      'or': 'ଆପ୍‌ର ଦୃଶ୍ୟମାନତା',
    },
    '0oxfmf0t': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    '7u004az3': {
      'en': 'Light mode',
      'or': 'ଲାଇଟ୍ ମୋଡ୍',
    },
    '1e8f5bf9': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'batnt3o6': {
      'en': 'System preference',
      'or': 'ସିଷ୍ଟମର ପସନ୍ଦ',
    },
    '18jabwdx': {
      'en': 'Help and Support',
      'or': 'ସାହାଯ୍ୟ ଏବଂ ସମର୍ଥନ',
    },
    'sd5z3yu9': {
      'en': 'Looking for info about us?',
      'or': 'ଆମ ବିଷୟରେ ସୂଚନା ଚାହୁଁଛନ୍ତି କି?',
    },
    'w5ha0d4h': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'fmevb2kg': {
      'en': 'Tips on how to use Pandora?',
      'or': 'ପାଣ୍ଡୋରା ବ୍ୟବହାର କରିବା ପାଇଁ ଟିପ୍ସ?',
    },
    'g3v3u2au': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'vp1h27sv': {
      'en': 'Need something else?',
      'or': 'ଆଉ କିଛି ଦରକାର କି?',
    },
    'loybf1kq': {
      'en': 'Contact support',
      'or': 'ସହାୟତା ପାଇଁ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    'ozuzzu4n': {
      'en': 'FAQs',
      'or': 'ସାଧାରଣ ପ୍ରଶ୍ନ',
    },
    'dtgqmezw': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // ViewClaimDocuments
  {
    'ztkqae27': {
      'en': 'View Claims Status',
      'or': 'ଦାବିର ସ୍ଥିତି ଦେଖନ୍ତୁ',
    },
    'mtspfp7h': {
      'en': 'Track your submitted claims and their approval status',
      'or':
          'ଆପଣଙ୍କର ଦାଖଲ ହୋଇଥିବା ଦାବି ଏବଂ ସେଗୁଡ଼ିକର ଅନୁମୋଦନ ସ୍ଥିତି ଟ୍ରାକ୍ କରନ୍ତୁ',
    },
    'lf89ohzq': {
      'en': 'Last login: Today, 09:30 AM',
      'or': 'ଶେଷ ଲଗଇନ୍: ଆଜି, ସକାଳ ୦୯:୩୦',
    },
    'l555o19m': {
      'en': 'Total Claimed',
      'or': 'ମୋଟ ଦାବି କରାଯାଇଥିବା',
    },
    '5ftlo7x6': {
      'en': '₹0',
      'or': '₹0',
    },
    'xfcbaqkk': {
      'en': 'Across All Festivals',
      'or': 'ସମସ୍ତ ପର୍ବପର୍ବାଣୀରେ',
    },
    'nhms9wjp': {
      'en': 'Approved Amount',
      'or': 'ଅନୁମୋଦିତ ରାଶି',
    },
    'sdy7ucvf': {
      'en': '₹0',
      'or': '₹0',
    },
    '4ns3bzlm': {
      'en': 'Sanctioned',
      'or': 'ମଞ୍ଜୁର ହୋଇଛି',
    },
    '5hudecpc': {
      'en': 'Pending Claims',
      'or': 'ବିଚାରାଧୀନ ଦାବିଗୁଡ଼ିକ',
    },
    'k35ax4sk': {
      'en': '₹0',
      'or': '₹0',
    },
    'vtv568oo': {
      'en': 'Under Review',
      'or': 'ସମୀକ୍ଷା ହେଉଛି',
    },
    'd90sqtxf': {
      'en': 'Claims History\n',
      'or': 'ଦାବିର ଇତିହାସ',
    },
    'nhjczu47': {
      'en': 'Document Type',
      'or': 'ଡକ୍ୟୁମେଣ୍ଟ ପ୍ରକାର',
    },
    'fpoqnmjb': {
      'en': 'Festival',
      'or': 'ଉତ୍ସବ',
    },
    'o42k5t6g': {
      'en': 'Submitted',
      'or': 'ଦାଖଲ କରାଯାଇଛି',
    },
    'fyxoix7l': {
      'en': 'Status',
      'or': 'ସ୍ଥିତି',
    },
    'z81px6s7': {
      'en': 'No Claims Submitted',
      'or': 'କୌଣସି ଦାବି ଦାଖଲ କରାଯାଇନାହିଁ',
    },
    'ujsdd458': {
      'en':
          'You haven\'t submitted any claims yet. Complete your stock entries and upload documents to submit your first claim.',
      'or':
          'ଆପଣ ଏପର୍ଯ୍ୟନ୍ତ କୌଣସି ଦାବି ଦାଖଲ କରିନାହାଁନ୍ତି। ଆପଣଙ୍କର ପ୍ରଥମ ଦାବି ଦାଖଲ କରିବା ପାଇଁ ଆପଣଙ୍କର ଷ୍ଟକ୍ ଏଣ୍ଟ୍ରିଗୁଡ଼ିକୁ ପୂରଣ କରନ୍ତୁ ଏବଂ ଡକ୍ୟୁମେଣ୍ଟଗୁଡ଼ିକୁ ଅପଲୋଡ୍ କରନ୍ତୁ।',
    },
    'tt8u2hos': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    'v7oax8el': {
      'en': '1',
      'or': '୧',
    },
    'y73xh7ya': {
      'en': 'General Settings',
      'or': 'ସାଧାରଣ ସେଟିଂ',
    },
    'kbwhjo7v': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    'g5pm36x9': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    'uoscuba8': {
      'en': 'Edit',
      'or': 'ସମ୍ପାଦନ କରନ୍ତୁ',
    },
    'ess3egwh': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    'tvtgyfnr': {
      'en': 'Amos',
      'or': 'ଆମୋଷ',
    },
    '85t9m3uf': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    'a51si2fk': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    'm156c5hb': {
      'en': 'Email address',
      'or': 'ଇମେଲ ଠିକଣା',
    },
    'u11xyuj0': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    'achlvsmz': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    'rfs9biqn': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    '5mv0qlsc': {
      'en': 'Languages',
      'or': 'ଭାଷାଗୁଡ଼ିକ',
    },
    'd7hx88a3': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    '3le2a6bq': {
      'en': 'Change',
      'or': 'ପରିବର୍ତ୍ତନ କରନ୍ତୁ',
    },
    'ldkfr7o2': {
      'en': 'App appearance',
      'or': 'ଆପ୍‌ର ଦୃଶ୍ୟମାନତା',
    },
    'blbsni42': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    's0xsdned': {
      'en': 'Light mode',
      'or': 'ଲାଇଟ୍ ମୋଡ୍',
    },
    'pa011u40': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'zcwz33kf': {
      'en': 'System preference',
      'or': 'ସିଷ୍ଟମର ପସନ୍ଦ',
    },
    'ocdud24j': {
      'en': 'Help and Support',
      'or': 'ସାହାଯ୍ୟ ଏବଂ ସମର୍ଥନ',
    },
    'meslqto1': {
      'en': 'Looking for info about us?',
      'or': 'ଆମ ବିଷୟରେ ସୂଚନା ଚାହୁଁଛନ୍ତି କି?',
    },
    'em59usie': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    '0fgz4265': {
      'en': 'Tips on how to use Pandora?',
      'or': 'ପାଣ୍ଡୋରା ବ୍ୟବହାର କରିବା ପାଇଁ ଟିପ୍ସ?',
    },
    'njg4c8iv': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'vz31hj21': {
      'en': 'Need something else?',
      'or': 'ଆଉ କିଛି ଦରକାର କି?',
    },
    '7pc8bbj2': {
      'en': 'Contact support',
      'or': 'ସହାୟତା ପାଇଁ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    'nd6clfgn': {
      'en': 'FAQs',
      'or': 'ସାଧାରଣ ପ୍ରଶ୍ନ',
    },
    'mci5nlx2': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // ProfileUser
  {
    'e2t55otb': {
      'en': 'Profile',
      'or': 'ପ୍ରୋଫାଇଲ୍',
    },
    '1sddp7b1': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'qfpckodx': {
      'en': 'Personal Information',
      'or': 'ବ୍ୟକ୍ତିଗତ ସୂଚନା',
    },
    'fn0epzko': {
      'en': 'Upload Profile Image',
      'or': 'ପ୍ରୋଫାଇଲ୍ ଛବି ଅପଲୋଡ୍ କରନ୍ତୁ',
    },
    'rinz0wpc': {
      'en': 'Save Change',
      'or': 'ପରିବର୍ତ୍ତନ ସେଭ୍ କରନ୍ତୁ',
    },
    'ulu6nani': {
      'en': 'Full Name',
      'or': 'ପୂରା ନାମ',
    },
    'ej1jvfn8': {
      'en': 'Enter your full name',
      'or': 'ଆପଣଙ୍କର ସମ୍ପୂର୍ଣ୍ଣ ନାମ ଲେଖନ୍ତୁ',
    },
    'm1irsmxw': {
      'en': 'Email Address',
      'or': 'ଇମେଲ୍ ଠିକଣା',
    },
    'i7cqn48u': {
      'en': 'Enter your email',
      'or': 'ନିଜର ଇମେଲ୍‌ ଲେଖନ୍ତୁ',
    },
    '07epl4t1': {
      'en': 'Phone Number',
      'or': 'ଫୋନ୍ ନମ୍ବର',
    },
    'd5ooysgh': {
      'en': 'Enter your phone number',
      'or': 'ଆପଣଙ୍କ ଫୋନ୍ ନମ୍ବର ପ୍ରବେଶ କରନ୍ତୁ',
    },
    'btzf8vwh': {
      'en': 'Aadhar Number',
      'or': 'ଆଧାର ନମ୍ବର',
    },
    'gds6tyzq': {
      'en': 'Enter your Aadhar Number',
      'or': 'ଆପଣଙ୍କର ଆଧାର ନମ୍ବର ପ୍ରବେଶ କରନ୍ତୁ',
    },
    '9yxud67v': {
      'en': 'Account Settings',
      'or': 'ଆକାଉଣ୍ଟ ସେଟିଙ୍ଗ',
    },
    '7fwes8jh': {
      'en': 'Change Password',
      'or': 'ପାସୱାର୍ଡ ବଦଳାନ୍ତୁ',
    },
    'y9sjathx': {
      'en': 'Language',
      'or': 'ଭାଷା',
    },
    'n9snnsae': {
      'en': 'Support & Legal',
      'or': 'ସମର୍ଥନ ଏବଂ ଆଇନଗତ',
    },
    'sk9uxz1g': {
      'en': 'Terms of Service',
      'or': 'ସେବାର ସର୍ତ୍ତାବଳୀ',
    },
    '6gqub7vu': {
      'en': 'Privacy Policy',
      'or': 'ଗୋପନୀୟତା ନୀତି',
    },
    'kutr8alq': {
      'en': 'Help & Support',
      'or': 'ସାହାଯ୍ୟ ଓ ସମର୍ଥନ',
    },
    'bmklm7if': {
      'en': '- 📧 Email: ',
      'or': '- 📧 ଇମେଲ୍:',
    },
    'omu4lnqc': {
      'en': 'support@msme.gov.in',
      'or': 'support@msme.gov.in',
    },
    'qu8nd7zl': {
      'en': '- ☎️ Phone: ',
      'or': '- ☎️ ଫୋନ୍:',
    },
    'qg87n90i': {
      'en': '1800-123-4567',
      'or': '୧୮୦୦-୧୨୩-୪୫୬୭',
    },
    '4fhnii5j': {
      'en': '- 🕒 Hours: Mon–Fri, 9 AM – 6 PM',
      'or': '- 🕒 ଘଣ୍ଟା: ସୋମ - ଶୁକ୍ର, 9 AM - 6 PM |',
    },
    'o4n92ks6': {
      'en': 'We usually respond within 24 hours.',
      'or': 'ଆମେ ସାଧାରଣତଃ 24 ଘଣ୍ଟା ମଧ୍ୟରେ ଉତ୍ତର ଦେଇଥାଉ।',
    },
    'eifwy82l': {
      'en': 'Preferences',
      'or': 'ପସନ୍ଦଗୁଡ଼ିକ',
    },
    '4lomah1k': {
      'en': 'Dark Mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'k5cruwhv': {
      'en': 'Location Services',
      'or': 'ଲୋକେସନ୍ ସମ୍ପର୍କିତ ସେବାଗୁଡ଼ିକ',
    },
    'sei3u3sv': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // PasswordChange
  {
    '65fneisu': {
      'en': 'Change Your Password',
      'or': 'ଆପଣଙ୍କର ପାସୱାର୍ଡ ବଦଳାନ୍ତୁ',
    },
    'c4ol4eda': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'cbm2ciwu': {
      'en': 'A-',
      'or': 'କ-',
    },
    '69mrozql': {
      'en': 'A',
      'or': 'କ',
    },
    'oe4mlqhx': {
      'en': 'A+',
      'or': 'କ+',
    },
    'w1n3ty0r': {
      'en': 'Update Your Password',
      'or': 'ଆପଣଙ୍କର ପାସୱାର୍ଡ ଅପଡେଟ୍ କରନ୍ତୁ',
    },
    '7cvhjn5a': {
      'en':
          'Please enter your current password and choose a new secure password',
      'or':
          'ଦୟାକରି ଆପଣଙ୍କର ବର୍ତ୍ତମାନର ପାସୱାର୍ଡ ଲେଖନ୍ତୁ ଏବଂ ଏକ ନୂତନ ସୁରକ୍ଷିତ ପାସୱାର୍ଡ ବାଛନ୍ତୁ।',
    },
    'k20lx4sn': {
      'en': 'Current Password',
      'or': 'ସାମ୍ପ୍ରତିକ ପାସୱାର୍ଡ',
    },
    'qzmest11': {
      'en': 'Enter current password',
      'or': 'ସାମ୍ପ୍ରତିକ ପାସୱାର୍ଡ ଲେଖନ୍ତୁ',
    },
    'jj82w82c': {
      'en': 'New Password',
      'or': 'ନୂଆ ପାସୱାର୍ଡ',
    },
    'my43gxxz': {
      'en': 'Enter new password',
      'or': 'ନୂଆ ପାସ୍‌ୱର୍ଡ ଲେଖନ୍ତୁ',
    },
    '8oyfaj48': {
      'en': 'Confirm New Password',
      'or': 'ନୂଆ ପାସୱାର୍ଡ ସୁନିଶ୍ଚିତ କରନ୍ତୁ',
    },
    '1n841am9': {
      'en': 'Confirm new password',
      'or': 'ନୂଆ ପାସ୍‌ୱାର୍ଡ ସୁନିଶ୍ଚିତ କରନ୍ତୁ',
    },
    'ztkmjj68': {
      'en': 'Password Requirements:',
      'or': 'ପାସୱାର୍ଡ ଆବଶ୍ୟକତା:',
    },
    'zzis92c4': {
      'en':
          'Password must be at least 8 characters and include:\n• One uppercase letter (A–Z)\n• One lowercase letter (a–z)\n• One number (0–9)\n• One special character (@\$!%*?&)',
      'or':
          '• ଅତି କମରେ 8 ଅକ୍ଷର ଲମ୍ବା\n• ବଡ଼ ଅକ୍ଷର ଏବଂ ଛୋଟ ଅକ୍ଷର ଅନ୍ତର୍ଭୁକ୍ତ କରନ୍ତୁ\n• ଅତି କମରେ ଗୋଟିଏ ସଂଖ୍ୟା ଅନ୍ତର୍ଭୁକ୍ତ କରନ୍ତୁ\n• ଅତି କମରେ ଗୋଟିଏ ବିଶେଷ ଅକ୍ଷର ଅନ୍ତର୍ଭୁକ୍ତ କରନ୍ତୁ',
    },
    'vol5gkr7': {
      'en': 'Save Change',
      'or': 'ପରିବର୍ତ୍ତନ ସେଭ୍ କରନ୍ତୁ',
    },
    '44dyd1c6': {
      'en': 'Enter current password is required',
      'or': '',
    },
    'yeovmvv1': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    '0a510rim': {
      'en': 'Enter new password is required',
      'or': '',
    },
    'fy6vjk17': {
      'en':
          'Password must be at least 12 characters and include:\n• One uppercase letter (A–Z)\n• One lowercase letter (a–z)\n• One number (0–9)\n• One special character (@\$!%*?&)',
      'or': '',
    },
    'anm5uh65': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'mi0ao68r': {
      'en': 'Confirm new password is required',
      'or': '',
    },
    '29awdz1d': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'vdgsgdcr': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // PrivacyPolicy
  {
    'ry8tqx3x': {
      'en': 'PrivacyPolicy',
      'or': 'ଗୋପନୀୟତା ନୀତି',
    },
    '60s7tc1k': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    's7rh3v0u': {
      'en': 'A-',
      'or': 'କ-',
    },
    'fdew45qr': {
      'en': 'A',
      'or': 'କ',
    },
    '0w4p5ftg': {
      'en': 'A+',
      'or': 'କ+',
    },
    'hujaacu4': {
      'en': 'Last updated: December 15, 2023',
      'or': 'ଶେଷ ଅପଡେଟ୍: ଡିସେମ୍ବର ୧୫, ୨୦୨୩',
    },
    'brwxx03z': {
      'en': 'Information We Collect',
      'or': 'ଆମେ ସଂଗ୍ରହ କରୁଥିବା ସୂଚନା',
    },
    'ndqqhix1': {
      'en':
          'We collect information you provide directly to us, such as when you create an account, make a purchase, or contact us for support. This may include your name, email address, phone number, and payment information.',
      'or':
          'ଆପଣ ଆମକୁ ସିଧାସଳଖ ପ୍ରଦାନ କରୁଥିବା ସୂଚନା ଆମେ ସଂଗ୍ରହ କରୁ, ଯେପରିକି ଆପଣ ଯେତେବେଳେ ଏକ ଆକାଉଣ୍ଟ ତିଆରି କରନ୍ତି, କ୍ରୟ କରନ୍ତି, କିମ୍ବା ସହାୟତା ପାଇଁ ଆମ ସହିତ ଯୋଗାଯୋଗ କରନ୍ତି। ଏଥିରେ ଆପଣଙ୍କର ନାମ, ଇମେଲ୍ ଠିକଣା, ଫୋନ୍ ନମ୍ବର ଏବଂ ପେମେଣ୍ଟ ସୂଚନା ଅନ୍ତର୍ଭୁକ୍ତ ହୋଇପାରେ।',
    },
    '247fnpmi': {
      'en': 'How We Use Your Information',
      'or': 'ଆମେ ଆପଣଙ୍କ ସୂଚନା କିପରି ବ୍ୟବହାର କରୁ',
    },
    '2ijrnk5i': {
      'en':
          'We use the information we collect to provide, maintain, and improve our services, process transactions, send you technical notices and support messages, and communicate with you about products, services, and promotional offers.',
      'or':
          'ଆମେ ସଂଗ୍ରହ କରୁଥିବା ସୂଚନାକୁ ଆମର ସେବା ପ୍ରଦାନ କରିବା, ବଜାୟ ରଖିବା ଏବଂ ଉନ୍ନତ କରିବା, କାରବାର ପ୍ରକ୍ରିୟାକରଣ କରିବା, ଆପଣଙ୍କୁ ବୈଷୟିକ ନୋଟିସ୍ ଏବଂ ସମର୍ଥନ ବାର୍ତ୍ତା ପଠାଇବା ଏବଂ ଉତ୍ପାଦ, ସେବା ଏବଂ ପ୍ରଚାରମୂଳକ ଅଫରଗୁଡ଼ିକ ବିଷୟରେ ଆପଣଙ୍କ ସହିତ ଯୋଗାଯୋଗ କରିବା ପାଇଁ ବ୍ୟବହାର କରୁ।',
    },
    'u071qzmz': {
      'en': 'Information Sharing',
      'or': 'ସୂଚନା ସେୟାରିଂ',
    },
    'x29h78z3': {
      'en':
          'We do not sell, trade, or otherwise transfer your personal information to third parties without your consent, except as described in this policy. We may share your information with trusted service providers who assist us in operating our app and conducting our business.',
      'or':
          'ଏହି ନୀତିରେ ବର୍ଣ୍ଣିତ ବ୍ୟତୀତ, ଆମେ ଆପଣଙ୍କ ସମ୍ମତି ବିନା ତୃତୀୟ ପକ୍ଷକୁ ଆପଣଙ୍କର ବ୍ୟକ୍ତିଗତ ସୂଚନା ବିକ୍ରୟ, ବାଣିଜ୍ୟ କିମ୍ବା ଅନ୍ୟଥା ସ୍ଥାନାନ୍ତର କରୁନାହୁଁ। ଆମେ ଆପଣଙ୍କ ସୂଚନା ବିଶ୍ୱସ୍ତ ସେବା ପ୍ରଦାନକାରୀଙ୍କ ସହ ସେୟାର କରିପାରୁ ଯେଉଁମାନେ ଆମର ଆପ୍ ପରିଚାଳନା ଏବଂ ଆମର ବ୍ୟବସାୟ ପରିଚାଳନାରେ ଆମକୁ ସହାୟତା କରନ୍ତି।',
    },
    '550abjjj': {
      'en': 'Data Security',
      'or': 'ଡାଟା ସୁରକ୍ଷା',
    },
    'm0dvhx3s': {
      'en':
          'We implement appropriate security measures to protect your personal information against unauthorized access, alteration, disclosure, or destruction. However, no method of transmission over the internet is 100% secure.',
      'or':
          'ଆପଣଙ୍କ ବ୍ୟକ୍ତିଗତ ସୂଚନାକୁ ଅନଧିକୃତ ପ୍ରବେଶ, ପରିବର୍ତ୍ତନ, ପ୍ରକାଶ, କିମ୍ବା ନଷ୍ଟ ବିରୁଦ୍ଧରେ ସୁରକ୍ଷା ଦେବା ପାଇଁ ଆମେ ଉପଯୁକ୍ତ ସୁରକ୍ଷା ବ୍ୟବସ୍ଥା କାର୍ଯ୍ୟକାରୀ କରୁ। ତଥାପି, ଇଣ୍ଟରନେଟ୍ ମାଧ୍ୟମରେ ପ୍ରସାରଣର କୌଣସି ପଦ୍ଧତି 100% ସୁରକ୍ଷିତ ନୁହେଁ।',
    },
    '2z0yw18v': {
      'en': 'Your Rights',
      'or': 'ତୁମର ଅଧିକାର',
    },
    'r12avmb6': {
      'en':
          'You have the right to access, update, or delete your personal information. You may also opt out of certain communications from us. To exercise these rights, please contact us using the information provided below.',
      'or':
          'ଆପଣଙ୍କର ବ୍ୟକ୍ତିଗତ ସୂଚନାକୁ ପ୍ରବେଶ, ଅପଡେଟ୍ କିମ୍ବା ଡିଲିଟ୍ କରିବାର ଅଧିକାର ଆପଣଙ୍କର ଅଛି। ଆପଣ ଆମଠାରୁ କିଛି ଯୋଗାଯୋଗରୁ ମଧ୍ୟ ଦୂରେଇ ଯାଇପାରିବେ। ଏହି ଅଧିକାରଗୁଡ଼ିକୁ ବ୍ୟବହାର କରିବା ପାଇଁ, ଦୟାକରି ନିମ୍ନରେ ପ୍ରଦାନ କରାଯାଇଥିବା ସୂଚନା ବ୍ୟବହାର କରି ଆମ ସହିତ ଯୋଗାଯୋଗ କରନ୍ତୁ।',
    },
    'z6k65tr4': {
      'en': 'Cookies and Tracking',
      'or': 'କୁକିଜ୍ ଏବଂ ଟ୍ରାକିଂ',
    },
    '3wbvr02r': {
      'en':
          'We use cookies and similar tracking technologies to enhance your experience, analyze usage patterns, and deliver personalized content. You can control cookie settings through your browser preferences.',
      'or':
          'ଆମେ ଆପଣଙ୍କ ଅଭିଜ୍ଞତାକୁ ବୃଦ୍ଧି କରିବା, ବ୍ୟବହାର ପଦ୍ଧତି ବିଶ୍ଳେଷଣ କରିବା ଏବଂ ବ୍ୟକ୍ତିଗତ ବିଷୟବସ୍ତୁ ପ୍ରଦାନ କରିବା ପାଇଁ କୁକିଜ୍ ଏବଂ ସମାନ ଟ୍ରାକିଂ ପ୍ରଯୁକ୍ତିବିଦ୍ୟା ବ୍ୟବହାର କରୁ। ଆପଣ ଆପଣଙ୍କ ବ୍ରାଉଜର ପସନ୍ଦ ମାଧ୍ୟମରେ କୁକି ସେଟିଂସ୍ ନିୟନ୍ତ୍ରଣ କରିପାରିବେ।',
    },
    '5lvxe76f': {
      'en': 'Children\'s Privacy',
      'or': 'ପିଲାମାନଙ୍କର ଗୋପନୀୟତା',
    },
    '1lbgo1hh': {
      'en':
          'Our service is not intended for children under 13 years of age. We do not knowingly collect personal information from children under 13. If you become aware that a child has provided us with personal information, please contact us.',
      'or':
          'ଆମର ସେବା ୧୩ ବର୍ଷରୁ କମ୍ ବୟସର ପିଲାମାନଙ୍କ ପାଇଁ ଉଦ୍ଦିଷ୍ଟ ନୁହେଁ। ଆମେ ଜାଣିଶୁଣି ୧୩ ବର୍ଷରୁ କମ୍ ବୟସର ପିଲାମାନଙ୍କଠାରୁ ବ୍ୟକ୍ତିଗତ ସୂଚନା ସଂଗ୍ରହ କରୁନାହୁଁ। ଯଦି ଆପଣ ଜାଣିପାରନ୍ତି ଯେ ଜଣେ ପିଲା ଆମକୁ ବ୍ୟକ୍ତିଗତ ସୂଚନା ପ୍ରଦାନ କରିଛି, ଦୟାକରି ଆମ ସହିତ ଯୋଗାଯୋଗ କରନ୍ତୁ।',
    },
    's3iayktw': {
      'en': 'Changes to This Policy',
      'or': 'ଏହି ନୀତିରେ ପରିବର୍ତ୍ତନଗୁଡ଼ିକ',
    },
    '1ekjyqj1': {
      'en':
          'We may update this privacy policy from time to time. We will notify you of any changes by posting the new policy on this page and updating the \'Last updated\' date.',
      'or':
          'ଆମେ ସମୟ ସମୟରେ ଏହି ଗୋପନୀୟତା ନୀତିକୁ ଅପଡେଟ୍ କରିପାରୁ। ଏହି ପୃଷ୍ଠାରେ ନୂତନ ନୀତି ପୋଷ୍ଟ କରି ଏବଂ \'ଶେଷ ଅପଡେଟ୍\' ତାରିଖକୁ ଅପଡେଟ୍ କରି ଆମେ ଆପଣଙ୍କୁ ଯେକୌଣସି ପରିବର୍ତ୍ତନ ବିଷୟରେ ସୂଚିତ କରିବୁ।',
    },
    'b9m3qtuj': {
      'en': 'Contact Us',
      'or': 'ଆମ ସହିତ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    '0gu2nk3m': {
      'en':
          'If you have any questions about this privacy policy, please contact us at privacy@ourapp.com or through our support center within the app.',
      'or':
          'ଯଦି ଆପଣଙ୍କର ଏହି ଗୋପନୀୟତା ନୀତି ବିଷୟରେ କୌଣସି ପ୍ରଶ୍ନ ଅଛି, ଦୟାକରି privacy@ourapp.com ରେ କିମ୍ବା ଆପ୍ ମଧ୍ୟରେ ଥିବା ଆମର ସହାୟତା କେନ୍ଦ୍ର ମାଧ୍ୟମରେ ଆମ ସହିତ ଯୋଗାଯୋଗ କରନ୍ତୁ।',
    },
    '8u7yukd6': {
      'en': '© 2023 Our App. All rights reserved.',
      'or': '© 2023 ଆମର ଆପ୍। ସମସ୍ତ ଅଧିକାର ସଂରକ୍ଷିତ।',
    },
    'f989l4j3': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // TermsofService
  {
    'mwcjrokm': {
      'en': 'TermsofService',
      'or': 'ସେବାର ସର୍ତ୍ତାବଳୀ',
    },
    'cs29t4nl': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'kp1lbckw': {
      'en': 'Last updated: December 15, 2024',
      'or': 'ଶେଷ ଅପଡେଟ୍: ଡିସେମ୍ବର ୧୫, ୨୦୨୪',
    },
    'h0rplvj1': {
      'en': '1. Acceptance of Terms',
      'or': '1. ସର୍ତ୍ତାବଳୀର ଗ୍ରହଣ',
    },
    'jo3urh23': {
      'en':
          'By accessing and using this mobile application, you accept and agree to be bound by the terms and provision of this agreement. If you do not agree to abide by the above, please do not use this service.',
      'or':
          'ଏହି ମୋବାଇଲ୍ ଆପ୍ଲିକେସନ୍ ପ୍ରବେଶ ଏବଂ ବ୍ୟବହାର କରି, ଆପଣ ଏହି ଚୁକ୍ତିନାମାର ନିୟମ ଏବଂ ବ୍ୟବସ୍ଥା ଦ୍ୱାରା ଆବଦ୍ଧ ହେବାକୁ ସ୍ୱୀକାର କରୁଛନ୍ତି ଏବଂ ରାଜି ହେଉଛନ୍ତି। ଯଦି ଆପଣ ଉପରୋକ୍ତ ନିୟମ ପାଳନ କରିବାକୁ ରାଜି ନୁହଁନ୍ତି, ଦୟାକରି ଏହି ସେବା ବ୍ୟବହାର କରନ୍ତୁ ନାହିଁ।',
    },
    'o4pe6ecm': {
      'en': '2. Use License',
      'or': '2. ଲାଇସେନ୍ସ ବ୍ୟବହାର କରନ୍ତୁ',
    },
    'vwl86x8l': {
      'en':
          'Permission is granted to temporarily download one copy of the materials on our application for personal, non-commercial transitory viewing only. This is the grant of a license, not a transfer of title, and under this license you may not:\n\n• modify or copy the materials\n• use the materials for any commercial purpose or for any public display\n• attempt to reverse engineer any software contained in the application\n• remove any copyright or other proprietary notations from the materials',
      'or':
          'ଆମ ଆବେଦନରେ ଥିବା ସାମଗ୍ରୀଗୁଡ଼ିକର ଗୋଟିଏ କପିକୁ କେବଳ ବ୍ୟକ୍ତିଗତ, ଅଣ-ବାଣିଜ୍ୟିକ କ୍ଷଣସ୍ଥାୟୀ ଦର୍ଶନ ପାଇଁ ଅସ୍ଥାୟୀ ଭାବରେ ଡାଉନଲୋଡ୍ କରିବାକୁ ଅନୁମତି ଦିଆଯାଇଛି। ଏହା ଏକ ଲାଇସେନ୍ସର ମଞ୍ଜୁରୀ, ଟାଇଟଲ୍ ଟ୍ରାନ୍ସଫର ନୁହେଁ, ଏବଂ ଏହି ଲାଇସେନ୍ସ ଅଧୀନରେ ଆପଣ ଏହା କରିପାରିବେ ନାହିଁ:\n\n• ସାମଗ୍ରୀଗୁଡ଼ିକୁ ସଂଶୋଧନ କିମ୍ବା କପି କରିପାରିବେ ନାହିଁ\n• କୌଣସି ବାଣିଜ୍ୟିକ ଉଦ୍ଦେଶ୍ୟ ପାଇଁ କିମ୍ବା କୌଣସି ସାର୍ବଜନୀନ ପ୍ରଦର୍ଶନ ପାଇଁ ସାମଗ୍ରୀ ବ୍ୟବହାର କରିପାରିବେ ନାହିଁ\n• ଆପ୍ଲିକେସନରେ ଥିବା ଯେକୌଣସି ସଫ୍ଟୱେର୍ କୁ ଓଲଟା ଇଞ୍ଜିନିୟର କରିବାକୁ ଚେଷ୍ଟା କରିପାରିବେ\n• ସାମଗ୍ରୀରୁ ଯେକୌଣସି କପିରାଇଟ୍ କିମ୍ବା ଅନ୍ୟ ମାଲିକାନା ନୋଟେସନ୍ ଅପସାରଣ କରିପାରିବେ ନାହିଁ',
    },
    'qov5r2av': {
      'en': '3. Disclaimer',
      'or': '3. ଅସ୍ୱୀକାର',
    },
    '3getc0zf': {
      'en':
          'The materials within this application are provided on an \'as is\' basis. We make no warranties, expressed or implied, and hereby disclaim and negate all other warranties including without limitation, implied warranties or conditions of merchantability, fitness for a particular purpose, or non-infringement of intellectual property or other violation of rights.',
      'or':
          'ଏହି ଆବେଦନ ମଧ୍ୟରେ ଥିବା ସାମଗ୍ରୀଗୁଡ଼ିକ \'ଯେପରି ଅଛି\' ଆଧାରରେ ପ୍ରଦାନ କରାଯାଇଛି। ଆମେ କୌଣସି ୱାରେଣ୍ଟି ଦେଉନାହୁଁ, ପ୍ରକାଶିତ କିମ୍ବା ନିହିତ, ଏବଂ ଏହାଦ୍ୱାରା ସୀମାହୀନ, ନିହିତ ୱାରେଣ୍ଟି କିମ୍ବା ବାଣିଜ୍ୟିକତାର ସର୍ତ୍ତାବଳୀ, ଏକ ନିର୍ଦ୍ଦିଷ୍ଟ ଉଦ୍ଦେଶ୍ୟ ପାଇଁ ଉପଯୁକ୍ତତା, କିମ୍ବା ବୌଦ୍ଧିକ ସମ୍ପତ୍ତିର ଅଣ-ଉଲ୍ଲଂଘନ କିମ୍ବା ଅଧିକାରର ଅନ୍ୟାନ୍ୟ ଉଲ୍ଲଂଘନ ସମେତ ଅନ୍ୟ ସମସ୍ତ ୱାରେଣ୍ଟିକୁ ଅସ୍ୱୀକାର ଏବଂ ପ୍ରତ୍ୟାଖ୍ୟାନ କରୁଛୁ।',
    },
    '30031v4y': {
      'en': '4. Limitations',
      'or': '4. ସୀମାବଦ୍ଧତା',
    },
    'w5ihmck9': {
      'en':
          'In no event shall our company or its suppliers be liable for any damages (including, without limitation, damages for loss of data or profit, or due to business interruption) arising out of the use or inability to use the materials on our application, even if we or our authorized representative has been notified orally or in writing of the possibility of such damage. Because some jurisdictions do not allow limitations on implied warranties, or limitations of liability for consequential or incidental damages, these limitations may not apply to you.',
      'or':
          'ଆମ ଆବେଦନରେ ଥିବା ସାମଗ୍ରୀ ବ୍ୟବହାର କିମ୍ବା ବ୍ୟବହାର କରିବାରେ ଅକ୍ଷମତାରୁ ସୃଷ୍ଟି ହୋଇଥିବା କୌଣସି କ୍ଷତି (ସୀମିତତା ବିନା, ତଥ୍ୟ କିମ୍ବା ଲାଭ କ୍ଷତି ପାଇଁ କ୍ଷତି କିମ୍ବା ବ୍ୟବସାୟିକ ବାଧା ଯୋଗୁଁ କ୍ଷତି ସମେତ) ପାଇଁ ଆମର କମ୍ପାନୀ କିମ୍ବା ଏହାର ଯୋଗାଣକାରୀ ଦାୟୀ ରହିବେ ନାହିଁ, ଯଦିଓ ଆମେ କିମ୍ବା ଆମର ଅଧିକୃତ ପ୍ରତିନିଧିଙ୍କୁ ଏପରି କ୍ଷତିର ସମ୍ଭାବନା ବିଷୟରେ ମୌଖିକ କିମ୍ବା ଲିଖିତ ଭାବରେ ସୂଚିତ କରାଯାଇଛି। କାରଣ କିଛି କ୍ଷେତ୍ର ନିହିତ ୱାରେଣ୍ଟି ଉପରେ ସୀମାବଦ୍ଧତା କିମ୍ବା ପରିଣାମସ୍ୱରୂପ କିମ୍ବା ଆକସ୍ମିକ କ୍ଷତି ପାଇଁ ଦାୟିତ୍ବର ସୀମାବଦ୍ଧତାକୁ ଅନୁମତି ଦିଏ ନାହିଁ, ଏହି ସୀମାବଦ୍ଧତା ଆପଣଙ୍କ ପାଇଁ ପ୍ରଯୁଜ୍ୟ ହୋଇପାରେ ନାହିଁ।',
    },
    'isxqxfgj': {
      'en': '5. Privacy Policy',
      'or': '5. ଗୋପନୀୟତା ନୀତି',
    },
    '3bclntrn': {
      'en':
          'Your privacy is important to us. Our Privacy Policy explains how we collect, use, and protect your information when you use our service. By using our service, you agree to the collection and use of information in accordance with our Privacy Policy.',
      'or':
          'ଆପଣଙ୍କ ଗୋପନୀୟତା ଆମ ପାଇଁ ଗୁରୁତ୍ୱପୂର୍ଣ୍ଣ। ଆମର ଗୋପନୀୟତା ନୀତି ବ୍ୟାଖ୍ୟା କରେ ଯେ ଆପଣ ଆମର ସେବା ବ୍ୟବହାର କରିବା ସମୟରେ ଆମେ କିପରି ଆପଣଙ୍କ ସୂଚନା ସଂଗ୍ରହ, ବ୍ୟବହାର ଏବଂ ସୁରକ୍ଷା କରୁ। ଆମର ସେବା ବ୍ୟବହାର କରି, ଆପଣ ଆମର ଗୋପନୀୟତା ନୀତି ଅନୁଯାୟୀ ସୂଚନା ସଂଗ୍ରହ ଏବଂ ବ୍ୟବହାର କରିବାକୁ ରାଜି ହୁଅନ୍ତି।',
    },
    'chf3l4p2': {
      'en': '6. User Accounts',
      'or': '6. ଉପଭୋକ୍ତା ଖାତାଗୁଡିକ',
    },
    '6drn3gde': {
      'en':
          'When you create an account with us, you must provide information that is accurate, complete, and current at all times. You are responsible for safeguarding the password and for all activities that occur under your account. You agree not to disclose your password to any third party.',
      'or':
          'ଯେତେବେଳେ ଆପଣ ଆମ ସହିତ ଏକ ଆକାଉଣ୍ଟ୍ ତିଆରି କରନ୍ତି, ଆପଣଙ୍କୁ ସର୍ବଦା ସଠିକ୍, ସମ୍ପୂର୍ଣ୍ଣ ଏବଂ ସାମ୍ପ୍ରତିକ ସୂଚନା ପ୍ରଦାନ କରିବାକୁ ପଡିବ। ପାସୱାର୍ଡକୁ ସୁରକ୍ଷିତ ରଖିବା ଏବଂ ଆପଣଙ୍କ ଆକାଉଣ୍ଟ୍ ଅଧୀନରେ ହେଉଥିବା ସମସ୍ତ କାର୍ଯ୍ୟକଳାପ ପାଇଁ ଆପଣ ଦାୟୀ। ଆପଣ କୌଣସି ତୃତୀୟ ପକ୍ଷକୁ ଆପଣଙ୍କର ପାସୱାର୍ଡ ପ୍ରକାଶ ନକରିବାକୁ ରାଜି ହେଉଛନ୍ତି।',
    },
    'nfkp9dvj': {
      'en': '7. Prohibited Uses',
      'or': '୭. ନିଷିଦ୍ଧ ବ୍ୟବହାର',
    },
    'vtcu0s4i': {
      'en':
          'You may not use our service:\n\n• For any unlawful purpose or to solicit others to perform unlawful acts\n• To violate any international, federal, provincial, or state regulations, rules, laws, or local ordinances\n• To infringe upon or violate our intellectual property rights or the intellectual property rights of others\n• To harass, abuse, insult, harm, defame, slander, disparage, intimidate, or discriminate\n• To submit false or misleading information',
      'or':
          'ଆପଣ ଆମର ସେବା ବ୍ୟବହାର କରିପାରିବେ ନାହିଁ:\n\n• କୌଣସି ବେଆଇନ ଉଦ୍ଦେଶ୍ୟ ପାଇଁ କିମ୍ବା ଅନ୍ୟମାନଙ୍କୁ ବେଆଇନ କାର୍ଯ୍ୟ କରିବାକୁ ଅନୁରୋଧ କରିବା ପାଇଁ\n• କୌଣସି ଆନ୍ତର୍ଜାତୀୟ, ସଂଘୀୟ, ପ୍ରାଦେଶିକ, କିମ୍ବା ରାଜ୍ୟ ନିୟମ, ନିୟମ, ଆଇନ କିମ୍ବା ସ୍ଥାନୀୟ ନିୟମ ଉଲ୍ଲଂଘନ କରିବା\n• ଆମର ବୌଦ୍ଧିକ ସମ୍ପତ୍ତି ଅଧିକାର କିମ୍ବା ଅନ୍ୟମାନଙ୍କର ବୌଦ୍ଧିକ ସମ୍ପତ୍ତି ଅଧିକାର ଉଲ୍ଲଂଘନ କରିବା କିମ୍ବା ଉଲ୍ଲଂଘନ କରିବା\n• ହଇରାଣ କରିବା, ଅପମାନ କରିବା, କ୍ଷତି କରିବା, ମାନହାନି କରିବା, ନିନ୍ଦା କରିବା, ନିନ୍ଦା କରିବା, ଭୟଭୀତ କରିବା କିମ୍ବା ପକ୍ଷପାତ କରିବା\n• ମିଥ୍ୟା କିମ୍ବା ଭ୍ରାମକ ସୂଚନା ଦାଖଲ କରିବା',
    },
    'hvxc8l7z': {
      'en': '8. Termination',
      'or': '8. ସମାପ୍ତି',
    },
    'v5dhxbii': {
      'en':
          'We may terminate or suspend your account and bar access to the service immediately, without prior notice or liability, under our sole discretion, for any reason whatsoever and without limitation, including but not limited to a breach of the Terms.',
      'or':
          'ଆମେ ଆପଣଙ୍କର ଆକାଉଣ୍ଟକୁ ବନ୍ଦ କିମ୍ବା ସ୍ଥଗିତ କରିପାରୁ ଏବଂ ସେବାକୁ ତୁରନ୍ତ ପ୍ରବେଶ କରିବା ଉପରେ ପ୍ରତିବନ୍ଧକ ଲଗାଇପାରୁ, ଆମର ସମ୍ପୂର୍ଣ୍ଣ ବିବେଚନା ଅନୁଯାୟୀ, ଯେକୌଣସି କାରଣ ପାଇଁ ଏବଂ ସୀମାବଦ୍ଧତା ବିନା, ସର୍ତ୍ତାବଳୀର ଉଲ୍ଲଂଘନ ସମେତ କିନ୍ତୁ ସୀମିତ ନୁହେଁ।',
    },
    'euem7kek': {
      'en': '9. Changes to Terms',
      'or': '9. ସର୍ତ୍ତାବଳୀରେ ପରିବର୍ତ୍ତନ',
    },
    'b2vc0k03': {
      'en':
          'We reserve the right, at our sole discretion, to modify or replace these Terms at any time. If a revision is material, we will provide at least 30 days notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion.',
      'or':
          'ଆମେ ଆମର ସମ୍ପୂର୍ଣ୍ଣ ବିବେଚନା ଅନୁଯାୟୀ, ଯେକୌଣସି ସମୟରେ ଏହି ସର୍ତ୍ତାବଳୀକୁ ସଂଶୋଧନ କିମ୍ବା ପରିବର୍ତ୍ତନ କରିବାର ଅଧିକାର ସଂରକ୍ଷଣ କରୁଛୁ। ଯଦି ଏକ ସଂଶୋଧନ ଗୁରୁତ୍ୱପୂର୍ଣ୍ଣ, ତେବେ ଆମେ ଯେକୌଣସି ନୂତନ ସର୍ତ୍ତାବଳୀ କାର୍ଯ୍ୟକାରୀ ହେବା ପୂର୍ବରୁ ଅତି କମରେ 30 ଦିନର ନୋଟିସ ପ୍ରଦାନ କରିବୁ। କ’ଣ ଏକ ଗୁରୁତ୍ୱପୂର୍ଣ୍ଣ ପରିବର୍ତ୍ତନ ଗଠନ କରେ ତାହା ଆମର ସମ୍ପୂର୍ଣ୍ଣ ବିବେଚନା ଅନୁଯାୟୀ ନିର୍ଣ୍ଣୟ କରାଯିବ।',
    },
    'gamtvz95': {
      'en': '10. Contact Information',
      'or': '୧୦. ଯୋଗାଯୋଗ ସୂଚନା',
    },
    'obw3ddv1': {
      'en':
          'If you have any questions about these Terms of Service, please contact us at support@ourapp.com or through our in-app support feature.',
      'or':
          'ଯଦି ଆପଣଙ୍କର ଏହି ସେବାର ସର୍ତ୍ତାବଳୀ ବିଷୟରେ କୌଣସି ପ୍ରଶ୍ନ ଅଛି, ଦୟାକରି support@ourapp.com ରେ କିମ୍ବା ଆମର ଆପ୍-ଇନ୍ ସମର୍ଥନ ବୈଶିଷ୍ଟ୍ୟ ମାଧ୍ୟମରେ ଆମ ସହିତ ଯୋଗାଯୋଗ କରନ୍ତୁ।',
    },
    'qtv1rn5u': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // ViewUserDetails
  {
    '6cfz2blr': {
      'en': 'Details',
      'or': 'ବିବରଣୀ',
    },
    'lksagfi2': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'dz63bo0c': {
      'en': 'Details',
      'or': 'ବିବରଣୀ',
    },
    '1v3umfxq': {
      'en': 'Loan Number: ',
      'or': 'ଋଣ ନମ୍ବର:',
    },
    '4rmhoxv8': {
      'en': 'First Name: ',
      'or': 'ପ୍ରଥମ ନାମ:',
    },
    'feq2ess7': {
      'en': 'Last Name: ',
      'or': 'ଶେଷ ନାମ:',
    },
    'd68eht38': {
      'en': 'Number: ',
      'or': 'ସଂଖ୍ୟା:',
    },
    'waef3t5g': {
      'en': 'E-Mail: ',
      'or': 'ଇ-ମେଲ୍:',
    },
    'c23aaoa3': {
      'en': 'Street address: ',
      'or': 'ରାସ୍ତା ଠିକଣା:',
    },
    '065znrbf': {
      'en': 'State:',
      'or': 'ଅବସ୍ଥା:',
    },
    'rbx5bfgs': {
      'en': 'City:',
      'or': 'ସହର:',
    },
    'tus18hjf': {
      'en': 'Pin-Code:',
      'or': 'ପିନ୍-କୋଡ୍:',
    },
    '0h4rrnrt': {
      'en': 'Branch:',
      'or': 'ଶାଖା:',
    },
    '5a2cgmjw': {
      'en': 'Total outstanding liablity to OSFC as on the date of application:',
      'or': 'ଆବେଦନ ତାରିଖ ଅନୁଯାୟୀ OSFC ପ୍ରତି ମୋଟ ବକେୟା ଦାୟିତ୍ବ:',
    },
    '8yzgkxlc': {
      'en': 'Nature of industry/product/type of the unit/company:',
      'or': 'ଶିଳ୍ପ/ଉତ୍ପାଦର ପ୍ରକୃତି/ୟୁନିଟ୍/କମ୍ପାନୀର ପ୍ରକାର:',
    },
    'kcsf9pd4': {
      'en':
          'The Present Level of operation of vehicle with Regn. No. (In case the unit/company is not in operation and reasons thereof.):',
      'or':
          'ରେଜିଷ୍ଟ୍ରେସନ ନମ୍ବର ସହିତ ଯାନର ବର୍ତ୍ତମାନର କାର୍ଯ୍ୟ ସ୍ତର (ଯଦି ୟୁନିଟ୍/କମ୍ପାନୀ କାର୍ଯ୍ୟକ୍ଷମ ନଥାଏ ଏବଂ ତାହାର କାରଣ):',
    },
    's6aevbdj': {
      'en':
          'Details of dues, to other institutions,Fls,Banks Including details of settlements reached with them if any.:',
      'or':
          'ଅନ୍ୟ ପ୍ରତିଷ୍ଠାନ, ଫ୍ଲାଇଟ, ବ୍ୟାଙ୍କକୁ ଦେୟ ପ୍ରଦାନର ବିବରଣୀ, ସେମାନଙ୍କ ସହିତ ହୋଇଥିବା ସମାଧାନର ବିବରଣୀ ସମେତ, ଯଦି କୌଣସି ଥାଏ:',
    },
    'prmi5a0w': {
      'en': 'Reasons of non-payment of Corporation\'s dues::',
      'or': 'ନିଗମର ଦେୟ ନଦେବାର କାରଣ::',
    },
    'sjzrhw4i': {
      'en': 'Whether defaulter to other Banks/Fls, if so status of NPA?:',
      'or': 'ଅନ୍ୟ ବ୍ୟାଙ୍କ/ଫ୍ଲାନ୍ସର ଖିଲାପୀ କି, ଯଦି ଅଛି ତେବେ ଏନପିଏର ସ୍ଥିତି?:',
    },
    'fch03ou0': {
      'en':
          'Sailient operational and financial hights of the unit/company for the last 3 financial years in case of disbursement of all eligible loans above rs.30.00 lakh. (Audited Balance Sheet & P/L A/c.of the unit/company for the last 3 years, and Net worth certificate of borrower/applicationt by the Chartered Accountant is enclosed.):',
      'or':
          '୩୦.୦୦ ଲକ୍ଷ ଟଙ୍କାରୁ ଅଧିକ ସମସ୍ତ ଯୋଗ୍ୟ ଋଣ ପ୍ରଦାନ କ୍ଷେତ୍ରରେ ୟୁନିଟ୍/କମ୍ପାନୀର ଗତ ୩ ଆର୍ଥିକ ବର୍ଷ ପାଇଁ ସକ୍ରିୟ କାର୍ଯ୍ୟକ୍ଷମ ଏବଂ ଆର୍ଥିକ ଉଚ୍ଚତା। (ଗତ ୩ ବର୍ଷ ପାଇଁ ୟୁନିଟ୍/କମ୍ପାନୀର ଅଡିଟେଡ୍ ବାଲାନ୍ସ ସିଟ୍ ଏବଂ ପି/ଏଲ୍/ସି, ଏବଂ ଚାଟାର୍ଡ ଆକାଉଣ୍ଟାଣ୍ଟଙ୍କ ଦ୍ୱାରା ଋଣଗ୍ରହୀତାଙ୍କ/ଆବେଦନର ନେଟ୍ ୱର୍ଥ ପ୍ରମାଣପତ୍ର ସଂଲଗ୍ନ କରାଯାଇଛି):',
    },
    'f19khhi2': {
      'en': 'Reasons for settlement of loan dues under OTS:',
      'or': 'OTS ଅଧୀନରେ ଋଣ ଦେୟ ସମାଧାନର କାରଣ:',
    },
    'gnynmc9p': {
      'en': 'Sources of payment of settlement amount:',
      'or': 'ସମାଧାନ ପରିମାଣର ଦେୟ ପାଇଁ ଉତ୍ସ:',
    },
    'wmaqwb4x': {
      'en': 'Terms of payment of the porposed OTS amount:',
      'or': 'ପ୍ରସ୍ତାବିତ OTS ରାଶିର ଦେୟ ସର୍ତ୍ତାବଳୀ:',
    },
    'sl6juhjr': {
      'en': 'Any other particulars that may be relevant to mention.',
      'or': 'ଉଲ୍ଲେଖ କରିବା ପାଇଁ ପ୍ରାସଙ୍ଗିକ ହୋଇପାରେ ଏପରି ଅନ୍ୟ କୌଣସି ବିବରଣୀ।',
    },
    'i582j3el': {
      'en':
          'I/We would request you to consider my/our above offer and advise me/us of the decision taken in this regard at an early date. I/we would be happy to provide any further information/clarification, if needed, to the corporation:',
      'or':
          'ମୁଁ/ଆମେ ଆପଣଙ୍କୁ ଅନୁରୋଧ କରିବୁ ଯେ ମୋର/ଆମର ଉପରୋକ୍ତ ପ୍ରସ୍ତାବକୁ ଶୀଘ୍ର ବିଚାର କରନ୍ତୁ ଏବଂ ଏ ସମ୍ପର୍କରେ ନିଆଯାଇଥିବା ନିଷ୍ପତ୍ତି ବିଷୟରେ ମୋତେ/ଆମକୁ ଅବଗତ କରାନ୍ତୁ। ଆବଶ୍ୟକ ହେଲେ, ମୁଁ/ଆମେ ନିଗମକୁ ଅଧିକ ସୂଚନା/ସ୍ପଷ୍ଟୀକରଣ ପ୍ରଦାନ କରିବାକୁ ଖୁସି ହେବୁ:',
    },
    'imszud9v': {
      'en': 'Checked',
      'or': 'ଯାଞ୍ଚ କରାଯାଇଛି',
    },
    '0fynbiu2': {
      'en':
          'I/We do here by undertake that I/we Will continue payment towerds my/our current dues in terms of loan agrement pending settlement of dues under the OTS Policy-2011. I/We shall not have any claim on delay decision and/or an unfavorable decision on my/our loan settlemente claims/dues. I/We will not have any claims in case the corporation adjusts the initial deposit(s)  and subsequent payment made for settlement of dues under the OTS Policy-2011 towerds normal loan dues on non-compiance of thge terms and conditions of the policy by me/us either in part or full within stipulated time as prescribed in the policy:',
      'or':
          'ମୁଁ/ଆମେ ଏଠାରେ ପ୍ରତିଶ୍ରୁତି ଦେଉଛୁ ଯେ ମୁଁ/ଆମେ OTS ନୀତି-2011 ଅନୁଯାୟୀ ଦେୟ ସମାଧାନ ପାଇଁ ବିଚାରାଧୀନ ଋଣ ଚୁକ୍ତି ଅନୁଯାୟୀ ମୋର/ଆମର ବର୍ତ୍ତମାନର ଦେୟ ପ୍ରଦାନ ଜାରି ରଖିବୁ। ମୋର/ଆମର ଋଣ ସମାଧାନ ଦାବି/ପାଏ ଉପରେ ବିଳମ୍ବ ନିଷ୍ପତ୍ତି ଏବଂ/ଅଥବା ପ୍ରତିକୂଳ ନିଷ୍ପତ୍ତି ଉପରେ ମୋର/ଆମର କୌଣସି ଦାବି ରହିବ ନାହିଁ। ଯଦି ନିଗମ OTS ନୀତି-2011 ଅନୁଯାୟୀ ଦେୟ ସମାଧାନ ପାଇଁ ପ୍ରାରମ୍ଭିକ ଜମା(ଗୁଡ଼ିକ) ଏବଂ ପରବର୍ତ୍ତୀ ଦେୟକୁ ମୋ/ଆମ ଦ୍ୱାରା ନୀତିରେ ନିର୍ଦ୍ଧାରିତ ସମୟ ମଧ୍ୟରେ ଆଂଶିକ କିମ୍ବା ପୂର୍ଣ୍ଣ ଭାବରେ ପରିଚାଳନା ନକରେ ସମାୟୋଜନ କରେ, ତେବେ ମୋର/ଆମର କୌଣସି ଦାବି ରହିବ ନାହିଁ:',
    },
    'lqcia3bu': {
      'en': 'Checked',
      'or': 'ଯାଞ୍ଚ କରାଯାଇଛି',
    },
    '4pjzishz': {
      'en':
          'I/We hereby undertake to pay the settlement of eligible loans as per the scheme parameters:',
      'or':
          'ମୁଁ/ଆମେ ଯୋଜନାର ମାନଦଣ୍ଡ ଅନୁଯାୟୀ ଯୋଗ୍ୟ ଋଣର ସମାଧାନ ପାଇଁ ପ୍ରତିଶ୍ରୁତି ଦେଉଛୁ:',
    },
    'n413e7i5': {
      'en': 'Checked',
      'or': 'ଯାଞ୍ଚ କରାଯାଇଛି',
    },
    'key8pcie': {
      'en':
          'I/We hereby certify that the above information is true to the best of my knowledge.',
      'or':
          'ମୁଁ/ଆମେ ଏହାଦ୍ୱାରା ପ୍ରମାଣିତ କରୁଛୁ ଯେ ଉପରୋକ୍ତ ସୂଚନା ମୋର ସର୍ବୋତ୍ତମ ଜ୍ଞାନ ଅନୁସାରେ ସତ୍ୟ।',
    },
    'fw80x9ym': {
      'en': 'Checked',
      'or': 'ଯାଞ୍ଚ କରାଯାଇଛି',
    },
    'lze25jma': {
      'en': 'Documents',
      'or': 'ଡକ୍ୟୁମେଣ୍ଟଗୁଡିକ',
    },
    'xgh09tck': {
      'en': 'Acknowledgement Slip',
      'or': 'ସ୍ୱୀକୃତି ସ୍ଲିପ୍',
    },
    '611isd0f': {
      'en': 'Download',
      'or': 'ଡାଉନଲୋଡ୍ କରନ୍ତୁ',
    },
    'jdp0or7u': {
      'en': 'Memorandom',
      'or': 'ସ୍ମାରକୀ',
    },
    'swpuqlqd': {
      'en': 'Download',
      'or': 'ଡାଉନଲୋଡ୍ କରନ୍ତୁ',
    },
    'ynsyhhs6': {
      'en': 'No Due Certificate',
      'or': 'କୌଣସି ଦେୟ ପ୍ରମାଣପତ୍ର ନାହିଁ',
    },
    '1u6gw8ig': {
      'en': 'Download',
      'or': 'ଡାଉନଲୋଡ୍ କରନ୍ତୁ',
    },
    'yxzausdz': {
      'en': 'Settlement Order',
      'or': 'ସମାଧାନ ଆଦେଶ',
    },
    'e66lt03k': {
      'en': 'Download',
      'or': 'ଡାଉନଲୋଡ୍ କରନ୍ତୁ',
    },
    'u5f6ejr1': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    'os9r0jcz': {
      'en': '1',
      'or': '୧',
    },
    'pxlz8nxq': {
      'en': 'General Settings',
      'or': 'ସାଧାରଣ ସେଟିଂ',
    },
    'xb1jb205': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    'z5tqyelz': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    '26w5ywxe': {
      'en': 'Edit',
      'or': 'ସମ୍ପାଦନ କରନ୍ତୁ',
    },
    't9my3w2f': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    'xqipdlub': {
      'en': 'Amos',
      'or': 'ଆମୋଷ',
    },
    '23ejyokg': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    'b7rb0995': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    'oehbjlv8': {
      'en': 'Email address',
      'or': 'ଇମେଲ ଠିକଣା',
    },
    '8iwntzvn': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    'leqk81kd': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    '39cwzciy': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    'eid1our6': {
      'en': 'Languages',
      'or': 'ଭାଷାଗୁଡ଼ିକ',
    },
    'zyw46r8l': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    '91qyqf7q': {
      'en': 'Change',
      'or': 'ପରିବର୍ତ୍ତନ କରନ୍ତୁ',
    },
    'pauy6obc': {
      'en': 'App appearance',
      'or': 'ଆପ୍‌ର ଦୃଶ୍ୟମାନତା',
    },
    '7q8y9z6n': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'z6yyqp9z': {
      'en': 'Light mode',
      'or': 'ଲାଇଟ୍ ମୋଡ୍',
    },
    'mu9ymqt8': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'def48jxy': {
      'en': 'System preference',
      'or': 'ସିଷ୍ଟମର ପସନ୍ଦ',
    },
    '2wz4zet2': {
      'en': 'Help and Support',
      'or': 'ସାହାଯ୍ୟ ଏବଂ ସମର୍ଥନ',
    },
    'q13d6zse': {
      'en': 'Looking for info about us?',
      'or': 'ଆମ ବିଷୟରେ ସୂଚନା ଖୋଜୁଛନ୍ତି କି?',
    },
    'kr17gol2': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'l569cay7': {
      'en': 'Tips on how to use Pandora?',
      'or': 'ପାଣ୍ଡୋରା ବ୍ୟବହାର କରିବା ପାଇଁ ଟିପ୍ସ?',
    },
    'g1drx0vz': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'iapw3hc2': {
      'en': 'Need something else?',
      'or': 'ଆଉ କିଛି ଦରକାର କି?',
    },
    'hevqd3cn': {
      'en': 'Contact support',
      'or': 'ସହାୟତା ପାଇଁ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    '3le0nb3r': {
      'en': 'FAQs',
      'or': 'ସାଧାରଣ ପ୍ରଶ୍ନ',
    },
    'uxk4zp7v': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // SanctionOrder
  {
    'e7bsmix1': {
      'en': 'Sanction Order',
      'or': 'ଟେଣ୍ଡର ଫଳାଫଳ',
    },
    'd73o6cl4': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'cxjmmyiw': {
      'en': 'Sanction Order Details',
      'or': 'ଟେଣ୍ଡର ଫଳାଫଳ',
    },
    'glee156s': {
      'en': 'Select...',
      'or': 'ଚୟନ କରନ୍ତୁ...',
    },
    'murnhqnt': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'xovhfh3o': {
      'en': 'Govt Order',
      'or': 'ସରକାରୀ ନିର୍ଦ୍ଦେଶ',
    },
    'hya16e78': {
      'en': 'Float Tender',
      'or': 'ଫ୍ଲୋଟ୍ ଟେଣ୍ଡର',
    },
    'dlb5s5hv': {
      'en': 'Supply Order',
      'or': 'ଯୋଗାଣ ଅର୍ଡର',
    },
    '5q4moxji': {
      'en': 'Tender Result',
      'or': 'ଟେଣ୍ଡର ଫଳାଫଳ',
    },
    'azip6c2w': {
      'en': 'Search Loan Number',
      'or': 'ଋଣ ନମ୍ବର ଖୋଜନ୍ତୁ',
    },
    '5czeeho7': {
      'en': 'Search',
      'or': 'ଖୋଜନ୍ତୁ',
    },
    'hehwzs6w': {
      'en': 'Clear',
      'or': 'ଖାଲି କରନ୍ତୁ',
    },
    '2o5c57ll': {
      'en': 'Add ',
      'or': 'ଖାଲି କରନ୍ତୁ',
    },
    '0bq16ccx': {
      'en': 'Tender No.',
      'or': 'ଟେଣ୍ଡର ନମ୍ବର',
    },
    'g2x5z911': {
      'en': 'Name Of Payee',
      'or': 'ନିଲାମଦାତାଙ୍କ ନାମ',
    },
    'ocfvjlx3': {
      'en': 'Purpose',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    'owl91k1l': {
      'en': 'Amount',
      'or': 'ସ୍ଥିତି',
    },
    '6wienade': {
      'en': 'Action',
      'or': 'ସ୍ଥିତି',
    },
    '4yr8dswl': {
      'en': 'Rows per pages:',
      'or': 'ପ୍ରତି ପୃଷ୍ଠା ଧାଡ଼ି:',
    },
    'oputc68s': {
      'en': '10',
      'or': '୧୦',
    },
    'xs3htdq2': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'eti7vxli': {
      'en': '5',
      'or': '5',
    },
    'of5orc52': {
      'en': '10',
      'or': '୧୦',
    },
    '4hrh7ww3': {
      'en': '25',
      'or': '୨୫',
    },
    'u904030i': {
      'en': '50',
      'or': '୫୦',
    },
    '60mtezpw': {
      'en': '100',
      'or': '୧୦୦',
    },
    'fq4f1ag7': {
      'en': '-',
      'or': '-',
    },
    '60aaxyjr': {
      'en': ' of ',
      'or': 'ର',
    },
    '3lw8hb7q': {
      'en': 'Application',
      'or': 'ପ୍ରୟୋଗ',
    },
    'oapy5z1e': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    'awnqsevd': {
      'en': 'Tender Number',
      'or': 'ଟେଣ୍ଡର ନମ୍ବର',
    },
    'n9f20of5': {
      'en': 'Head of Account',
      'or': 'ଟେଣ୍ଡର ନମ୍ବର',
    },
    'c3q82ikm': {
      'en': 'Name Of Payee',
      'or': 'ନାମ',
    },
    'iayegxb1': {
      'en': 'Address',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    'sl2kpztm': {
      'en': 'Purpose',
      'or': 'ନାମ',
    },
    'ydfiwu45': {
      'en': 'Payment Proposed by',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    'ibmce4cf': {
      'en': 'File Reference',
      'or': 'ନାମ',
    },
    'tv256mh0': {
      'en': 'Expenditure / Purchase Authorisation order',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    'h5tkfwpz': {
      'en': 'Expenditure / Purchase Authorisation Date',
      'or': 'ନାମ',
    },
    'osl9aikz': {
      'en': 'Date of Receipt of the bill from the party',
      'or': 'ନାମ',
    },
    'fxhwkecw': {
      'en': 'Nature of Payment',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    'hst1bgie': {
      'en': 'Advance / Running Bill / Final Payment',
      'or': 'ନାମ',
    },
    'yqfw9ph3': {
      'en': 'Select...',
      'or': '',
    },
    'kugrm6su': {
      'en': 'Search...',
      'or': '',
    },
    '7p1d5qxz': {
      'en': 'Advance',
      'or': '',
    },
    'shcikmpk': {
      'en': 'Running Bill',
      'or': '',
    },
    'iaozd32e': {
      'en': 'Final Payment',
      'or': '',
    },
    '1ru6i4f5': {
      'en': 'Hello World',
      'or': '',
    },
    'qldox4j1': {
      'en': 'MMR No. / Stock Entry Folio No.',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    '51b7qjbi': {
      'en': 'Supplier Advance LFR',
      'or': 'ନାମ',
    },
    '4150iq90': {
      'en': 'Amount of Advance if any requiring adjustment',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    '8tvqnxdv': {
      'en': 'Date of Advance',
      'or': 'ନାମ',
    },
    'mo3qn4w0': {
      'en': 'Mode of Payment (Cash/Cheque/Draft/NEFT/RTGS)',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    '5pfs8bg1': {
      'en': 'Select...',
      'or': '',
    },
    '2zra8ll5': {
      'en': 'Search...',
      'or': '',
    },
    'ndnvua9c': {
      'en': 'Cash',
      'or': '',
    },
    'pp1g3i15': {
      'en': 'Cheque',
      'or': '',
    },
    'oqwtzjcs': {
      'en': 'Draft',
      'or': '',
    },
    '5i1hs8o0': {
      'en': 'NEFT',
      'or': '',
    },
    '06m86wbm': {
      'en': 'RTGS',
      'or': '',
    },
    'cjjc71j3': {
      'en': 'Mode Of Remittance (Counter / Post / Any Other)',
      'or': 'ନାମ',
    },
    '9ci0mbbp': {
      'en': 'Select...',
      'or': '',
    },
    'vtwe9h5x': {
      'en': 'Search...',
      'or': '',
    },
    'bfm46hpl': {
      'en': 'Counter',
      'or': '',
    },
    'm3gwu42c': {
      'en': 'Post',
      'or': '',
    },
    'sup1hhkm': {
      'en': 'Bank Transfer',
      'or': '',
    },
    'vzxy63vj': {
      'en': 'UPI / Mobile Wallets',
      'or': '',
    },
    '6zgap7da': {
      'en': 'Demand Draft',
      'or': '',
    },
    '3efqtwgo': {
      'en': 'Banker’s Cheque',
      'or': '',
    },
    'ufgmetgm': {
      'en': 'Agent / Third-party',
      'or': '',
    },
    '00tb8u80': {
      'en': 'Amount',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    'rapi16ui': {
      'en': 'Details Of Bills / Voucher Enclosed',
      'or': 'ଟେଣ୍ଡର ଫଳାଫଳ',
    },
    '9ix12cbp': {
      'en': 'Name Of payee',
      'or': 'ନାମ',
    },
    'qive1osy': {
      'en': 'No. & Date of voucher / Bill',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    'uslcsski': {
      'en': 'Amount',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    'akxgm08r': {
      'en': 'ADD',
      'or': 'ସେଭ୍ କରନ୍ତୁ',
    },
    'ncpuavif': {
      'en': 'Name Of Payee',
      'or': 'ଟେଣ୍ଡର ନମ୍ବର',
    },
    'byxhrpap': {
      'en': 'No. & Date of voucher / Bill',
      'or': 'ନିଲାମଦାତାଙ୍କ ନାମ',
    },
    'm0m7cc3i': {
      'en': 'Amount',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    '27k14gti': {
      'en': 'Action',
      'or': 'ସ୍ଥିତି',
    },
    'h6lx94qw': {
      'en': 'Proposing Officer Name',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    '4wioqhxm': {
      'en': 'Proposing Officer Designation',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    'v76kjykb': {
      'en': 'Recommending Officer Name',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    '8mqy5njl': {
      'en': 'Recommending Officer Designation',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    's2j1stnh': {
      'en': 'Sanctioning Authority Name',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    'che61mn6': {
      'en': 'Sanctioning Authority Designation',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    'o1xg2tnw': {
      'en': 'Paid Party On Date',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    '6umdwm4c': {
      'en': 'Field is required',
      'or': '',
    },
    'rbjsyhr3': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'msm7ibbw': {
      'en': 'Field is required',
      'or': '',
    },
    'h9ai3m4b': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    '7hlmbrym': {
      'en': 'Field is required',
      'or': '',
    },
    'vibhz3wj': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'w26tw27f': {
      'en': 'Field is required',
      'or': '',
    },
    '867l85il': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'k9bmwuiz': {
      'en': 'Field is required',
      'or': '',
    },
    'hjdfu7cw': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'dxiq213x': {
      'en': 'Field is required',
      'or': '',
    },
    '3eptf09i': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'o0ze956z': {
      'en': 'Field is required',
      'or': '',
    },
    'j0jrm4c7': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'i40k9p17': {
      'en': 'Field is required',
      'or': '',
    },
    'yibrldfq': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    '1guetj6m': {
      'en': 'Field is required',
      'or': '',
    },
    'u3t211pz': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'hx0y1oo5': {
      'en': 'Field is required',
      'or': '',
    },
    'xsfwltpj': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'sni0ya23': {
      'en': 'Field is required',
      'or': '',
    },
    '85obj81g': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'kvz9mvro': {
      'en': 'Field is required',
      'or': '',
    },
    'gehh8ddf': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    '1aw3r6ja': {
      'en': 'Field is required',
      'or': '',
    },
    'k3jjcyro': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    '7amn2bfa': {
      'en': 'Field is required',
      'or': '',
    },
    'fipv8i6f': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'mr4yebxy': {
      'en': 'Field is required',
      'or': '',
    },
    'ovlhyexj': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'vk02xn80': {
      'en': 'Field is required',
      'or': '',
    },
    'lu73nl2h': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'q95nhe6s': {
      'en': 'Field is required',
      'or': '',
    },
    'rph720wh': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    '2wziaqr3': {
      'en': 'Field is required',
      'or': '',
    },
    'nb41yoz0': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    '5gd3pnoz': {
      'en': 'Field is required',
      'or': '',
    },
    'baoapg2b': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'gh4fevc1': {
      'en': 'Field is required',
      'or': '',
    },
    'd71cu47r': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'vrued0sl': {
      'en': 'Field is required',
      'or': '',
    },
    '80m15pn0': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'u266ryw5': {
      'en': 'Field is required',
      'or': '',
    },
    '07un6m80': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    '6izz50h0': {
      'en': 'Payment Recommended',
      'or': '',
    },
    'ccc4yoal': {
      'en': 'Payment Authorised',
      'or': '',
    },
    '75gobwqg': {
      'en': 'Save',
      'or': 'ସେଭ୍ କରନ୍ତୁ',
    },
    'dlevnjit': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    '8wkq3h7l': {
      'en': '1',
      'or': '୧',
    },
    'jkrnf563': {
      'en': 'General Settings',
      'or': 'ସାଧାରଣ ସେଟିଂ',
    },
    'f71u6xvr': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    'wfje7kei': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    'rnk7eyd0': {
      'en': 'Edit',
      'or': 'ସମ୍ପାଦନ କରନ୍ତୁ',
    },
    'h5wa4g3n': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    'n1d25nm8': {
      'en': 'Amos',
      'or': 'ଆମୋଷ',
    },
    'xnxdd7x2': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    'q6n7ufvt': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    'q8898qy1': {
      'en': 'Email address',
      'or': 'ଇମେଲ ଠିକଣା',
    },
    'f2nzjurc': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    'qt2rv7te': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    'awjiw6f1': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    'mf2u4hen': {
      'en': 'Languages',
      'or': 'ଭାଷାଗୁଡ଼ିକ',
    },
    'me2huya4': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    '6ian1wg4': {
      'en': 'Change',
      'or': 'ପରିବର୍ତ୍ତନ କରନ୍ତୁ',
    },
    'h0bi6kfo': {
      'en': 'App appearance',
      'or': 'ଆପ୍‌ର ଦୃଶ୍ୟମାନତା',
    },
    '53zknxvp': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'ywra9uej': {
      'en': 'Light mode',
      'or': 'ଲାଇଟ୍ ମୋଡ୍',
    },
    'ms4we2tc': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    '0adkmtxn': {
      'en': 'System preference',
      'or': 'ସିଷ୍ଟମର ପସନ୍ଦ',
    },
    '8btkk6af': {
      'en': 'Help and Support',
      'or': 'ସାହାଯ୍ୟ ଏବଂ ସମର୍ଥନ',
    },
    'vv8s071c': {
      'en': 'Looking for info about us?',
      'or': 'ଆମ ବିଷୟରେ ସୂଚନା ଚାହୁଁଛନ୍ତି କି?',
    },
    'vqtzlnnf': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'pn7cdgtc': {
      'en': 'Tips on how to use Pandora?',
      'or': 'ପାଣ୍ଡୋରା ବ୍ୟବହାର କରିବା ପାଇଁ ଟିପ୍ସ?',
    },
    'h2j0hnkl': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'xmdrf11b': {
      'en': 'Need something else?',
      'or': 'ଆଉ କିଛି ଦରକାର କି?',
    },
    'dps68l95': {
      'en': 'Contact support',
      'or': 'ସହାୟତା ପାଇଁ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    '3uhi5c97': {
      'en': 'FAQs',
      'or': 'ସାଧାରଣ ପ୍ରଶ୍ନ',
    },
    'q4cfuxi4': {
      'en': 'Home',
      'or': 'ଘର',
    },
    'a9nqfch3': {
      'en': 'Dashboard',
      'or': 'ଡ୍ୟାସବୋର୍ଡ',
    },
    'yb13d7jg': {
      'en': 'Investment',
      'or': 'ନିବେଶ',
    },
    'ca6qkkl5': {
      'en': 'Files',
      'or': 'ଫାଇଲ୍‌ଗୁଡ଼ିକ',
    },
    'xcy777yi': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    'uidlcbeg': {
      'en': 'Log Out',
      'or': 'ଲଗ ଆଉଟ୍',
    },
    'x791knct': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // ProfileOsic
  {
    '1618fcj0': {
      'en': 'Profile',
      'or': 'ପ୍ରୋଫାଇଲ୍',
    },
    'i1oaozgh': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'dnwoca8q': {
      'en': 'Personal Information',
      'or': 'ବ୍ୟକ୍ତିଗତ ସୂଚନା',
    },
    'x6h6v5y6': {
      'en': 'Upload Profile Image',
      'or': 'ପ୍ରୋଫାଇଲ୍ ଛବି ଅପଲୋଡ୍ କରନ୍ତୁ',
    },
    'h49h7vuy': {
      'en': 'Save Change',
      'or': 'ପରିବର୍ତ୍ତନ ସେଭ୍ କରନ୍ତୁ',
    },
    'u32u8oei': {
      'en': 'Full Name',
      'or': 'ପୂରା ନାମ',
    },
    '96jobklh': {
      'en': 'Enter your full name',
      'or': 'ଆପଣଙ୍କର ସମ୍ପୂର୍ଣ୍ଣ ନାମ ଲେଖନ୍ତୁ',
    },
    'o2j1xe9t': {
      'en': 'Email Address',
      'or': 'ଇମେଲ୍ ଠିକଣା',
    },
    'c14bx40c': {
      'en': 'Enter your email',
      'or': 'ନିଜର ଇମେଲ୍‌ ଲେଖନ୍ତୁ',
    },
    'aep762e7': {
      'en': 'Phone Number',
      'or': 'ଫୋନ୍ ନମ୍ବର',
    },
    '016c4o4i': {
      'en': 'Enter your phone number',
      'or': 'ଆପଣଙ୍କ ଫୋନ୍ ନମ୍ବର ପ୍ରବେଶ କରନ୍ତୁ',
    },
    '81ojqk84': {
      'en': 'Account Settings',
      'or': 'ଆକାଉଣ୍ଟ ସେଟିଙ୍ଗ',
    },
    '9hfsdynr': {
      'en': 'Change Password',
      'or': 'ପାସୱାର୍ଡ ବଦଳାନ୍ତୁ',
    },
    'citen73r': {
      'en': 'Language',
      'or': 'ଭାଷା',
    },
    '6msobp8r': {
      'en': 'Support & Legal',
      'or': 'ସମର୍ଥନ ଏବଂ ଆଇନଗତ',
    },
    '7wckymy2': {
      'en': 'Terms of Service',
      'or': 'ସେବାର ସର୍ତ୍ତାବଳୀ',
    },
    '6oq4d6cg': {
      'en': 'Privacy Policy',
      'or': 'ଗୋପନୀୟତା ନୀତି',
    },
    '4ipewk5t': {
      'en': 'Help & Support',
      'or': 'ସାହାଯ୍ୟ ଓ ସମର୍ଥନ',
    },
    'r6gvtwn4': {
      'en': '- 📧 Email: ',
      'or': '- 📧 ଇମେଲ୍:',
    },
    'do9pxv1h': {
      'en': 'support@msme.gov.in',
      'or': 'support@msme.gov.in',
    },
    'wohhy4gy': {
      'en': '- ☎️ Phone: ',
      'or': '- ☎️ ଫୋନ୍:',
    },
    'j1asl8g7': {
      'en': '1800-123-4567',
      'or': '୧୮୦୦-୧୨୩-୪୫୬୭',
    },
    'iq3ndux1': {
      'en': '- 🕒 Hours: Mon–Fri, 9 AM – 6 PM',
      'or': '- 🕒 ଘଣ୍ଟା: ସୋମ - ଶୁକ୍ର, 9 AM - 6 PM |',
    },
    'rw5hdk7f': {
      'en': 'We usually respond within 24 hours.',
      'or': 'ଆମେ ସାଧାରଣତଃ 24 ଘଣ୍ଟା ମଧ୍ୟରେ ଉତ୍ତର ଦେଇଥାଉ।',
    },
    'dz2scnbb': {
      'en': 'Preferences',
      'or': 'ପସନ୍ଦଗୁଡ଼ିକ',
    },
    '9pf7fm6t': {
      'en': 'Dark Mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'q5z7seuz': {
      'en': 'Location Services',
      'or': 'ଲୋକେସନ୍ ସମ୍ପର୍କିତ ସେବାଗୁଡ଼ିକ',
    },
    '5fak5am2': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // TermsofServiceOsic
  {
    '9pc73mpt': {
      'en': 'TermsofService',
      'or': 'ସେବାର ସର୍ତ୍ତାବଳୀ',
    },
    '5yguhbf6': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'hbkhjbsh': {
      'en': 'Last updated: December 15, 2024',
      'or': 'ଶେଷ ଅପଡେଟ୍: ଡିସେମ୍ବର ୧୫, ୨୦୨୪',
    },
    '58k2d9gc': {
      'en': '1. Acceptance of Terms',
      'or': '1. ସର୍ତ୍ତାବଳୀର ଗ୍ରହଣ',
    },
    '8wwelrab': {
      'en':
          'By accessing and using this mobile application, you accept and agree to be bound by the terms and provision of this agreement. If you do not agree to abide by the above, please do not use this service.',
      'or':
          'ଏହି ମୋବାଇଲ୍ ଆପ୍ଲିକେସନ୍ ପ୍ରବେଶ ଏବଂ ବ୍ୟବହାର କରି, ଆପଣ ଏହି ଚୁକ୍ତିନାମାର ନିୟମ ଏବଂ ବ୍ୟବସ୍ଥା ଦ୍ୱାରା ଆବଦ୍ଧ ହେବାକୁ ସ୍ୱୀକାର କରୁଛନ୍ତି ଏବଂ ରାଜି ହେଉଛନ୍ତି। ଯଦି ଆପଣ ଉପରୋକ୍ତ ନିୟମ ପାଳନ କରିବାକୁ ରାଜି ନୁହଁନ୍ତି, ଦୟାକରି ଏହି ସେବା ବ୍ୟବହାର କରନ୍ତୁ ନାହିଁ।',
    },
    'ssl3iy8d': {
      'en': '2. Use License',
      'or': '2. ଲାଇସେନ୍ସ ବ୍ୟବହାର କରନ୍ତୁ',
    },
    'fympvrwv': {
      'en':
          'Permission is granted to temporarily download one copy of the materials on our application for personal, non-commercial transitory viewing only. This is the grant of a license, not a transfer of title, and under this license you may not:\n\n• modify or copy the materials\n• use the materials for any commercial purpose or for any public display\n• attempt to reverse engineer any software contained in the application\n• remove any copyright or other proprietary notations from the materials',
      'or':
          'ଆମ ଆବେଦନରେ ଥିବା ସାମଗ୍ରୀଗୁଡ଼ିକର ଗୋଟିଏ କପିକୁ କେବଳ ବ୍ୟକ୍ତିଗତ, ଅଣ-ବାଣିଜ୍ୟିକ କ୍ଷଣସ୍ଥାୟୀ ଦର୍ଶନ ପାଇଁ ଅସ୍ଥାୟୀ ଭାବରେ ଡାଉନଲୋଡ୍ କରିବାକୁ ଅନୁମତି ଦିଆଯାଇଛି। ଏହା ଏକ ଲାଇସେନ୍ସର ମଞ୍ଜୁରୀ, ଟାଇଟଲ୍ ଟ୍ରାନ୍ସଫର ନୁହେଁ, ଏବଂ ଏହି ଲାଇସେନ୍ସ ଅଧୀନରେ ଆପଣ ଏହା କରିପାରିବେ ନାହିଁ:\n\n• ସାମଗ୍ରୀଗୁଡ଼ିକୁ ସଂଶୋଧନ କିମ୍ବା କପି କରିପାରିବେ ନାହିଁ\n• କୌଣସି ବାଣିଜ୍ୟିକ ଉଦ୍ଦେଶ୍ୟ ପାଇଁ କିମ୍ବା କୌଣସି ସାର୍ବଜନୀନ ପ୍ରଦର୍ଶନ ପାଇଁ ସାମଗ୍ରୀ ବ୍ୟବହାର କରିପାରିବେ ନାହିଁ\n• ଆପ୍ଲିକେସନରେ ଥିବା ଯେକୌଣସି ସଫ୍ଟୱେର୍ କୁ ଓଲଟା ଇଞ୍ଜିନିୟର କରିବାକୁ ଚେଷ୍ଟା କରିପାରିବେ\n• ସାମଗ୍ରୀରୁ ଯେକୌଣସି କପିରାଇଟ୍ କିମ୍ବା ଅନ୍ୟ ମାଲିକାନା ନୋଟେସନ୍ ଅପସାରଣ କରିପାରିବେ ନାହିଁ',
    },
    'mtya1fgc': {
      'en': '3. Disclaimer',
      'or': '3. ଅସ୍ୱୀକାର',
    },
    '1lj6m4u5': {
      'en':
          'The materials within this application are provided on an \'as is\' basis. We make no warranties, expressed or implied, and hereby disclaim and negate all other warranties including without limitation, implied warranties or conditions of merchantability, fitness for a particular purpose, or non-infringement of intellectual property or other violation of rights.',
      'or':
          'ଏହି ଆବେଦନ ମଧ୍ୟରେ ଥିବା ସାମଗ୍ରୀଗୁଡ଼ିକ \'ଯେପରି ଅଛି\' ଆଧାରରେ ପ୍ରଦାନ କରାଯାଇଛି। ଆମେ କୌଣସି ୱାରେଣ୍ଟି ଦେଉନାହୁଁ, ପ୍ରକାଶିତ କିମ୍ବା ନିହିତ, ଏବଂ ଏହାଦ୍ୱାରା ସୀମାହୀନ, ନିହିତ ୱାରେଣ୍ଟି କିମ୍ବା ବାଣିଜ୍ୟିକତାର ସର୍ତ୍ତାବଳୀ, ଏକ ନିର୍ଦ୍ଦିଷ୍ଟ ଉଦ୍ଦେଶ୍ୟ ପାଇଁ ଉପଯୁକ୍ତତା, କିମ୍ବା ବୌଦ୍ଧିକ ସମ୍ପତ୍ତିର ଅଣ-ଉଲ୍ଲଂଘନ କିମ୍ବା ଅଧିକାରର ଅନ୍ୟାନ୍ୟ ଉଲ୍ଲଂଘନ ସମେତ ଅନ୍ୟ ସମସ୍ତ ୱାରେଣ୍ଟିକୁ ଅସ୍ୱୀକାର ଏବଂ ପ୍ରତ୍ୟାଖ୍ୟାନ କରୁଛୁ।',
    },
    'ad38kyfr': {
      'en': '4. Limitations',
      'or': '4. ସୀମାବଦ୍ଧତା',
    },
    'z97je8g1': {
      'en':
          'In no event shall our company or its suppliers be liable for any damages (including, without limitation, damages for loss of data or profit, or due to business interruption) arising out of the use or inability to use the materials on our application, even if we or our authorized representative has been notified orally or in writing of the possibility of such damage. Because some jurisdictions do not allow limitations on implied warranties, or limitations of liability for consequential or incidental damages, these limitations may not apply to you.',
      'or':
          'ଆମ ଆବେଦନରେ ଥିବା ସାମଗ୍ରୀ ବ୍ୟବହାର କିମ୍ବା ବ୍ୟବହାର କରିବାରେ ଅକ୍ଷମତାରୁ ସୃଷ୍ଟି ହୋଇଥିବା କୌଣସି କ୍ଷତି (ସୀମିତତା ବିନା, ତଥ୍ୟ କିମ୍ବା ଲାଭ କ୍ଷତି ପାଇଁ କ୍ଷତି କିମ୍ବା ବ୍ୟବସାୟିକ ବାଧା ଯୋଗୁଁ କ୍ଷତି ସମେତ) ପାଇଁ ଆମର କମ୍ପାନୀ କିମ୍ବା ଏହାର ଯୋଗାଣକାରୀ ଦାୟୀ ରହିବେ ନାହିଁ, ଯଦିଓ ଆମେ କିମ୍ବା ଆମର ଅଧିକୃତ ପ୍ରତିନିଧିଙ୍କୁ ଏପରି କ୍ଷତିର ସମ୍ଭାବନା ବିଷୟରେ ମୌଖିକ କିମ୍ବା ଲିଖିତ ଭାବରେ ସୂଚିତ କରାଯାଇଛି। କାରଣ କିଛି କ୍ଷେତ୍ର ନିହିତ ୱାରେଣ୍ଟି ଉପରେ ସୀମାବଦ୍ଧତା କିମ୍ବା ପରିଣାମସ୍ୱରୂପ କିମ୍ବା ଆକସ୍ମିକ କ୍ଷତି ପାଇଁ ଦାୟିତ୍ବର ସୀମାବଦ୍ଧତାକୁ ଅନୁମତି ଦିଏ ନାହିଁ, ଏହି ସୀମାବଦ୍ଧତା ଆପଣଙ୍କ ପାଇଁ ପ୍ରଯୁଜ୍ୟ ହୋଇପାରେ ନାହିଁ।',
    },
    'wei08o7b': {
      'en': '5. Privacy Policy',
      'or': '5. ଗୋପନୀୟତା ନୀତି',
    },
    '2gdr0h84': {
      'en':
          'Your privacy is important to us. Our Privacy Policy explains how we collect, use, and protect your information when you use our service. By using our service, you agree to the collection and use of information in accordance with our Privacy Policy.',
      'or':
          'ଆପଣଙ୍କ ଗୋପନୀୟତା ଆମ ପାଇଁ ଗୁରୁତ୍ୱପୂର୍ଣ୍ଣ। ଆମର ଗୋପନୀୟତା ନୀତି ବ୍ୟାଖ୍ୟା କରେ ଯେ ଆପଣ ଆମର ସେବା ବ୍ୟବହାର କରିବା ସମୟରେ ଆମେ କିପରି ଆପଣଙ୍କ ସୂଚନା ସଂଗ୍ରହ, ବ୍ୟବହାର ଏବଂ ସୁରକ୍ଷା କରୁ। ଆମର ସେବା ବ୍ୟବହାର କରି, ଆପଣ ଆମର ଗୋପନୀୟତା ନୀତି ଅନୁଯାୟୀ ସୂଚନା ସଂଗ୍ରହ ଏବଂ ବ୍ୟବହାର କରିବାକୁ ରାଜି ହୁଅନ୍ତି।',
    },
    '9phs4jmu': {
      'en': '6. User Accounts',
      'or': '6. ଉପଭୋକ୍ତା ଖାତାଗୁଡିକ',
    },
    'cysl54wl': {
      'en':
          'When you create an account with us, you must provide information that is accurate, complete, and current at all times. You are responsible for safeguarding the password and for all activities that occur under your account. You agree not to disclose your password to any third party.',
      'or':
          'ଯେତେବେଳେ ଆପଣ ଆମ ସହିତ ଏକ ଆକାଉଣ୍ଟ୍ ତିଆରି କରନ୍ତି, ଆପଣଙ୍କୁ ସର୍ବଦା ସଠିକ୍, ସମ୍ପୂର୍ଣ୍ଣ ଏବଂ ସାମ୍ପ୍ରତିକ ସୂଚନା ପ୍ରଦାନ କରିବାକୁ ପଡିବ। ପାସୱାର୍ଡକୁ ସୁରକ୍ଷିତ ରଖିବା ଏବଂ ଆପଣଙ୍କ ଆକାଉଣ୍ଟ୍ ଅଧୀନରେ ହେଉଥିବା ସମସ୍ତ କାର୍ଯ୍ୟକଳାପ ପାଇଁ ଆପଣ ଦାୟୀ। ଆପଣ କୌଣସି ତୃତୀୟ ପକ୍ଷକୁ ଆପଣଙ୍କର ପାସୱାର୍ଡ ପ୍ରକାଶ ନକରିବାକୁ ରାଜି ହେଉଛନ୍ତି।',
    },
    'q3vftqk9': {
      'en': '7. Prohibited Uses',
      'or': '୭. ନିଷିଦ୍ଧ ବ୍ୟବହାର',
    },
    'cw5dumjz': {
      'en':
          'You may not use our service:\n\n• For any unlawful purpose or to solicit others to perform unlawful acts\n• To violate any international, federal, provincial, or state regulations, rules, laws, or local ordinances\n• To infringe upon or violate our intellectual property rights or the intellectual property rights of others\n• To harass, abuse, insult, harm, defame, slander, disparage, intimidate, or discriminate\n• To submit false or misleading information',
      'or':
          'ଆପଣ ଆମର ସେବା ବ୍ୟବହାର କରିପାରିବେ ନାହିଁ:\n\n• କୌଣସି ବେଆଇନ ଉଦ୍ଦେଶ୍ୟ ପାଇଁ କିମ୍ବା ଅନ୍ୟମାନଙ୍କୁ ବେଆଇନ କାର୍ଯ୍ୟ କରିବାକୁ ଅନୁରୋଧ କରିବା ପାଇଁ\n• କୌଣସି ଆନ୍ତର୍ଜାତୀୟ, ସଂଘୀୟ, ପ୍ରାଦେଶିକ, କିମ୍ବା ରାଜ୍ୟ ନିୟମ, ନିୟମ, ଆଇନ କିମ୍ବା ସ୍ଥାନୀୟ ନିୟମ ଉଲ୍ଲଂଘନ କରିବା\n• ଆମର ବୌଦ୍ଧିକ ସମ୍ପତ୍ତି ଅଧିକାର କିମ୍ବା ଅନ୍ୟମାନଙ୍କର ବୌଦ୍ଧିକ ସମ୍ପତ୍ତି ଅଧିକାର ଉଲ୍ଲଂଘନ କରିବା କିମ୍ବା ଉଲ୍ଲଂଘନ କରିବା\n• ହଇରାଣ କରିବା, ଅପମାନ କରିବା, କ୍ଷତି କରିବା, ମାନହାନି କରିବା, ନିନ୍ଦା କରିବା, ନିନ୍ଦା କରିବା, ଭୟଭୀତ କରିବା କିମ୍ବା ପକ୍ଷପାତ କରିବା\n• ମିଥ୍ୟା କିମ୍ବା ଭ୍ରାମକ ସୂଚନା ଦାଖଲ କରିବା',
    },
    '60ef6qys': {
      'en': '8. Termination',
      'or': '8. ସମାପ୍ତି',
    },
    'yrlp065t': {
      'en':
          'We may terminate or suspend your account and bar access to the service immediately, without prior notice or liability, under our sole discretion, for any reason whatsoever and without limitation, including but not limited to a breach of the Terms.',
      'or':
          'ଆମେ ଆପଣଙ୍କର ଆକାଉଣ୍ଟକୁ ବନ୍ଦ କିମ୍ବା ସ୍ଥଗିତ କରିପାରୁ ଏବଂ ସେବାକୁ ତୁରନ୍ତ ପ୍ରବେଶ କରିବା ଉପରେ ପ୍ରତିବନ୍ଧକ ଲଗାଇପାରୁ, ଆମର ସମ୍ପୂର୍ଣ୍ଣ ବିବେଚନା ଅନୁଯାୟୀ, ଯେକୌଣସି କାରଣ ପାଇଁ ଏବଂ ସୀମାବଦ୍ଧତା ବିନା, ସର୍ତ୍ତାବଳୀର ଉଲ୍ଲଂଘନ ସମେତ କିନ୍ତୁ ସୀମିତ ନୁହେଁ।',
    },
    '9xt7ii5j': {
      'en': '9. Changes to Terms',
      'or': '9. ସର୍ତ୍ତାବଳୀରେ ପରିବର୍ତ୍ତନ',
    },
    '50hsd85x': {
      'en':
          'We reserve the right, at our sole discretion, to modify or replace these Terms at any time. If a revision is material, we will provide at least 30 days notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion.',
      'or':
          'ଆମେ ଆମର ସମ୍ପୂର୍ଣ୍ଣ ବିବେଚନା ଅନୁଯାୟୀ, ଯେକୌଣସି ସମୟରେ ଏହି ସର୍ତ୍ତାବଳୀକୁ ସଂଶୋଧନ କିମ୍ବା ପରିବର୍ତ୍ତନ କରିବାର ଅଧିକାର ସଂରକ୍ଷଣ କରୁଛୁ। ଯଦି ଏକ ସଂଶୋଧନ ଗୁରୁତ୍ୱପୂର୍ଣ୍ଣ, ତେବେ ଆମେ ଯେକୌଣସି ନୂତନ ସର୍ତ୍ତାବଳୀ କାର୍ଯ୍ୟକାରୀ ହେବା ପୂର୍ବରୁ ଅତି କମରେ 30 ଦିନର ନୋଟିସ ପ୍ରଦାନ କରିବୁ। କ’ଣ ଏକ ଗୁରୁତ୍ୱପୂର୍ଣ୍ଣ ପରିବର୍ତ୍ତନ ଗଠନ କରେ ତାହା ଆମର ସମ୍ପୂର୍ଣ୍ଣ ବିବେଚନା ଅନୁଯାୟୀ ନିର୍ଣ୍ଣୟ କରାଯିବ।',
    },
    '1qvo7nb9': {
      'en': '10. Contact Information',
      'or': '୧୦. ଯୋଗାଯୋଗ ସୂଚନା',
    },
    'k7arf7gr': {
      'en':
          'If you have any questions about these Terms of Service, please contact us at support@ourapp.com or through our in-app support feature.',
      'or':
          'ଯଦି ଆପଣଙ୍କର ଏହି ସେବାର ସର୍ତ୍ତାବଳୀ ବିଷୟରେ କୌଣସି ପ୍ରଶ୍ନ ଅଛି, ଦୟାକରି support@ourapp.com ରେ କିମ୍ବା ଆମର ଆପ୍-ଇନ୍ ସମର୍ଥନ ବୈଶିଷ୍ଟ୍ୟ ମାଧ୍ୟମରେ ଆମ ସହିତ ଯୋଗାଯୋଗ କରନ୍ତୁ।',
    },
    'uiigo3km': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // PrivacyPolicyosic
  {
    '9f8lt218': {
      'en': 'PrivacyPolicy',
      'or': 'ଗୋପନୀୟତା ନୀତି',
    },
    'd7stmquh': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'eveyuo9c': {
      'en': 'A-',
      'or': 'କ-',
    },
    'acnqbq4k': {
      'en': 'A',
      'or': 'କ',
    },
    '7dezffmy': {
      'en': 'A+',
      'or': 'କ+',
    },
    'z184xjht': {
      'en': 'Last updated: December 15, 2023',
      'or': 'ଶେଷ ଅପଡେଟ୍: ଡିସେମ୍ବର ୧୫, ୨୦୨୩',
    },
    'x0nzbelv': {
      'en': 'Information We Collect',
      'or': 'ଆମେ ସଂଗ୍ରହ କରୁଥିବା ସୂଚନା',
    },
    'ay8l15iv': {
      'en':
          'We collect information you provide directly to us, such as when you create an account, make a purchase, or contact us for support. This may include your name, email address, phone number, and payment information.',
      'or':
          'ଆପଣ ଆମକୁ ସିଧାସଳଖ ପ୍ରଦାନ କରୁଥିବା ସୂଚନା ଆମେ ସଂଗ୍ରହ କରୁ, ଯେପରିକି ଆପଣ ଯେତେବେଳେ ଏକ ଆକାଉଣ୍ଟ ତିଆରି କରନ୍ତି, କ୍ରୟ କରନ୍ତି, କିମ୍ବା ସହାୟତା ପାଇଁ ଆମ ସହିତ ଯୋଗାଯୋଗ କରନ୍ତି। ଏଥିରେ ଆପଣଙ୍କର ନାମ, ଇମେଲ୍ ଠିକଣା, ଫୋନ୍ ନମ୍ବର ଏବଂ ପେମେଣ୍ଟ ସୂଚନା ଅନ୍ତର୍ଭୁକ୍ତ ହୋଇପାରେ।',
    },
    'xnmxnz79': {
      'en': 'How We Use Your Information',
      'or': 'ଆମେ ଆପଣଙ୍କ ସୂଚନା କିପରି ବ୍ୟବହାର କରୁ',
    },
    '5706pi1h': {
      'en':
          'We use the information we collect to provide, maintain, and improve our services, process transactions, send you technical notices and support messages, and communicate with you about products, services, and promotional offers.',
      'or':
          'ଆମେ ସଂଗ୍ରହ କରୁଥିବା ସୂଚନାକୁ ଆମର ସେବା ପ୍ରଦାନ କରିବା, ବଜାୟ ରଖିବା ଏବଂ ଉନ୍ନତ କରିବା, କାରବାର ପ୍ରକ୍ରିୟାକରଣ କରିବା, ଆପଣଙ୍କୁ ବୈଷୟିକ ନୋଟିସ୍ ଏବଂ ସମର୍ଥନ ବାର୍ତ୍ତା ପଠାଇବା ଏବଂ ଉତ୍ପାଦ, ସେବା ଏବଂ ପ୍ରଚାରମୂଳକ ଅଫରଗୁଡ଼ିକ ବିଷୟରେ ଆପଣଙ୍କ ସହିତ ଯୋଗାଯୋଗ କରିବା ପାଇଁ ବ୍ୟବହାର କରୁ।',
    },
    'ajj4682h': {
      'en': 'Information Sharing',
      'or': 'ସୂଚନା ସେୟାରିଂ',
    },
    '0zo585rc': {
      'en':
          'We do not sell, trade, or otherwise transfer your personal information to third parties without your consent, except as described in this policy. We may share your information with trusted service providers who assist us in operating our app and conducting our business.',
      'or':
          'ଏହି ନୀତିରେ ବର୍ଣ୍ଣିତ ବ୍ୟତୀତ, ଆମେ ଆପଣଙ୍କ ସମ୍ମତି ବିନା ତୃତୀୟ ପକ୍ଷକୁ ଆପଣଙ୍କର ବ୍ୟକ୍ତିଗତ ସୂଚନା ବିକ୍ରୟ, ବାଣିଜ୍ୟ କିମ୍ବା ଅନ୍ୟଥା ସ୍ଥାନାନ୍ତର କରୁନାହୁଁ। ଆମେ ଆପଣଙ୍କ ସୂଚନା ବିଶ୍ୱସ୍ତ ସେବା ପ୍ରଦାନକାରୀଙ୍କ ସହ ସେୟାର କରିପାରୁ ଯେଉଁମାନେ ଆମର ଆପ୍ ପରିଚାଳନା ଏବଂ ଆମର ବ୍ୟବସାୟ ପରିଚାଳନାରେ ଆମକୁ ସହାୟତା କରନ୍ତି।',
    },
    '5rvo6y7y': {
      'en': 'Data Security',
      'or': 'ଡାଟା ସୁରକ୍ଷା',
    },
    'vat9fpkd': {
      'en':
          'We implement appropriate security measures to protect your personal information against unauthorized access, alteration, disclosure, or destruction. However, no method of transmission over the internet is 100% secure.',
      'or':
          'ଆପଣଙ୍କ ବ୍ୟକ୍ତିଗତ ସୂଚନାକୁ ଅନଧିକୃତ ପ୍ରବେଶ, ପରିବର୍ତ୍ତନ, ପ୍ରକାଶ, କିମ୍ବା ନଷ୍ଟ ବିରୁଦ୍ଧରେ ସୁରକ୍ଷା ଦେବା ପାଇଁ ଆମେ ଉପଯୁକ୍ତ ସୁରକ୍ଷା ବ୍ୟବସ୍ଥା କାର୍ଯ୍ୟକାରୀ କରୁ। ତଥାପି, ଇଣ୍ଟରନେଟ୍ ମାଧ୍ୟମରେ ପ୍ରସାରଣର କୌଣସି ପଦ୍ଧତି 100% ସୁରକ୍ଷିତ ନୁହେଁ।',
    },
    'ns5cpnrz': {
      'en': 'Your Rights',
      'or': 'ତୁମର ଅଧିକାର',
    },
    'r0sohnx9': {
      'en':
          'You have the right to access, update, or delete your personal information. You may also opt out of certain communications from us. To exercise these rights, please contact us using the information provided below.',
      'or':
          'ଆପଣଙ୍କର ବ୍ୟକ୍ତିଗତ ସୂଚନାକୁ ପ୍ରବେଶ, ଅପଡେଟ୍ କିମ୍ବା ଡିଲିଟ୍ କରିବାର ଅଧିକାର ଆପଣଙ୍କର ଅଛି। ଆପଣ ଆମଠାରୁ କିଛି ଯୋଗାଯୋଗରୁ ମଧ୍ୟ ଦୂରେଇ ଯାଇପାରିବେ। ଏହି ଅଧିକାରଗୁଡ଼ିକୁ ବ୍ୟବହାର କରିବା ପାଇଁ, ଦୟାକରି ନିମ୍ନରେ ପ୍ରଦାନ କରାଯାଇଥିବା ସୂଚନା ବ୍ୟବହାର କରି ଆମ ସହିତ ଯୋଗାଯୋଗ କରନ୍ତୁ।',
    },
    'gqqksryd': {
      'en': 'Cookies and Tracking',
      'or': 'କୁକିଜ୍ ଏବଂ ଟ୍ରାକିଂ',
    },
    'sfroo3io': {
      'en':
          'We use cookies and similar tracking technologies to enhance your experience, analyze usage patterns, and deliver personalized content. You can control cookie settings through your browser preferences.',
      'or':
          'ଆମେ ଆପଣଙ୍କ ଅଭିଜ୍ଞତାକୁ ବୃଦ୍ଧି କରିବା, ବ୍ୟବହାର ପଦ୍ଧତି ବିଶ୍ଳେଷଣ କରିବା ଏବଂ ବ୍ୟକ୍ତିଗତ ବିଷୟବସ୍ତୁ ପ୍ରଦାନ କରିବା ପାଇଁ କୁକିଜ୍ ଏବଂ ସମାନ ଟ୍ରାକିଂ ପ୍ରଯୁକ୍ତିବିଦ୍ୟା ବ୍ୟବହାର କରୁ। ଆପଣ ଆପଣଙ୍କ ବ୍ରାଉଜର ପସନ୍ଦ ମାଧ୍ୟମରେ କୁକି ସେଟିଂସ୍ ନିୟନ୍ତ୍ରଣ କରିପାରିବେ।',
    },
    'w4zv4p88': {
      'en': 'Children\'s Privacy',
      'or': 'ପିଲାମାନଙ୍କର ଗୋପନୀୟତା',
    },
    'n3ooqfzg': {
      'en':
          'Our service is not intended for children under 13 years of age. We do not knowingly collect personal information from children under 13. If you become aware that a child has provided us with personal information, please contact us.',
      'or':
          'ଆମର ସେବା ୧୩ ବର୍ଷରୁ କମ୍ ବୟସର ପିଲାମାନଙ୍କ ପାଇଁ ଉଦ୍ଦିଷ୍ଟ ନୁହେଁ। ଆମେ ଜାଣିଶୁଣି ୧୩ ବର୍ଷରୁ କମ୍ ବୟସର ପିଲାମାନଙ୍କଠାରୁ ବ୍ୟକ୍ତିଗତ ସୂଚନା ସଂଗ୍ରହ କରୁନାହୁଁ। ଯଦି ଆପଣ ଜାଣିପାରନ୍ତି ଯେ ଜଣେ ପିଲା ଆମକୁ ବ୍ୟକ୍ତିଗତ ସୂଚନା ପ୍ରଦାନ କରିଛି, ଦୟାକରି ଆମ ସହିତ ଯୋଗାଯୋଗ କରନ୍ତୁ।',
    },
    'umlp80vx': {
      'en': 'Changes to This Policy',
      'or': 'ଏହି ନୀତିରେ ପରିବର୍ତ୍ତନଗୁଡ଼ିକ',
    },
    'xaij3k9r': {
      'en':
          'We may update this privacy policy from time to time. We will notify you of any changes by posting the new policy on this page and updating the \'Last updated\' date.',
      'or':
          'ଆମେ ସମୟ ସମୟରେ ଏହି ଗୋପନୀୟତା ନୀତିକୁ ଅପଡେଟ୍ କରିପାରୁ। ଏହି ପୃଷ୍ଠାରେ ନୂତନ ନୀତି ପୋଷ୍ଟ କରି ଏବଂ \'ଶେଷ ଅପଡେଟ୍\' ତାରିଖକୁ ଅପଡେଟ୍ କରି ଆମେ ଆପଣଙ୍କୁ ଯେକୌଣସି ପରିବର୍ତ୍ତନ ବିଷୟରେ ସୂଚିତ କରିବୁ।',
    },
    '9k4mae9z': {
      'en': 'Contact Us',
      'or': 'ଆମ ସହିତ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    'vbxgbou7': {
      'en':
          'If you have any questions about this privacy policy, please contact us at privacy@ourapp.com or through our support center within the app.',
      'or':
          'ଯଦି ଆପଣଙ୍କର ଏହି ଗୋପନୀୟତା ନୀତି ବିଷୟରେ କୌଣସି ପ୍ରଶ୍ନ ଅଛି, ଦୟାକରି privacy@ourapp.com ରେ କିମ୍ବା ଆପ୍ ମଧ୍ୟରେ ଥିବା ଆମର ସହାୟତା କେନ୍ଦ୍ର ମାଧ୍ୟମରେ ଆମ ସହିତ ଯୋଗାଯୋଗ କରନ୍ତୁ।',
    },
    'giatl8oe': {
      'en': '© 2023 Our App. All rights reserved.',
      'or': '© 2023 ଆମର ଆପ୍। ସମସ୍ତ ଅଧିକାର ସଂରକ୍ଷିତ।',
    },
    'fn3h1hnq': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // PasswordChangeOsic
  {
    'jyj1eamw': {
      'en': 'Change Your Password',
      'or': 'ଆପଣଙ୍କର ପାସୱାର୍ଡ ବଦଳାନ୍ତୁ',
    },
    'h415a52i': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'sqohpcwo': {
      'en': 'A-',
      'or': 'କ-',
    },
    'rrmnqp6f': {
      'en': 'A',
      'or': 'କ',
    },
    'inpuey3m': {
      'en': 'A+',
      'or': 'କ+',
    },
    '19cwa32m': {
      'en': 'Update Your Password',
      'or': 'ଆପଣଙ୍କର ପାସୱାର୍ଡ ଅପଡେଟ୍ କରନ୍ତୁ',
    },
    'gco5ynu1': {
      'en':
          'Please enter your current password and choose a new secure password',
      'or':
          'ଦୟାକରି ଆପଣଙ୍କର ବର୍ତ୍ତମାନର ପାସୱାର୍ଡ ଲେଖନ୍ତୁ ଏବଂ ଏକ ନୂତନ ସୁରକ୍ଷିତ ପାସୱାର୍ଡ ବାଛନ୍ତୁ।',
    },
    'qgzsf5ta': {
      'en': 'Current Password',
      'or': 'ସାମ୍ପ୍ରତିକ ପାସୱାର୍ଡ',
    },
    'o2y2ue9p': {
      'en': 'Enter current password',
      'or': 'ସାମ୍ପ୍ରତିକ ପାସୱାର୍ଡ ଲେଖନ୍ତୁ',
    },
    'gsbyf2gp': {
      'en': 'New Password',
      'or': 'ନୂଆ ପାସୱାର୍ଡ',
    },
    '2o7ftky2': {
      'en': 'Enter new password',
      'or': 'ନୂଆ ପାସ୍‌ୱର୍ଡ ଲେଖନ୍ତୁ',
    },
    'v8x5n71e': {
      'en': 'Confirm New Password',
      'or': 'ନୂଆ ପାସୱାର୍ଡ ସୁନିଶ୍ଚିତ କରନ୍ତୁ',
    },
    'sp2lnfyk': {
      'en': 'Confirm new password',
      'or': 'ନୂଆ ପାସ୍‌ୱାର୍ଡ ସୁନିଶ୍ଚିତ କରନ୍ତୁ',
    },
    'rlmb1088': {
      'en': 'Password Requirements:',
      'or': 'ପାସୱାର୍ଡ ଆବଶ୍ୟକତା:',
    },
    'cyvjlm1y': {
      'en':
          '• At least 8 characters long\n• Include uppercase and lowercase letters\n• Include at least one number\n• Include at least one special character',
      'or':
          '• ଅତି କମରେ 8 ଅକ୍ଷର ଲମ୍ବା\n• ବଡ଼ ଅକ୍ଷର ଏବଂ ଛୋଟ ଅକ୍ଷର ଅନ୍ତର୍ଭୁକ୍ତ କରନ୍ତୁ\n• ଅତି କମରେ ଗୋଟିଏ ସଂଖ୍ୟା ଅନ୍ତର୍ଭୁକ୍ତ କରନ୍ତୁ\n• ଅତି କମରେ ଗୋଟିଏ ବିଶେଷ ଅକ୍ଷର ଅନ୍ତର୍ଭୁକ୍ତ କରନ୍ତୁ',
    },
    'vajgjtif': {
      'en': 'Save Change',
      'or': 'ପରିବର୍ତ୍ତନ ସେଭ୍ କରନ୍ତୁ',
    },
    't868dd69': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // ViewUserDetailsPage
  {
    'pzhdkcrk': {
      'en': 'Details',
      'or': 'ବିବରଣୀ',
    },
    '18oazb16': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    '5hu31lkn': {
      'en': 'Details',
      'or': 'ବିବରଣୀ',
    },
    'ux60ni5z': {
      'en': 'Tender Number: ',
      'or': 'ଋଣ ନମ୍ବର:',
    },
    '77yd14gr': {
      'en': 'Head Of Account: ',
      'or': 'ପ୍ରଥମ ନାମ:',
    },
    '1t4yxwng': {
      'en': 'Name Of Payee: ',
      'or': 'ଶେଷ ନାମ:',
    },
    '9k082tcb': {
      'en': 'Payee Adress: ',
      'or': 'ସଂଖ୍ୟା:',
    },
    '97bn94n6': {
      'en': 'Purpose: ',
      'or': 'ଇ-ମେଲ୍:',
    },
    '1fbsooem': {
      'en': 'Payment proposed By: ',
      'or': 'ରାସ୍ତା ଠିକଣା:',
    },
    's6i0yrt6': {
      'en': 'Expenditure / Purchease  Authorisation Order:',
      'or': 'ଅବସ୍ଥା:',
    },
    'hayfzzt4': {
      'en': 'Expenditure / Purchease  Authorisation Date:',
      'or': 'ସହର:',
    },
    'heknam2p': {
      'en': 'Date of Receipt of the bill from the party:',
      'or': 'ପିନ୍-କୋଡ୍:',
    },
    'tiyn7mcg': {
      'en': 'Nature of Payment:',
      'or': 'ଶାଖା:',
    },
    'yqu84jhc': {
      'en': 'Payment Type:',
      'or': 'ଶାଖା:',
    },
    'af3l1v6k': {
      'en': 'MMR No. / Stock Entry Folio No:',
      'or': 'ଶାଖା:',
    },
    'nawu3j97': {
      'en': 'Supplier Advance LFR:',
      'or': 'ଶାଖା:',
    },
    'exvh9wgg': {
      'en': 'Amount of Advance if any requiring adjustment:',
      'or': 'ଶାଖା:',
    },
    'cp4vbwlm': {
      'en': 'Date of Advance:',
      'or': 'ଶାଖା:',
    },
    '84anmzoc': {
      'en': 'Mode of P:',
      'or': 'ଶାଖା:',
    },
    'iop487ct': {
      'en': 'Nature of Payment:',
      'or': 'ଶାଖା:',
    },
    'obxhkizm': {
      'en': 'Nature of Payment:',
      'or': 'ଶାଖା:',
    },
    'xbgtofi9': {
      'en': 'Nature of Payment:',
      'or': 'ଶାଖା:',
    },
    '95vyoa0i': {
      'en': 'Settings',
      'or': 'ସେଟିଂସ୍',
    },
    'idhzf7px': {
      'en': '1',
      'or': '୧',
    },
    'pd0gxpix': {
      'en': 'General Settings',
      'or': 'ସାଧାରଣ ସେଟିଂ',
    },
    '2g4yhbqh': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    '9thv6ete': {
      'en': 'Profile details',
      'or': 'ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ',
    },
    'vgy0w1fz': {
      'en': 'Edit',
      'or': 'ସମ୍ପାଦନ କରନ୍ତୁ',
    },
    'u0s46k76': {
      'en': 'First name',
      'or': 'ପ୍ରଥମ ନାମ',
    },
    'l3mf4h1o': {
      'en': 'Amos',
      'or': 'ଆମୋଷ',
    },
    'mcb1c6g7': {
      'en': 'Last name',
      'or': 'ଶେଷ ନାମ',
    },
    'ra16i7ef': {
      'en': 'Ndeto',
      'or': 'Ndeto',
    },
    'y9hogvf5': {
      'en': 'Email address',
      'or': 'ଇମେଲ ଠିକଣା',
    },
    'w1e80jow': {
      'en': 'anzacloud@gmail.com',
      'or': 'anzacloud@gmail.com',
    },
    'lldii9tk': {
      'en': 'Street address',
      'or': 'ରାସ୍ତା ଠିକଣା',
    },
    '52yp92c9': {
      'en': '1 Hackerway, SF',
      'or': '୧ ହ୍ୟାକରୱେ, SF',
    },
    'ofsitsxv': {
      'en': 'Languages',
      'or': 'ଭାଷାଗୁଡ଼ିକ',
    },
    'v2srjt8a': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
    'xd0s8gtn': {
      'en': 'Change',
      'or': 'ପରିବର୍ତ୍ତନ କରନ୍ତୁ',
    },
    'hu4j8xjk': {
      'en': 'App appearance',
      'or': 'ଆପ୍‌ର ଦୃଶ୍ୟମାନତା',
    },
    'zviu37eb': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'lnv7ypyz': {
      'en': 'Light mode',
      'or': 'ଲାଇଟ୍ ମୋଡ୍',
    },
    'jw1upjs9': {
      'en': 'Dark mode',
      'or': 'ଡାର୍କ ମୋଡ୍',
    },
    'o378598m': {
      'en': 'System preference',
      'or': 'ସିଷ୍ଟମର ପସନ୍ଦ',
    },
    'jkbfg5yz': {
      'en': 'Help and Support',
      'or': 'ସାହାଯ୍ୟ ଏବଂ ସମର୍ଥନ',
    },
    'cy33jlcf': {
      'en': 'Looking for info about us?',
      'or': 'ଆମ ବିଷୟରେ ସୂଚନା ଖୋଜୁଛନ୍ତି କି?',
    },
    'ovkkxkl9': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'mss7hrlw': {
      'en': 'Tips on how to use Pandora?',
      'or': 'ପାଣ୍ଡୋରା ବ୍ୟବହାର କରିବା ପାଇଁ ଟିପ୍ସ?',
    },
    '3sdquw3h': {
      'en': 'Learn more',
      'or': 'ଅଧିକ ଜାଣନ୍ତୁ',
    },
    'r7qennvt': {
      'en': 'Need something else?',
      'or': 'ଆଉ କିଛି ଦରକାର କି?',
    },
    'kf49gm3k': {
      'en': 'Contact support',
      'or': 'ସହାୟତା ପାଇଁ ଯୋଗାଯୋଗ କରନ୍ତୁ',
    },
    'iyl3arrm': {
      'en': 'FAQs',
      'or': 'ସାଧାରଣ ପ୍ରଶ୍ନ',
    },
    'w4o0u7ep': {
      'en': 'Home',
      'or': 'ଘର',
    },
  },
  // Header
  {
    'ssftmvxs': {
      'en': 'Overview',
      'or': 'ସଂକ୍ଷିପ୍ତ ବିବରଣୀ',
    },
    'hu4u4p0n': {
      'en': 'A-',
      'or': 'କ-',
    },
    '7hcgr0y3': {
      'en': 'A',
      'or': 'କ',
    },
    'ggg4j4mq': {
      'en': 'A+',
      'or': 'କ+',
    },
    '1jna522s': {
      'en': 'Language',
      'or': 'ଭାଷା',
    },
    '8vdigzl4': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    '7wbxuthg': {
      'en': 'Oriya',
      'or': 'ଓଡ଼ିଆ',
    },
    '8xmfj4b9': {
      'en': 'English',
      'or': 'ଇଂରାଜୀ',
    },
  },
  // MainwebnavOsic
  {
    'tlu0ni83': {
      'en': 'MSME',
      'or': 'ଏମଏସଏମଇ',
    },
    '92se715r': {
      'en': 'Dashboard',
      'or': 'ଡ୍ୟାସବୋର୍ଡ',
    },
    '9aqfpvlq': {
      'en': 'Govt. Order',
      'or': 'ସରକାରୀ ନିର୍ଦ୍ଦେଶ',
    },
    'tngemb24': {
      'en': 'Float Tender',
      'or': 'ଫ୍ଲୋଟ୍ ଟେଣ୍ଡର',
    },
    'ck3o78si': {
      'en': 'Tender Details',
      'or': 'ଟେଣ୍ଡର ଫଳାଫଳ',
    },
    'quo1hpzk': {
      'en': 'Chose  Bidder',
      'or': 'ବିଡର ବାଛିଛନ୍ତି',
    },
    'y4ne4pnb': {
      'en': 'Supply order',
      'or': 'ଯୋଗାଣ ଅର୍ଡର',
    },
    'd8yrq6o4': {
      'en': 'Sanction Order',
      'or': 'ସେଟିଂସ୍',
    },
    'u4gkgd2e': {
      'en': 'Profile',
      'or': 'ସେଟିଂସ୍',
    },
    'iydm1egu': {
      'en': 'Log Out',
      'or': 'ଲଗ ଆଉଟ୍',
    },
  },
  // MainwebnavOkvi
  {
    '10ijdd7e': {
      'en': 'View Sumitted Claim Document',
      'or': 'ଦାଖଲ ହୋଇଥିବା ଦାବି ଡକ୍ୟୁମେଣ୍ଟ ଦେଖନ୍ତୁ',
    },
    'ym64bcso': {
      'en': 'MSME',
      'or': 'ଏମଏସଏମଇ',
    },
    'ql4orlkc': {
      'en': 'Dashboard',
      'or': 'ଡ୍ୟାସବୋର୍ଡ',
    },
    'amvk52fw': {
      'en': 'Opening Stock',
      'or': 'ଓପନିଂ ଷ୍ଟକ୍',
    },
    'h958tbtw': {
      'en': 'Closing Stock',
      'or': 'କ୍ଲୋଜିଂ ଷ୍ଟକ୍',
    },
    'znuxzlkg': {
      'en': 'Claim Document',
      'or': 'ଦାବି ଡକ୍ୟୁମେଣ୍ଟ',
    },
    'zrdh6czz': {
      'en': 'View Claims',
      'or': 'ଦାବିଗୁଡ଼ିକୁ ଦେଖନ୍ତୁ',
    },
    'cqcbdia3': {
      'en': 'KVIC Certificate',
      'or': 'KVIC ସାର୍ଟିଫିକେଟ୍',
    },
    '0y46vnkb': {
      'en': 'Sales Budget',
      'or': 'ବିକ୍ରୟ ବଜେଟ୍',
    },
    '80zugd16': {
      'en': 'Sanction Orders',
      'or': 'ମଞ୍ଜୁରୀ ଆଦେଶ',
    },
    'j30ipto4': {
      'en': 'OKVI Department',
      'or': 'OKVI ବିଭାଗ',
    },
    'migfw8g9': {
      'en': 'okviadmin@gmail.com',
      'or': 'okviadmin@gmail.com',
    },
  },
  // MainwebnavOsfcBranch
  {
    'xacy9zll': {
      'en': 'MSME',
      'or': 'ଏମଏସଏମଇ',
    },
    'r3ztxpak': {
      'en': 'Dashboard',
      'or': 'ଡ୍ୟାସବୋର୍ଡ',
    },
    '5wyhl98j': {
      'en': 'Application List',
      'or': 'ଆପ୍ଲିକେସନ୍ ତାଲିକା',
    },
    '63i6ppe2': {
      'en': 'Acknowledgement',
      'or': 'ସ୍ୱୀକୃତି',
    },
    '3leiu11p': {
      'en': 'Memorandom',
      'or': 'ସ୍ମାରକୀ',
    },
    '0xbbe4mt': {
      'en': 'No Due Certificate',
      'or': 'କୌଣସି ଦେୟ ପ୍ରମାଣପତ୍ର ନାହିଁ',
    },
    '0n6skauk': {
      'en': 'Existing Loan',
      'or': 'ପୂର୍ବରୁ ଥିବା ଋଣ',
    },
    'zvylmsn7': {
      'en': 'Log Out',
      'or': 'ଲଗ ଆଉଟ୍',
    },
  },
  // MainwebnavOsfcUser
  {
    'f95o7e85': {
      'en': 'MSME',
      'or': 'ଏମଏସଏମଇ',
    },
    '76rrw6qe': {
      'en': 'Dashboard',
      'or': 'ଡ୍ୟାସବୋର୍ଡ',
    },
    'mrzcqj1j': {
      'en': 'Application Form',
      'or': 'ଆବେଦନ ଫର୍ମ',
    },
    'lhb21jo0': {
      'en': 'Submitted OTS Forms',
      'or': 'ଦାଖଲ ହୋଇଥିବା OTS ଫର୍ମ',
    },
    '63y25qf3': {
      'en': 'Acknowledgement Slip',
      'or': 'ସ୍ୱୀକୃତି ସ୍ଲିପ୍',
    },
    'vki8cxvo': {
      'en': 'Settlement Order',
      'or': 'ସମାଧାନ ଆଦେଶ',
    },
    'b6clr57f': {
      'en': 'No Due Certificate',
      'or': 'କୌଣସି ଦେୟ ପ୍ରମାଣପତ୍ର ନାହିଁ',
    },
    'cbeb0px8': {
      'en': 'Exsiting Loan',
      'or': 'ପ୍ରଚଳିତ ଋଣ',
    },
    '9xhgxvyc': {
      'en': 'Profile',
      'or': 'ପ୍ରୋଫାଇଲ୍',
    },
    '4y91bxfn': {
      'en': 'Log Out',
      'or': 'ଲଗ ଆଉଟ୍',
    },
  },
  // MainwebnavOsfcAdmin
  {
    'g47ej3j9': {
      'en': 'MSME',
      'or': 'ଏମଏସଏମଇ',
    },
    'jpium7ds': {
      'en': 'Dashboard',
      'or': 'ଡ୍ୟାସବୋର୍ଡ',
    },
    '2s4iot50': {
      'en': 'Application List',
      'or': 'ଆପ୍ଲିକେସନ୍ ତାଲିକା',
    },
    '616uz74s': {
      'en': 'Acknowledgement',
      'or': 'ସ୍ୱୀକୃତି',
    },
    'g4si9p2v': {
      'en': 'Memorandom',
      'or': 'ସ୍ମାରକୀ',
    },
    '3cdofyzv': {
      'en': 'SettlementOrder',
      'or': 'ସମାଧାନ କ୍ରମ',
    },
    'tqnf30un': {
      'en': 'No Due Certificate',
      'or': 'କୌଣସି ଦେୟ ପ୍ରମାଣପତ୍ର ନାହିଁ',
    },
    'yuubs0bh': {
      'en': 'Existing Loan',
      'or': 'ପୂର୍ବରୁ ଥିବା ଋଣ',
    },
    'vzz0fkg5': {
      'en': 'Log Out',
      'or': 'ଲଗ ଆଉଟ୍',
    },
  },
  // footer
  {
    '8tz2mwws': {
      'en': '© 2025 MSME Department. All rights reserved.',
      'or': '© ୨୦୨୫ ଏମଏସଏମଇ ବିଭାଗ। ସର୍ବସତ୍ତ୍ୱ ସଂରକ୍ଷିତ।',
    },
    '896uxala': {
      'en': 'Design & Developed by Qwegle, Odisha State Centre.',
      'or': 'ଡିଜାଇନ୍ ଏବଂ ବିକଶିତ କ୍ୱେଗଲ୍, ଓଡ଼ିଶା ରାଜ୍ୟ କେନ୍ଦ୍ର ଦ୍ୱାରା।',
    },
    '09mrrm83': {
      'en': 'Design & Developed by Qwegle.',
      'or': 'ଡିଜାଇନ୍ ଏବଂ Qwegle ଦ୍ୱାରା ବିକଶିତ।',
    },
  },
  // Remark
  {
    '1mn816w0': {
      'en': 'Remark',
      'or': 'ମନ୍ତବ୍ୟ',
    },
    '8njumzb1': {
      'en': 'Remark',
      'or': 'ମନ୍ତବ୍ୟ',
    },
    'rqgczk48': {
      'en': 'Sumbit',
      'or': 'ସମ୍ବିଟ୍',
    },
    'pwscirbh': {
      'en': 'Cancel',
      'or': 'ବାତିଲ କରନ୍ତୁ',
    },
  },
  // UploadAck
  {
    'xe3nf5c4': {
      'en': 'Upload Acknowledgement Slip',
      'or': 'ସ୍ୱୀକୃତି ସ୍ଲିପ୍ ଅପଲୋଡ୍ କରନ୍ତୁ',
    },
    'vuz2mkqa': {
      'en': 'Enter Loan number...',
      'or': 'ଋଣ ନମ୍ବର ପ୍ରବେଶ କରନ୍ତୁ...',
    },
    'c5n7mqoj': {
      'en': 'Receiving Officer Name',
      'or': 'ଗ୍ରହଣକାରୀ ଅଧିକାରୀଙ୍କ ନାମ',
    },
    'jop5js86': {
      'en': 'SIgneture Date',
      'or': 'ସିଗ୍ନେଚର ତାରିଖ',
    },
    'url67djj': {
      'en': 'Deposit Amount',
      'or': 'ଜମା ରାଶି',
    },
    '2b9oxzha': {
      'en': 'RAC Amount',
      'or': 'RAC ଆମାଉଣ୍ଟ',
    },
    '26bh6egm': {
      'en': 'RAC Date',
      'or': 'RAC ତାରିଖ',
    },
    'a7bj631z': {
      'en': 'Deposit Type',
      'or': 'ଜମା ପ୍ରକାର',
    },
    'c18z7loj': {
      'en': 'Select...',
      'or': 'ଚୟନ କରନ୍ତୁ...',
    },
    'qofv35a1': {
      'en': 'Search...',
      'or': 'ଖୋଜନ୍ତୁ...',
    },
    'f8wxryzj': {
      'en': 'dd',
      'or': 'ଦିନ',
    },
    'stlgnkkn': {
      'en': 'cash',
      'or': 'ନଗଦ',
    },
    'xiodlhrd': {
      'en': 'pay order',
      'or': 'ଦେୟ କ୍ରମ',
    },
    'd929ne5m': {
      'en': 'bankers  cheque',
      'or': 'ବ୍ୟାଙ୍କର୍ସ ଚେକ୍',
    },
    '7o9ek9d8': {
      'en': 'Deposit Date',
      'or': 'ଜମା ତାରିଖ',
    },
    'orfj4sk1': {
      'en': 'OSFC MR No.',
      'or': 'OSFC MR ନମ୍ବର',
    },
    '2a06don3': {
      'en': 'Upload Slip',
      'or': 'ସ୍ଲିପ୍ ଅପଲୋଡ୍ କରନ୍ତୁ',
    },
    '3ijiqhdb': {
      'en': 'Submit',
      'or': 'ଦାଖଲ କରନ୍ତୁ',
    },
    '45r8enkz': {
      'en': ' Loan number is required',
      'or': '',
    },
    '6mae0hgi': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    's0nvw14f': {
      'en': 'Field is required',
      'or': '',
    },
    'afejqpm0': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'rs4vq0j8': {
      'en': 'Field is required',
      'or': '',
    },
    'ieyi13tk': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    '7cc5zjur': {
      'en': 'Field is required',
      'or': '',
    },
    'rqojyzxd': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'kqz9vywi': {
      'en': 'Field is required',
      'or': '',
    },
    'rivpl09q': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
  },
  // MobileVersionNotAvailable
  {
    'u1shp3he': {
      'en': 'Web Portal Only',
      'or': 'କେବଳ ୱେବ୍ ପୋର୍ଟାଲ',
    },
    'paxdhary': {
      'en': 'This feature is only available on our web portal',
      'or': 'ଏହି ବୈଶିଷ୍ଟ୍ୟ କେବଳ ଆମର ୱେବ୍ ପୋର୍ଟାଲରେ ଉପଲବ୍ଧ।',
    },
    'ahjdyqq0': {
      'en': 'Visit our website on desktop or laptop',
      'or': 'ଡେସ୍କଟପ୍ କିମ୍ବା ଲାପଟପ୍‌ରେ ଆମର ୱେବସାଇଟ୍ ପରିଦର୍ଶନ କରନ୍ତୁ',
    },
    'yed0te9m': {
      'en': 'Access full features through web browser',
      'or': 'ୱେବ୍ ବ୍ରାଉଜର ମାଧ୍ୟମରେ ସମ୍ପୂର୍ଣ୍ଣ ବୈଶିଷ୍ଟ୍ୟଗୁଡ଼ିକୁ ଆକ୍ସେସ୍ କରନ୍ତୁ',
    },
    'd3gviaad': {
      'en': 'Enhanced security and functionality',
      'or': 'ଉନ୍ନତ ସୁରକ୍ଷା ଏବଂ କାର୍ଯ୍ୟକ୍ଷମତା',
    },
  },
  // PaymentForm
  {
    'teekcsig': {
      'en': 'Application',
      'or': 'ପ୍ରୟୋଗ',
    },
    'e95pxw7y': {
      'en': 'Update your profile and how people can contact you generally',
      'or':
          'ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ଏବଂ ଲୋକମାନେ ସାଧାରଣତଃ ଆପଣଙ୍କୁ କିପରି ଯୋଗାଯୋଗ କରିପାରିବେ ତାହା ଅପଡେଟ୍ କରନ୍ତୁ।',
    },
    '68hfqd15': {
      'en': 'Payment Slip',
      'or': 'ଟେଣ୍ଡର ଫଳାଫଳ',
    },
    'qcvhpkmi': {
      'en': 'Tender Number',
      'or': 'ଟେଣ୍ଡର ନମ୍ବର',
    },
    'vrly6547': {
      'en': 'Head of Account',
      'or': 'ଟେଣ୍ଡର ନମ୍ବର',
    },
    'vb3lv4l8': {
      'en': 'Name Of Payee',
      'or': 'ନାମ',
    },
    '2rtsomql': {
      'en': 'Address',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    '4lqzcn0e': {
      'en': 'Purpose',
      'or': 'ନାମ',
    },
    '1tn7h077': {
      'en': 'Payment Proposed by',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    'zov530v2': {
      'en': 'File Reference',
      'or': 'ନାମ',
    },
    'kxmjpg0q': {
      'en': 'Expenditure / Purchase Authorisation order',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    '97utv7da': {
      'en': 'Expenditure / Purchase Authorisation Date',
      'or': 'ନାମ',
    },
    'g9ilnti1': {
      'en': 'Date of Receipt of the bill from the party',
      'or': 'ନାମ',
    },
    'cqwx2h52': {
      'en': 'Nature of Payment',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    '3zj6ohh6': {
      'en': 'Advance / Running Bill / Final Payment',
      'or': 'ନାମ',
    },
    'nzjyxy37': {
      'en': 'Select...',
      'or': '',
    },
    'guth9xu6': {
      'en': 'Search...',
      'or': '',
    },
    'awj30y4m': {
      'en': 'Advance',
      'or': '',
    },
    'icu8in7h': {
      'en': 'Running Bill',
      'or': '',
    },
    'q6fuyshf': {
      'en': 'Final Payment',
      'or': '',
    },
    '8umiwdnu': {
      'en': 'MMR No. / Stock Entry Folio No.',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    '5y7jh5w7': {
      'en': 'Supplier Advance LFR',
      'or': 'ନାମ',
    },
    'g7pinp3m': {
      'en': 'Amount of Advance if any requiring adjustment',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    'kh4mez5v': {
      'en': 'Date of Advance',
      'or': 'ନାମ',
    },
    'xz1zv43m': {
      'en': 'Mode of Payment (Cash/Cheque/Draft/NEFT/RTGS)',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    'vmv2a1o7': {
      'en': 'Select...',
      'or': '',
    },
    'bbsvs6ds': {
      'en': 'Search...',
      'or': '',
    },
    'wkoqazko': {
      'en': 'Cash',
      'or': '',
    },
    '8pzwkf4e': {
      'en': 'Cheque',
      'or': '',
    },
    '7vqq68mz': {
      'en': 'Draft',
      'or': '',
    },
    'v82xq4yp': {
      'en': 'NEFT',
      'or': '',
    },
    'fdsz3ej8': {
      'en': 'RTGS',
      'or': '',
    },
    'jmmdnvc0': {
      'en': 'Mode Of Remittance (Counter / Post / Any Other)',
      'or': 'ନାମ',
    },
    'zj9o5a97': {
      'en': 'Select...',
      'or': '',
    },
    '20eirbp9': {
      'en': 'Search...',
      'or': '',
    },
    'a1mg8t2r': {
      'en': 'Counter',
      'or': '',
    },
    '3nkg2jw0': {
      'en': 'Post',
      'or': '',
    },
    'rhypzv1k': {
      'en': 'Bank Transfer',
      'or': '',
    },
    'c51cjoi0': {
      'en': 'UPI / Mobile Wallets',
      'or': '',
    },
    '71r2gydk': {
      'en': 'Demand Draft',
      'or': '',
    },
    '426mj8cc': {
      'en': 'Banker’s Cheque',
      'or': '',
    },
    'y3wl5j4n': {
      'en': 'Agent / Third-party',
      'or': '',
    },
    'g04xtw7l': {
      'en': 'Amount',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    'c57oy4az': {
      'en': 'Details Of Bills / Voucher Enclosed',
      'or': 'ଟେଣ୍ଡର ଫଳାଫଳ',
    },
    '3syjs4hl': {
      'en': 'Name Of payee',
      'or': 'ନାମ',
    },
    'p7vomg59': {
      'en': 'No. & Date of voucher / Bill',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    'myjluarg': {
      'en': 'Amount',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    '1zb0o6uk': {
      'en': 'Field is required',
      'or': '',
    },
    '2t0yszlw': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'hnrmu6up': {
      'en': 'Field is required',
      'or': '',
    },
    'trzwtywe': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'oi56432k': {
      'en': 'Field is required',
      'or': '',
    },
    'y5jx5c1m': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'kk3svro3': {
      'en': 'Field is required',
      'or': '',
    },
    'd2s1by7d': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'ta42fp9q': {
      'en': 'Field is required',
      'or': '',
    },
    'jwikhdl9': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'axtxrr87': {
      'en': 'Field is required',
      'or': '',
    },
    '1wljvnbz': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    '5c22lqi2': {
      'en': 'Field is required',
      'or': '',
    },
    '4d77ljld': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'i1zfvdao': {
      'en': 'Field is required',
      'or': '',
    },
    'vhc0rkj1': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'lzusqqxd': {
      'en': 'Field is required',
      'or': '',
    },
    'a4z18w1q': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'lfk38swr': {
      'en': 'Field is required',
      'or': '',
    },
    '6xb55k6s': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'dk5rlwji': {
      'en': 'Field is required',
      'or': '',
    },
    'rzmpcpuf': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'ilk17221': {
      'en': 'Field is required',
      'or': '',
    },
    '5ohqqahz': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'f4ood26h': {
      'en': 'Field is required',
      'or': '',
    },
    '7h9f9g7x': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'on52w8uv': {
      'en': 'Field is required',
      'or': '',
    },
    '90sp0vdu': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'cvy454re': {
      'en': 'Field is required',
      'or': '',
    },
    '8oh16wyx': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    '8he3orjb': {
      'en': 'Field is required',
      'or': '',
    },
    'u11rgjee': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'sxlxd2fw': {
      'en': 'ADD',
      'or': 'ସେଭ୍ କରନ୍ତୁ',
    },
    '80dckfbs': {
      'en': 'Name Of Payee',
      'or': 'ଟେଣ୍ଡର ନମ୍ବର',
    },
    'vm7sdmew': {
      'en': 'No. & Date of voucher / Bill',
      'or': 'ନିଲାମଦାତାଙ୍କ ନାମ',
    },
    'gq4tpmj9': {
      'en': 'Amount',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    'jliiypoh': {
      'en': 'Action',
      'or': 'ସ୍ଥିତି',
    },
    '4grjutp0': {
      'en': 'Proposing Officer Name',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    'opeb82py': {
      'en': 'Proposing Officer Designation',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    'iv1wjgye': {
      'en': 'Recommending Officer Name',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    'l2gku1lo': {
      'en': 'Recommending Officer Designation',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    'dxjysexp': {
      'en': 'Sanctioning Authority Name',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    '2ql6lu9e': {
      'en': 'Sanctioning Authority Designation',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    'lcvepqqb': {
      'en': 'Paid Party On Date',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    '3j5tuvj0': {
      'en': 'Field is required',
      'or': '',
    },
    '0nj5ez6o': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'a8xtujut': {
      'en': 'Field is required',
      'or': '',
    },
    'hzm5h3p1': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    '26olvb76': {
      'en': 'Field is required',
      'or': '',
    },
    '61c8qgcv': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    '5cw0rowb': {
      'en': 'Field is required',
      'or': '',
    },
    'czwu7f4o': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'cjxs85nv': {
      'en': 'Field is required',
      'or': '',
    },
    'dic5fccc': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    '0ig1p3li': {
      'en': 'Field is required',
      'or': '',
    },
    'bsjsz6bf': {
      'en': 'Please choose an option from the dropdown',
      'or': '',
    },
    'm79ufthg': {
      'en': 'Payment Recommended',
      'or': '',
    },
    'knu0j3gq': {
      'en': 'Payment Authorised',
      'or': '',
    },
    'd7skzhwc': {
      'en': 'Save',
      'or': 'ସେଭ୍ କରନ୍ତୁ',
    },
  },
  // TenderBidderdetails
  {
    'x1rgi32f': {
      'en': 'Bidder Name',
      'or': 'ନିଲାମଦାତାଙ୍କ ନାମ',
    },
    '5axsam0n': {
      'en': 'Bid Value',
      'or': 'ବିଡ୍ ମୂଲ୍ୟ',
    },
    '8pxiai6w': {
      'en': 'Bidder Score',
      'or': 'ସ୍ଥିତି',
    },
  },
  // Miscellaneous
  {
    '3l2ts7tf': {
      'en': '',
      'or': '',
    },
    'xkxmopwr': {
      'en': '',
      'or': '',
    },
    'ame9f1l3': {
      'en': '',
      'or': '',
    },
    'snffl0mg': {
      'en': '',
      'or': '',
    },
    'lctnufys': {
      'en': '',
      'or': '',
    },
    'up8hwfcn': {
      'en': '',
      'or': '',
    },
    'g8ecsxj9': {
      'en': '',
      'or': '',
    },
    'ys6d2a83': {
      'en': '',
      'or': '',
    },
    'zy7q8ogk': {
      'en': '',
      'or': '',
    },
    'kgk8go2n': {
      'en': '',
      'or': '',
    },
    'ntba3sjh': {
      'en': '',
      'or': '',
    },
    '9p48kgl9': {
      'en': '',
      'or': '',
    },
    'c7bqmg2f': {
      'en': '',
      'or': '',
    },
    'o23d72ny': {
      'en': '',
      'or': '',
    },
    'etlie44d': {
      'en': '',
      'or': '',
    },
    'ife4164m': {
      'en': '',
      'or': '',
    },
    'l5fh6j6h': {
      'en': '',
      'or': '',
    },
    'lb4v1hif': {
      'en': '',
      'or': '',
    },
    'y7khxogh': {
      'en': '',
      'or': '',
    },
    'u3l379d8': {
      'en': '',
      'or': '',
    },
    'hknyd65q': {
      'en': '',
      'or': '',
    },
    'jkt3trcp': {
      'en': '',
      'or': '',
    },
    'q5t58s2j': {
      'en': '',
      'or': '',
    },
    'fqd0wgw5': {
      'en': '',
      'or': '',
    },
    '4i0s2e6p': {
      'en': '',
      'or': '',
    },
  },
].reduce((a, b) => a..addAll(b));
