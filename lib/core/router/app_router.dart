import 'package:go_router/go_router.dart';
import 'package:wallpaper_selector/features/home/presentation/pages/home_active.dart';
import '../../features/home/presentation/pages/home_page.dart';

import '../../features/browse/presentation/pages/browse_page.dart';
import '../../features/favourites/presentation/pages/favourites_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../../features/wallpaper_detail/presentation/pages/wallpaper_detail_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomePage()),
      GoRoute(
        path: '/home-active',
        builder: (context, state) {
          final extra = state.extra as Map<String, String>;
          return HomePageWithActive(
            imageAsset: extra['image']!,
            category: extra['category']!,
            selection: extra['selection']!,
          );
        },
      ),
      GoRoute(path: '/browse', builder: (context, state) => const BrowsePage()),
      GoRoute(
        path: '/favourites',
        builder: (context, state) => const FavouritesPage(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsPage(),
      ),
      GoRoute(
        path: '/wallpaper/:category',
        builder: (context, state) =>
            WallpaperDetailPage(category: state.pathParameters['category']!),
      ),
    ],
  );
}
