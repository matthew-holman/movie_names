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
      '{verb past tense} {indefinite noun}',
      '{adjective} {verb past tense} {noun}',
      '{indefinite noun} {verb past tense} {adjective}'
    ];

    String structure = structures[_random.nextInt(structures.length)];

    return structure
        .replaceAll('{adjective}', _randomChoice(MovieWordLists.adjectives))
        .replaceAll('{noun}', _randomChoice(MovieWordLists.nouns))
        .replaceAll('{plural noun}', _randomChoice(MovieWordLists.pluralNouns))
        .replaceAll('{verb past tense}', _randomChoice(MovieWordLists.verbsPastTense))
        .replaceAll('{definitive noun}', 'The ${_randomChoice(MovieWordLists.nouns)}')
        .replaceAll('{indefinite noun}', _indefiniteForm(_randomChoice(MovieWordLists.nouns)));
  }

  static String _randomChoice(List<String> list) {
    return list[_random.nextInt(list.length)];
  }

  static String _indefiniteForm(String noun) {
    return (['a', 'e', 'i', 'o', 'u'].contains(noun[0].toLowerCase()) ? 'an ' : 'a ') + noun;
  }
}