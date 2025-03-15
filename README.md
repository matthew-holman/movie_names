# 🎬 Movie Name Generator

This Flutter app is based on the **[Google Codelab: Your First Flutter App](https://codelabs.developers.google.com/codelabs/flutter-codelab-first)**, with some some changes as I play around with Flutter and Dart for the first time.

## 📌 Changes
- Generates random **movie-like names** using predefined word lists.  A quick implementation just to show something more interesting than the random words from the codelab.
- Imposes a structure onto the application rather than having everything in main.dart

## 🏗️ Project Structure
```  
/lib  
│── main.dart                 # Entry point  
│── app.dart                  # Main app widget  
│── models/  
│   ├── app_state.dart        # State management (favorites, current name)  
│   ├── movie_name_generator.dart  # Movie name generation logic  
│   ├── movie_word_lists.dart      # Word lists for movie generation  
│── pages/  
│   ├── home_page.dart        # Main navigation structure  
│   ├── generator_page.dart   # Movie name generation page  
│   ├── favourites_page.dart  # Favorites page  
│── widgets/  
│   ├── big_card.dart         # Card widget for displaying movie names  
```  

## 🚀 Notes
I'm just playing around with Flutter for the first time, no idea what is idiomatic Dart and or Flutter, this is not intended as an example of 
