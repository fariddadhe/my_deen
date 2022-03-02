part of 'shared.dart';

const double defaultMargin = 24;

Color mainColor = Color(0xFFD0F1F8);
Color secondMainColor = Color(0xFFE6F0F4);
Color accentColor1 = Color(0xFF0D4245);
Color accentColor2 = Color(0xFFFBD460);
Color accentColor3 = Color(0xFFC6D3D8);
Color accentColor4 = Color(0xFFEBEFF6);
Color accentColor5 = Color(0xFF6FBF95);

TextStyle blackTextFont = GoogleFonts.robotoSlab()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w500);
TextStyle whiteTextFont = GoogleFonts.robotoSlab()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w500);
TextStyle greenTextFont = GoogleFonts.robotoSlab()
    .copyWith(color: accentColor1, fontWeight: FontWeight.w500);
TextStyle greyTextFont = GoogleFonts.robotoSlab()
    .copyWith(color: accentColor3, fontWeight: FontWeight.w500);

TextStyle whiteNumberFont = GoogleFonts.openSans()
    .copyWith(color: Colors.white);
TextStyle yellowNumberFont = GoogleFonts.openSans()
    .copyWith(color: accentColor2);