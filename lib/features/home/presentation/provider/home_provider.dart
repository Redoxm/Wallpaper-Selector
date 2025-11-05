import 'package:flutter_riverpod/legacy.dart';

class ActiveWallpaper {
  final String imageAsset;
  final String category;
  final String selection;

  ActiveWallpaper({
    required this.imageAsset,
    required this.category,
    required this.selection,
  });
}

class HomeNotifier extends StateNotifier<ActiveWallpaper?> {
  HomeNotifier() : super(null);

  void setActiveWallpaper(
    String imageAsset,
    String category,
    String selection,
  ) {
    state = ActiveWallpaper(
      imageAsset: imageAsset,
      category: category,
      selection: selection,
    );
  }

  void clearActiveWallpaper() {
    state = null;
  }
}

final homeProvider = StateNotifierProvider<HomeNotifier, ActiveWallpaper?>((
  ref,
) {
  return HomeNotifier();
});
