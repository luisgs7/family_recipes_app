import 'package:family_recipes_app/components/recipe_step.dart';
import 'package:family_recipes_app/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecipeDetailPage extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetailPage({super.key, required this.recipe});

  String _formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy HH:mm').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          recipe.title,
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView(
        children: [
          Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    child: Image.network(recipe.image, fit: BoxFit.cover),
                    height: 300,
                  ),
                  RecipeStep(title: "Descrição", step: recipe.description),
                  RecipeStep(title: "Ingredientes", step: recipe.ingredients),
                  RecipeStep(title: "Instruções", step: recipe.instructions),
                  RecipeStep(title: "Categoria", step: recipe.category),
                  RecipeStep(
                      title: "Data de criação",
                      step: _formatDate(recipe.created_at)),
                  RecipeStep(
                      title: "Data de atualização",
                      step: _formatDate(recipe.updated_at)),
                  RecipeStep(title: "Criado por", step: recipe.user.toString()),
                ],
              ))
        ],
      ),
    );
  }
}
