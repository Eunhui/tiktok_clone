import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone/features/repos/authentication_repo.dart';
import 'package:tiktok_clone/features/views/home_screen.dart';
import 'package:tiktok_clone/features/views/main_navigation_screen.dart';
import 'package:tiktok_clone/features/views/post_screen.dart';

final routerProvider = Provider(
  (ref) {
    ref.watch(authState);
    return GoRouter(
      initialLocation: '/home',
      routes: [
        GoRoute(
          path: SignUpScreen.routeURL,
          builder: (context, state) => SignUpScreen(),
        ),
        GoRoute(
          path: LoginScreen.routeURL,
          builder: (context, state) => LoginScreen(),
        ),
        ShellRoute(
          builder: (context, state, child) {
            return MainNavigationScreen(child: child);
          },
          routes: [
            GoRoute(
              path: HomeScreen.routeURL,
              builder: (context, state) => const HomeScreen(),
            ),
            GoRoute(
              path: PostScreen.routeURL,
              builder: (context, state) => const PostScreen(),
            ),
          ],
        ),
      ],
    );
  },
);
