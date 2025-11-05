import 'package:flutter_riverpod/legacy.dart';

class FavouriteWallpaper {
  final String name;
  final String imageAsset;
  final String category;

  FavouriteWallpaper({
    required this.name,
    required this.imageAsset,
    required this.category,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavouriteWallpaper &&
          runtimeType == other.runtimeType &&
          imageAsset == other.imageAsset;

  @override
  int get hashCode => imageAsset.hashCode;
}

class FavouritesNotifier extends StateNotifier<List<FavouriteWallpaper>> {
  FavouritesNotifier() : super([]);

  void toggleFavourite(String name, String imageAsset, String category) {
    final wallpaper = FavouriteWallpaper(
      name: name,
      imageAsset: imageAsset,
      category: category,
    );

    if (state.contains(wallpaper)) {
      state = state.where((w) => w.imageAsset != imageAsset).toList();
    } else {
      state = [...state, wallpaper];
    }
  }

  bool isFavourite(String imageAsset) {
    return state.any((w) => w.imageAsset == imageAsset);
  }

  void removeFavourite(String imageAsset) {
    state = state.where((w) => w.imageAsset != imageAsset).toList();
  }
}

final favouritesProvider =
    StateNotifierProvider<FavouritesNotifier, List<FavouriteWallpaper>>((ref) {
      return FavouritesNotifier();
    });
