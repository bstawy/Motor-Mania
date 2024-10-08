class AssetsManager {
  static const String _animationsPath = "assets/animation";
  static const String _iconsPath = "assets/icons";
  static const String _imagesPath = "assets/images";

  static String get favoritesEmptyImage =>
      "$_imagesPath/favorites_empty_image.png";
  static String get favoritesDarkEmptyImage =>
      "$_imagesPath/favorites_dark_empty_image.png";
  static String get loginImage => "$_imagesPath/login_image.png";
  static String get loginImageDark => "$_imagesPath/login_image_dark.png";
  static String get garageEmptyImage => "$_imagesPath/garage_empty_image.png";
  static String get garageEmptyDarkImage =>
      "$_imagesPath/garage_empty_dark_image.png";

  static String get checkmarkIcon => "$_iconsPath/checkmark_icon.svg";
  static String get tripleBackIcons => "$_iconsPath/triple_back_icons.svg";
  static String get tripleForwardIcons =>
      "$_iconsPath/triple_forward_icons.svg";
  static String get locationIcon => "$_iconsPath/location_icon.svg";
  static String get searchIcon => "$_iconsPath/search_icon.svg";
  static String get barcodeIcon => "$_iconsPath/barcode_icon.svg";
  static String get addIcon => "$_iconsPath/add_icon.svg";
  static String get editIcon => "$_iconsPath/edit_icon.svg";
  static String get trashIcon => "$_iconsPath/trash_icon.svg";
}
