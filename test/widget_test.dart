import 'package:breaking_bad/models/character_model.dart';
import 'package:breaking_bad/models/character_quote_model.dart';
import 'package:breaking_bad/repository/characters_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final _dio = CharactersRepository();
  CharacterQuote characterQuote;

  test('Getting all characters', () async{
    final result = await _dio.fetchAllCharacters('characters/');
    expect(result, isA<List<CharacterModel>>());
  });

  test('Getting a quote', () async {
    final result = await _dio.fetchCharacterQuote('Walter+White+Jr');
    result.fold((l) => null, (r) => characterQuote = r);
    expect(characterQuote, isA<CharacterQuote>());
  });


}
