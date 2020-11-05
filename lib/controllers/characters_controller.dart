import 'package:breaking_bad/models/AppError.dart';
import 'package:breaking_bad/models/character_model.dart';
import 'package:breaking_bad/repository/characters_repository.dart';

enum category {breakingBad, betterCallSaul }

class CharactersController {
  final _repository = CharactersRepository();

  List<CharacterModel> characters;
  AppError error;
  bool isLoading;

  int get moviesCount => characters.length;
  String get appBarTitle => appBarTitles[currentCategory];

  category currentCategory = category.breakingBad;

  var urls = {
    category.breakingBad: 'characters?category=Breaking+Bad',
    category.betterCallSaul: 'characters?category=Better+Call+Saul'
  };

  var appBarTitles = {
    category.breakingBad: 'Breaking Bad',
    category.betterCallSaul: 'Better Call Saul'
  };

  Future fetchAllCharacters({String url = 'characters'}) async {
    final result = await _repository.fetchAllCharacters(urls[currentCategory]);
    result.fold((l) => error = l, (r) => characters = r);
  }
}
