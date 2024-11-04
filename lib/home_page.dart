import 'package:flutter/material.dart';
import 'recipe.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recipe App')),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to Recipe Details'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RecipeDetails()),
            );
          },
        ),
      ),
    );
  }
}
