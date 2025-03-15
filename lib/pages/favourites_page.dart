import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';
import '../widgets/big_card.dart';

class FavouritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favorites = appState.favorites;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text("Favorites")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: theme.colorScheme.primary,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: favorites.isEmpty
              ? Center(
            heightFactor: 3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "No favorites yet!",
                style: theme.textTheme.headlineSmall,
              ),
            ),
          )
              : Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final wordPair = favorites[index];
                return ListTile(
                  title: Text(
                    wordPair.asPascalCase,
                    style: theme.textTheme.titleSmall,
                  ),
                  leading: Icon(Icons.favorite, color: theme.colorScheme.primary),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      print("remove the favorite");
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}