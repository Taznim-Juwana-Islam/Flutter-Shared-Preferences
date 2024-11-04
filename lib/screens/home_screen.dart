import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../widgets/recipe_card.dart';

class HomeScreen extends StatelessWidget {
  final List<Recipe> recipes = [
    Recipe(id: '1', title: 'Pasta', description: 'Delicious pasta recipe', ingredients: ['Pasta', 'Tomato Sauce']),
    // Add more recipes here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recipes')),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return RecipeCard(recipe: recipes[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to Add Recipe Screen
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
