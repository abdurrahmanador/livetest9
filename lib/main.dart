import 'package:flutter/material.dart';
import 'dart:convert';
import 'Model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jsonString = '''
    {
      "recipes": [
        {
          "title": "Pasta Carbonara",
          "description": "Creamy pasta dish with bacon and cheese.",
          "ingredients": ["spaghetti", "bacon", "egg", "cheese"]
        },
        {
          "title": "Caprese Salad",
          "description": "Simple and refreshing salad with tomatoes, mozzarella, and basil.",
          "ingredients": ["tomatoes", "mozzarella", "basil"]
        },
        {
          "title": "Banana Smoothie",
          "description": "Healthy and creamy smoothie with bananas and milk.",
          "ingredients": ["bananas", "milk"]
        },
        {
          "title": "Chicken Stir-Fry",
          "description": "Quick and flavorful stir-fried chicken with vegetables.",
          "ingredients": ["chicken breast", "broccoli", "carrot", "soy sauce"]
        },
        {
          "title": "Grilled Salmon",
          "description": "Delicious grilled salmon with lemon and herbs.",
          "ingredients": ["salmon fillet", "lemon", "olive oil", "dill"]
        },
        {
          "title": "Vegetable Curry",
          "description": "Spicy and aromatic vegetable curry.",
          "ingredients": ["mixed vegetables", "coconut milk", "curry powder"]
        },
        {
          "title": "Berry Parfait",
          "description": "Layered dessert with fresh berries and yogurt.",
          "ingredients": ["berries", "yogurt", "granola"]
        }
      ]
    }
    ''';

    final jsonMap = json.decode(jsonString);
    final recipesList = (jsonMap['recipes'] as List<dynamic>)
        .map((recipe) => Recipe.fromJson(recipe))
        .toList();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Food Recipes'),
        ),
        body: ListView.builder(
          itemCount: recipesList.length,
          itemBuilder: (context, index) {
            final recipe = recipesList[index];
            return ListTile(
              leading: const Icon(Icons.fastfood_sharp),
              title: Text(
                recipe.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(recipe.description),
              contentPadding: const EdgeInsets.all(10),
            );
          },
        ),
      ),
    );
  }
}
