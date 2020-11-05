import 'package:breaking_bad/models/AppError.dart';
import 'package:breaking_bad/models/character_death_model.dart';
import 'package:breaking_bad/models/character_quote_model.dart';
import 'package:breaking_bad/repository/characters_repository.dart';

class CharacterDetalController {
  final _repository = CharactersRepository();

  AppError error;
  CharacterQuote characterQuote;
  CharacterDeath characterDeath;
  bool isLoading = true;

  int get death => characterDeath?.deathCount ?? 0;
  String get quote => characterQuote?.quote ?? '';

  Future fetchCharacterQuote(String characterName) async {
    error = null;
    characterName = characterName.replaceAll(' ', '+');
    final result = await _repository.fetchCharacterQuote(characterName);
    result.fold((l) => error = l, (r) => characterQuote = r);
  }

  Future fetchCharacterDeaths(String characterName) async {
    error = null;
    characterName = characterName.replaceAll(' ', '+');
    final result = await _repository.fetchCharacterDeathCount(characterName);
    result.fold((l) => error = l, (r) => characterDeath = r);
  }
}
