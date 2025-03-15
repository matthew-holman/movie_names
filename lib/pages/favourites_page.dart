import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';

class FavouritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favorites = appState.favorites;
    final theme = Theme.of(context);
    final style = theme.textTheme.titleSmall!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    final listStyle = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Scaffold(
      backgroundColor: theme.colorScheme.primaryContainer,
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
                style: style,
              ),
            ),
          )
              : Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final movieName = favorites[index];
                return ListTile(
                  title: Text(
                    movieName,
                    style: listStyle,
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