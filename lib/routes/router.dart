import 'package:lookme/screens/Language/Language.dart';
import 'package:lookme/screens/auth/onboarding.dart';
import 'package:lookme/screens/auth/splash.dart';
import 'package:lookme/screens/cart/cart.dart';
import 'package:lookme/screens/chat/chat_call.dart';
import 'package:lookme/screens/chat/chat_list.dart';
import 'package:lookme/screens/chat/chat_screen.dart';
import 'package:lookme/screens/home/search_user.dart';
import 'package:lookme/screens/notifications/notifications.dart';
import 'package:lookme/screens/order/my_orders.dart';
import 'package:lookme/screens/order/track_order.dart';
import 'package:lookme/screens/order/write_review.dart';
import 'package:lookme/screens/payment/add_delivery_address.dart';
import 'package:lookme/screens/payment/checkout.dart';
import 'package:lookme/screens/payment/payment.dart';
import 'package:lookme/screens/product/product_detail.dart';
import 'package:lookme/screens/profile/coupons.dart';
import 'package:lookme/screens/profile/edit_profile.dart';
import 'package:lookme/screens/profile/profile.dart';
import 'package:lookme/screens/profile/questions.dart';
import 'package:lookme/screens/search/search_screen.dart';
import 'package:lookme/screens/shortcodes/accordion.dart';
import 'package:lookme/screens/shortcodes/badges.dart';
import 'package:lookme/screens/shortcodes/bottomsheet.dart';
import 'package:lookme/screens/shortcodes/buttons.dart';
import 'package:lookme/screens/shortcodes/charts.dart';
import 'package:lookme/screens/shortcodes/components.dart';
import 'package:lookme/screens/shortcodes/inputs.dart';
import 'package:lookme/screens/shortcodes/lists.dart';
import 'package:lookme/screens/shortcodes/modalbox.dart';
import 'package:lookme/screens/shortcodes/pricings.dart';
import 'package:lookme/screens/shortcodes/snackbars.dart';
import 'package:lookme/screens/shortcodes/socials.dart';
import 'package:lookme/screens/shortcodes/swipeables.dart';
import 'package:lookme/screens/shortcodes/tables.dart';
import 'package:lookme/screens/shortcodes/tabs.dart';
import 'package:lookme/screens/shortcodes/toggle.dart';
import 'package:flutter/material.dart';
import 'package:lookme/screens/auth/sign_in.dart';
import 'package:lookme/routes/bottom_navigation/bottom_navigation.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    '/splash': (context) => const Splash(),
    '/onboarding': (context) => Onboarding(),
    '/signin': (context) => const SignIn(),
    '/main_home': (context) => const BottomNavigation(),
    '/add_delivery_address': (context) => const AddDeliveryAddress(),
    '/payment': (context) => const Payment(),
    '/checkout': (context) => const Checkout(),
    // '/products': (context) => const Products(),
    '/product_detail': (context) => const ProductDetail(),
    '/edit_profile': (context) => const EditProfile(),
    '/search_screen': (context) => SearchScreen(),
    '/chat_list': (context) => ChatList(),
    '/chat_screen': (context) => const ChatScreen(),
    '/my_orders': (context) => const MyOrders(),
    '/track_order': (context) => const TrackOrder(),
    '/write_review': (context) => const WriteReview(),
    '/cart': (context) => const Cart(),
    '/notifications': (context) => Notifications(),
    '/coupons': (context) => Coupons(),
    '/profile': (context) => const Profile(),
    '/Language': (context) => const Language(),
    '/questions': (context) => Questions(),
    '/components': (context) => const Components(),
    '/accordion': (context) => AccordionScreen(),
    '/bottomsheet': (context) => const Bottomsheet(),
    '/modalbox': (context) => const ModalBox(),
    '/buttons': (context) => const Buttons(),
    '/badges': (context) => const Badges(),
    '/charts': (context) => const Charts(),
    '/inputs': (context) => const Inputs(),
    '/lists': (context) => const Lists(),
    '/pricings': (context) => const Pricings(),
    '/snackbars': (context) => const Snackbars(),
    '/socials': (context) => const Socials(),
    '/swipeables': (context) => const Swipeables(),
    '/tabs': (context) => const Tabs(),
    '/tables': (context) => const Tables(),
    '/toggle': (context) => const Toggle(),
    '/chat_call': (context) => const ChatCall(),
    '/search_user': (context) => const SearchUserScreen(),
  };
}
