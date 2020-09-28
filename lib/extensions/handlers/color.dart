import 'dart:ui';

extension ColorExtension on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

//Color icon social
final kGoogleColor = ColorExtension.fromHex('#ffffff');
final kFacebookColor = ColorExtension.fromHex('#ffffff');
final kMobileNumberColor = ColorExtension.fromHex('#FFFFFF');
final kTwitterColor = ColorExtension.fromHex('#1DA1F2');

//Color bg button social
final kBgGoogleColor = ColorExtension.fromHex('#DB4437');
final kBgFacebookColor = ColorExtension.fromHex('#4267B2');
final kBgMobileNumberColor = ColorExtension.fromHex('#6b6b6b');

//Primary color
final kPrimaryColor = ColorExtension.fromHex('#8FA7BF');
final kPrimaryTextColor = ColorExtension.fromHex('#000000');
final kPrimaryLabelTextColor = ColorExtension.fromHex('#667578');
final kPrimaryButtonColor = ColorExtension.fromHex('#000000');

//Secondary color
final kSecondaryColor = ColorExtension.fromHex('#ff80ab');
final kSecondaryTextColor = ColorExtension.fromHex('#ffffff');

//bg Form color
final kFormColor = ColorExtension.fromHex('#ffffff');
final kBoxShadowFormColor = ColorExtension.fromHex('#5c5c5c');

final kSecondaryButtonColor = ColorExtension.fromHex('#ffffff');

final kFloatButtonCart = ColorExtension.fromHex('#ffffff');
final kFloatButtonIconCart = ColorExtension.fromHex('#000000');

final kBgLoginUiColor = ColorExtension.fromHex('#f2f0ed');
