class ApiConstants {
  static const String baseUrl = "http://motormania0.000webhostapp.com/api/";
  static const String localHostBaseUrl = "http://10.0.2.2/motor_mania/api/";
  static const String realDeviceBaseUrl = "http://192.168.1.3/motor_mania/api/";
  static const String localHostImagesUrl = "http://10.0.2.2/motor_mania";
}

class EndPoints {
  static const String register = "auth/signup.php";
  static const String login = "auth/login.php";
  static const String refreshToken = "auth/refresh_token.php";
  static const String homeOffers = "offers/get_offers.php";
  static const String allCategories = "categories/get_categories.php";
  static const String categoryProducts = "categories/get_category_products.php";
  static const String allProducts = "products/get_all_products.php";
  static const String productDetails = "products/get_product_by_id.php";
  static const String search = "products/searchProduct.php";
  static const String allFavorites = "favorites/get_favorites.php";
  static const String addToFavorites = "favorites/add_to_favorites.php";
  static const String removeFromFavorites =
      "favorites/delete_from_favorites.php";
  static const String allCartProducts = "cart/get_cart_products.php";
  static const String addProductToCart = "cart/add_product.php";
  static const String removeProductFromCart = "cart/remove_product.php";
  static const String userSelectedCar = "cars/get_default_car.php";
  static const String userCars = "cars/get_garage.php";
  static const String selectCar = "cars/set_default_car.php";
  static const String changeCar = "cars/change_default_car.php";
  static const String carBrands = "cars/get_brands.php";
  static const String carModels = "cars/get_models_by_brand.php";
  static const String addCar = "cars/add_car.php";
  static const String removeCar = "cars/delete_car.php";
}
