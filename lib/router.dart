import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:threads/features/repos/authentication_repo.dart';
import 'package:threads/views/Sign_in_screen.dart';
import 'package:threads/views/discover_screen.dart';
import 'package:threads/views/home_screen.dart';
import 'package:threads/views/like_screen.dart';
import 'package:threads/views/main_navigation_screen.dart';
import 'package:threads/views/profile_screen.dart';
import 'package:threads/views/settings.dart';
import 'package:threads/views/widgets/Privacy.dart';

final routerProvider = Provider(
  (ref) {
    ref.watch(authState);
    return GoRouter(
      initialLocation: '/home',
      redirect: (context, state) {
        final isLoggedIn = ref.read(authRepo).isLoggedIn;
        if (!isLoggedIn) {
          if (state.subloc != SignInScreen.routeURL) {
            return SignInScreen.routeURL;
          }
        }
        return null;
      },
      routes: [
        GoRoute(
          path: SignInScreen.routeURL,
          builder: (context, state) => SignInScreen(),
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
              path: DiscoverScreen.routeURL,
              builder: (context, state) => const DiscoverScreen(),
            ),
            GoRoute(
              path: LikeScreen.routeURL,
              builder: (context, state) => const LikeScreen(),
            ),
            GoRoute(
              path: ProfileScreen.routeURL,
              builder: (context, state) => const ProfileScreen(),
            ),
            GoRoute(
              path: Settings.routeURL,
              builder: (context, state) => const Settings(),
              routes: [
                GoRoute(
                  path: Privacy.routeName,
                  name: Privacy.routeName,
                  builder: (context, state) => const Privacy(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  },
);
