import 'package:breaking_bad/models/AppError.dart';
import 'package:breaking_bad/models/character_quote_model.dart';
import 'package:breaking_bad/repository/characters_repository.dart';

class CharacterDetalController {
  final _repository = CharactersRepository();
  
  AppError error;
  CharacterQuote characterQuote;
  bool isLoading;

  Future fetchCharacterQuote(String characterName) async {
    final result = await _repository.fetchCharacterQuote(characterName);
    result.fold((l) => error = l, (r) => characterQuote = r);
  }
}