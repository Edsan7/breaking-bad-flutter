import 'package:breaking_bad/controllers/characters_controller.dart';
import 'package:breaking_bad/models/character_model.dart';
import 'package:breaking_bad/pages/character_detail.dart';
import 'package:breaking_bad/widgets/app_bar_toogle_buttons.dart';
import 'package:breaking_bad/widgets/centered_message.dart';
import 'package:breaking_bad/widgets/character_card.dart';
import 'package:breaking_bad/widgets/circular_loading.dart';
import 'package:flutter/material.dart';

class CharactersPage extends StatefulWidget {
  @override
  _CharactersPageState createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final _controller = CharactersController();
  List<bool> isSelected = [true, false];

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  void _initialize() async {
    setState(() {
      _controller.isLoading = true;
    });
    await _controller.fetchAllCharacters();
    setState(() {
      _controller.isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildCharactersGrid(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(_controller.appBarTitle),
      actions: [
        AppBarToogleButtons(
          isSelected: isSelected,
          onPressed: _setCharacterSerie,
        ),
      ],
    );
  }

  _setCharacterSerie(int index) {
    if (!isSelected[index]) {
      for (int i = 0; i < isSelected.length; i++) {
        setState(() {
          isSelected[i] = false;
        });
         isSelected[index] = true;
      }
      index == 0
          ? _controller.currentCategory = category.breakingBad
          : _controller.currentCategory = category.betterCallSaul;
      _initialize();
    }
  }

  _buildCharactersGrid() {
    if (_controller.isLoading) {
      return CircularLoading(
        valueColor: new AlwaysStoppedAnimation(Colors.green[900]),
      );
    }
    if (_controller.error != null) {
      return CenteredMessage();
    }
    return GridView.builder(
      padding: EdgeInsets.all(5),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemBuilder: _characterCard,
      itemCount: _controller.moviesCount,
    );
  }

  Widget _characterCard(BuildContext context, int index) {
    final character = _controller.characters[index];
    return CharacterCard(
      imagePath: character.img,
      onTap: () => _openCharacterDetail(character),
    );
  }

  _openCharacterDetail(CharacterModel character) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CharacterDetail(
          character: character,
        ),
      ),
    );
  }
}
