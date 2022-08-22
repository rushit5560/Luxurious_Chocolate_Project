import 'package:get/get.dart';
import 'package:luxurious_chocolate/bindings/account_binding/account_binding.dart';
import 'package:luxurious_chocolate/bindings/address_binding/address_binding.dart';
import 'package:luxurious_chocolate/bindings/cart_view_binding/cart_view_binding.dart';
import 'package:luxurious_chocolate/bindings/checkout_binding/checkout_binding.dart';
import 'package:luxurious_chocolate/bindings/contact_us_binding/contact_us_binding.dart';
import 'package:luxurious_chocolate/bindings/forget_password_binding/forget_password_binding.dart';
import 'package:luxurious_chocolate/bindings/home_binding/home_binding.dart';
import 'package:luxurious_chocolate/bindings/login_binding/login_binding.dart';
import 'package:luxurious_chocolate/bindings/newsletter_binding/newsletter_binding.dart';
import 'package:luxurious_chocolate/bindings/order_confirm_binding/order_confirm_binding.dart';
import 'package:luxurious_chocolate/bindings/order_details_binding/order_details_binding.dart';
import 'package:luxurious_chocolate/bindings/orders_binding/orders_binding.dart';
import 'package:luxurious_chocolate/bindings/product_details_binding/product_details_binding.dart';
import 'package:luxurious_chocolate/bindings/product_list_binding/product_list_binding.dart';
import 'package:luxurious_chocolate/bindings/register_binding/register_binding.dart';

import 'package:luxurious_chocolate/bindings/splash_binding/splash_binding.dart';
import 'package:luxurious_chocolate/bindings/wishlist_binding/wishlist_binding.dart';
import 'package:luxurious_chocolate/ui/screens/account_screen/account_screen.dart';
import 'package:luxurious_chocolate/ui/screens/address_screen/address_screen.dart';
import 'package:luxurious_chocolate/ui/screens/cart_view_screen/cart_view_screen.dart';
import 'package:luxurious_chocolate/ui/screens/checkout_screen/checkout_screen.dart';
import 'package:luxurious_chocolate/ui/screens/contact_us_screen/contact_us_screen.dart';
import 'package:luxurious_chocolate/ui/screens/forget_password_screen/forget_password_screen.dart';
import 'package:luxurious_chocolate/ui/screens/home_screen/home_screen.dart';
import 'package:luxurious_chocolate/ui/screens/login_screen/login_screen.dart';
import 'package:luxurious_chocolate/ui/screens/newsletter_screen/newsletter_screen.dart';
import 'package:luxurious_chocolate/ui/screens/order_confirm_screen/order_confirm_screen.dart';
import 'package:luxurious_chocolate/ui/screens/order_details_screen/order_details_screen.dart';
import 'package:luxurious_chocolate/ui/screens/orders_screen/orders_screen.dart';
import 'package:luxurious_chocolate/ui/screens/product_details_screen/product_details_screen.dart';
import 'package:luxurious_chocolate/ui/screens/product_list_screen/product_list_screen.dart';
import 'package:luxurious_chocolate/ui/screens/register_screen/register_screen.dart';
import 'package:luxurious_chocolate/ui/screens/splash_screen/splash_screen.dart';
import 'package:luxurious_chocolate/ui/screens/wishlist_screen/wishlist_screen.dart';
part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.initial,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.homeScreenRoute,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.contactUsScreenRoute,
      page: () => const ContactUsScreen(),
      binding: ContactUsBinding(),
    ),
    GetPage(
      name: Routes.newsLetterScreenRoute,
      page: () => const NewsletterScreen(),
      binding: NewsletterBinding(),
    ),

    //product pages
    GetPage(
      name: Routes.productListScreenRoute,
      page: () => const ProductListScreen(),
      binding: ProductListBinding(),
    ),
    GetPage(
      name: Routes.productDetailsScreenRoute,
      page: () => const ProductDetailsScreen(),
      binding: ProductDetailsBinding(),
    ),
    GetPage(
      name: Routes.cartViewScreenRoute,
      page: () => const CartViewScreen(),
      binding: CartViewBinding(),
    ),
    GetPage(
      name: Routes.orderDetailsScreenRoute,
      page: () => const OrderDetailsScreen(),
      binding: OrderDetailsBinding(),
    ),
    GetPage(
      name: Routes.checkoutScreenRoute,
      page: () => const CheckoutScreen(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: Routes.orderConfirmScreenRoute,
      page: () => const OrderConfirmScreen(),
      binding: OrderConfirmBinding(),
    ),

    //auth pages
    GetPage(
      name: Routes.registerScreenRoute,
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.loginScreenRoute,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.forgetPasswordScreenRoute,
      page: () => const ForgetPasswordScreen(),
      binding: ForgetPasswordBinding(),
    ),

    //my account pages
    GetPage(
      name: Routes.accountScreenRoute,
      page: () => const AccountScreen(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: Routes.wishlistScreenRoute,
      page: () => const WishlistScreen(),
      binding: WishlistBinding(),
    ),
    GetPage(
      name: Routes.ordersScreenRoute,
      page: () => const OrdersScreen(),
      binding: OrdersBinding(),
    ),
    GetPage(
      name: Routes.addressScreenRoute,
      page: () => const AddressScreen(),
      binding: AddressBinding(),
    ),
  ];
}
