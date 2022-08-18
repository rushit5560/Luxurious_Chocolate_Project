part of './app_pages.dart';

abstract class Routes {
  //app start routes
  static const initial = '/';
  static const homeScreenRoute = '/home';
  static const contactUsScreenRoute = '/contactUs';
  static const newsLetterScreenRoute = '/newsLetter';

  //products routes
  static const productListScreenRoute = '/productList';
  static const productDetailsScreenRoute = '/productDetails';
  static const cartViewScreenRoute = '/cartView';

  //auth routes
  static const registerScreenRoute = '/register';
  static const loginScreenRoute = '/login';
  static const forgetPasswordScreenRoute = '/forgetPassword';

  //in app routes
  static const addressRoute = '/address';
}
