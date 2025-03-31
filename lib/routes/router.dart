import 'package:jctelecaller/screens/Language/Language.dart';
import 'package:jctelecaller/screens/auth/onboarding.dart';
import 'package:jctelecaller/screens/auth/splash.dart';
import 'package:jctelecaller/screens/cart/cart.dart';
import 'package:jctelecaller/screens/chat/chat_call.dart';
import 'package:jctelecaller/screens/chat/chat_list.dart';
import 'package:jctelecaller/screens/chat/chat_screen.dart';
import 'package:jctelecaller/screens/dashboard/dashboard.dart';
import 'package:jctelecaller/screens/home/home.dart';
import 'package:jctelecaller/screens/home/search_user.dart';
import 'package:jctelecaller/screens/notifications/notifications.dart';
import 'package:jctelecaller/screens/order/my_orders.dart';
import 'package:jctelecaller/screens/order/track_order.dart';
import 'package:jctelecaller/screens/order/write_review.dart';
import 'package:jctelecaller/screens/payment/add_delivery_address.dart';
import 'package:jctelecaller/screens/payment/checkout.dart';
import 'package:jctelecaller/screens/payment/payment.dart';
import 'package:jctelecaller/screens/product/product_detail.dart';
import 'package:jctelecaller/screens/profile/coupons.dart';
import 'package:jctelecaller/screens/profile/edit_profile.dart';
import 'package:jctelecaller/screens/profile/profile.dart';
import 'package:jctelecaller/screens/profile/questions.dart';
import 'package:jctelecaller/screens/search/search_screen.dart';
import 'package:jctelecaller/screens/shortcodes/accordion.dart';
import 'package:jctelecaller/screens/shortcodes/badges.dart';
import 'package:jctelecaller/screens/shortcodes/bottomsheet.dart';
import 'package:jctelecaller/screens/shortcodes/buttons.dart';
import 'package:jctelecaller/screens/shortcodes/charts.dart';
import 'package:jctelecaller/screens/shortcodes/components.dart';
import 'package:jctelecaller/screens/shortcodes/inputs.dart';
import 'package:jctelecaller/screens/shortcodes/lists.dart';
import 'package:jctelecaller/screens/shortcodes/modalbox.dart';
import 'package:jctelecaller/screens/shortcodes/pricings.dart';
import 'package:jctelecaller/screens/shortcodes/snackbars.dart';
import 'package:jctelecaller/screens/shortcodes/socials.dart';
import 'package:jctelecaller/screens/shortcodes/swipeables.dart';
import 'package:jctelecaller/screens/shortcodes/tables.dart';
import 'package:jctelecaller/screens/shortcodes/tabs.dart';
import 'package:jctelecaller/screens/shortcodes/toggle.dart';
import 'package:flutter/material.dart';
import 'package:jctelecaller/screens/auth/sign_in.dart';
import 'package:jctelecaller/routes/bottom_navigation/bottom_navigation.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    '/splash': (context) => const Splash(),
    '/signin': (context) => const SignIn(),
    '/onboarding': (context) => Onboarding(),
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
    '/dashboard': (context) => DashboardScreen(
      showDrawer: ModalRoute.of(context)!.settings.arguments as bool? ?? false,
),
    '/home': (context) => const Home(),
  };
}
