import 'dart:math';
import 'movie_word_lists.dart';

class MovieNameGenerator {
  static final Random _random = Random();

  static String generateMovieName() {
    List<String> structures = [
      'A {adjective} {noun}',
      'The {adjective} {noun}',
      '{definitive noun} {verb past tense}',
      'The {adjective} {noun} {verb past tense} {indefinite noun}',
      'The {adjective} {plural noun}',
      'They {verb past tense} {indefinite noun}',
      '{adjective} {verb past tense} {noun}',
      'A {noun} {verb past tense} {adjective}',
      '{verb past tense} {preposition} {noun}',
      'The {noun} {preposition} {noun}',
      'A {noun} {preposition} {adjective} {indefinite noun}',
      '{adjective} {noun} {preposition} {indefinite noun}',
      '{verb past tense} {preposition} {plural noun}',
      '{adjective} {noun} {verb past tense} {preposition} {noun}',
    ];

    String structure = structures[_random.nextInt(structures.length)];

    Map<String, List<String>> wordPool = {
      '{preposition}': List.generate(3, (_) => _randomChoice(MovieWordLists.prepositions)),
      '{adjective}': List.generate(3, (_) => _randomChoice(MovieWordLists.adjectives)),
      '{noun}': List.generate(3, (_) => _randomChoice(MovieWordLists.nouns)),
      '{plural noun}': List.generate(3, (_) => _randomChoice(MovieWordLists.pluralNouns)),
      '{verb past tense}': List.generate(3, (_) => _randomChoice(MovieWordLists.verbsPastTense)),
      '{definitive noun}': List.generate(3, (_) => 'The ${_randomChoice(MovieWordLists.nouns)}'),
      '{indefinite noun}': List.generate(3, (_) => _indefiniteForm(_randomChoice(MovieWordLists.nouns))),
    };

    wordPool.forEach((key, values) {
      while (structure.contains(key) && values.isNotEmpty) {
        structure = structure.replaceFirst(key, values.removeAt(0));
      }
    });

    return structure;
  }

  static String _randomChoice(List<String> list) {
    return list[_random.nextInt(list.length)];
  }

  static String _indefiniteForm(String noun) {
    return (['a', 'e', 'i', 'o', 'u'].contains(noun[0].toLowerCase()) ? 'an ' : 'a ') + noun;
  }
}