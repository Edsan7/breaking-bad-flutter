import 'package:breaking_bad/models/AppError.dart';
import 'package:breaking_bad/models/character_death_model.dart';
import 'package:breaking_bad/models/character_model.dart';
import 'package:breaking_bad/core/constants.dart';
import 'package:breaking_bad/models/character_quote_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CharactersRepository {
  final _dio = Dio(kDioOptions);

  Future<Either<AppError, List<CharacterModel>>> fetchAllCharacters(
      String url) async {
    try {
      List<CharacterModel> listCharacters = [];
      final response = await _dio.get(url);
      response.data.forEach((character) {
        listCharacters.add(CharacterModel.fromMap(character));
      });
      return Right(listCharacters);
    } on DioError catch (error) {
      if (error.response != null) {
        return Left(AppRepositoryError(error.response.data['name']));
      } else {
        return Left(AppRepositoryError('Falha ao conectar ao servidor!!!'));
      }
    } on Exception catch (error) {
      return Left(AppRepositoryError(error.toString()));
    }
  }

  Future<Either<AppError, CharacterQuote>> fetchCharacterQuote(
      String characterName) async {
    try {
      final response = await _dio.get('quote/random?author=$characterName');
      if (response.data.isEmpty) {
        return Left(AppRepositoryError(''));
      } else {
        final model = CharacterQuote.fromMap(response.data[0]);
        return Right(model);
      }
    } on DioError catch (error) {
      if (error != null) {
        return Left(error.response.data['name']);
      } else {
        return Left(AppRepositoryError('Failed to connect to the server'));
      }
    } on Exception catch (error) {
      return Left(AppRepositoryError(error.toString()));
    }
  }

  Future<Either<AppError, CharacterDeath>> fetchCharacterDeathCount(
      String characterName) async {
    try {
      final response = await _dio.get('death-count?name=$characterName');
      final model = CharacterDeath.fromMap(response.data[0]);
      return Right(model);
    } on DioError {
      return Left(AppRepositoryError('Failed to connect to the server'));
    } on Exception catch (error) {
      return Left(AppRepositoryError(error.toString()));
    }
  }
}
