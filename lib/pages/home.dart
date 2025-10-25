import 'package:family_recipes_app/models/recipe.dart';
import 'package:family_recipes_app/network/request_data.dart';
import 'package:family_recipes_app/pages/recipe_detail_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Family Recipes',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: FutureBuilder<List<Recipe>>(
        future: RequestData().getRecipes(),
        builder: (context, snapshot) => ListView.builder(
          itemCount: snapshot.data?.length ?? 0,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeDetailPage(
                        recipe: snapshot.data?[index] ??
                            Recipe(
                                id: 0,
                                title: '',
                                description: '',
                                ingredients: '',
                                instructions: '',
                                image: '',
                                category: '',
                                created_at: DateTime.now(),
                                updated_at: DateTime.now(),
                                user: 0)),
                  ),
                );
              },
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage(snapshot.data?[index].image ?? ''),
              ),
              title: Text(
                snapshot.data?[index].title ?? '',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                snapshot.data?[index].description ?? '',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
