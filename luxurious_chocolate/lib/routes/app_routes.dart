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
  static const orderDetailsScreenRoute = '/orderDetails';
  static const cartViewScreenRoute = '/cartView';
  static const checkoutScreenRoute = '/checkout';
  static const orderConfirmScreenRoute = '/orderConfirm';

  //auth routes
  static const registerScreenRoute = '/register';
  static const loginScreenRoute = '/login';
  static const forgetPasswordScreenRoute = '/forgetPassword';

  //my acount routes
  static const accountScreenRoute = '/account';
  static const wishlistScreenRoute = '/wishlist';
  static const ordersScreenRoute = '/orders';
  static const addressScreenRoute = '/address';
}
