import 'package:flutter_meals_app/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleFavorite(Meal meal) {
    final isFavorited = state.contains(meal);
    if (isFavorited) {
      state = state.where((item) => item != meal).toList();
    } else {
      state = [...state, meal];
    }
    return !isFavorited;
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
