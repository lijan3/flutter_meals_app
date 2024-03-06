import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/meal.dart';
import 'package:flutter_meals_app/screens/meal_details.dart';
import 'package:flutter_meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    required this.onFavorite,
  });

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onFavorite;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal,
          onFavorite: onFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget body = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) => MealItem(
        meal: meals[index],
        selectMeal: _selectMeal,
      ),
    );

    if (meals.isEmpty) {
      body = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'No meals to show.',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: Text(
                'Try selecting a different category.',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            ),
          ],
        ),
      );
    }

    return title == null
        ? body
        : Scaffold(
            appBar: AppBar(
              title: Text(title!),
            ),
            body: body,
          );
  }
}
