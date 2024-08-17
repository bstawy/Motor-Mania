class ApiConstants {
  static const String baseUrl = "http://motormania0.000webhostapp.com/api/";
  static const String localHostBaseUrl = "http://10.0.2.2/motor_mania/api/";
  static const String realDeviceBaseUrl = "http://192.168.1.3/motor_mania/api/";
}

class EndPoints {
  static const String register = "auth/register.php";
  static const String login = "auth/login.php";
  static const String refreshToken = "auth/refreshTokens.php";
  static const String homeOffers = "offers/getOffers.php";
  static const String allCategories = "categories/allCategories.php";
  static const String categoryProducts = "categories/categoryProducts.php";
  static const String allProducts = "products/getAllProducts.php";
  static const String productDetails = "products/getProduct.php";
  static const String search = "products/searchProduct.php";
  static const String allFavorites = "favorites/allFavorites.php";
  static const String addToFavorites = "favorites/addProduct.php";
  static const String removeFromFavorites = "favorites/removeProduct.php";
  static const String allCartProducts = "cart/allCartProducts.php";
  static const String addProductToCart = "cart/addProduct.php";
  static const String removeProductFromCart = "cart/removeProduct.php";
  static const String userSelectedCar = "cars/getUserSelectedCar.php";
  static const String userCars = "cars/getUserCars.php";
  static const String selectCar = "cars/selectCar.php";
  static const String changeCar = "cars/changeCar.php";
  static const String carBrands = "cars/getAllBrands.php";
  static const String addCar = "cars/addCar.php";
  static const String removeCar = "cars/removeCar.php";
}
