import 'package:breaking_bad/controllers/character_detail.dart';
import 'package:breaking_bad/widgets/centered_message.dart';
import 'package:breaking_bad/widgets/circular_loading.dart';
import 'package:breaking_bad/widgets/text_info.dart';
import 'package:breaking_bad/widgets/text_list_view.dart';
import 'package:flutter/material.dart';
import 'package:breaking_bad/models/character_model.dart';

class CharacterDetail extends StatefulWidget {
  final CharacterModel character;

  const CharacterDetail({
    this.character,
  });

  @override
  _CharacterDetailState createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {
  final _controller = CharacterDetalController();

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  _initialize() async {
    setState(() {
      _controller.isLoading = true;
    });
    await _controller.fetchCharacterQuote(widget.character.name);
    await _controller.fetchCharacterDeaths(widget.character.name);
    setState(() {
      _controller.isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.character.name)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildImage(),
            _buildCharacterInfo(),
          ],
        ),
      ),
    );
  }

  Image _buildImage() {
    return Image.network(
      widget.character.img,
      fit: BoxFit.cover,
      height: 400,
      width: double.maxFinite,
      alignment: Alignment.topCenter,
    );
  }

  _buildCharacterInfo() {
    if (_controller.isLoading) {
      return CircularLoading(
        valueColor: new AlwaysStoppedAnimation(Colors.green[900]),
      );
    }
    if (_controller.error != null) {
      return CenteredMessage();
    }
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextInfo(label: 'Name: ${widget.character.name}'),
          TextInfo(label: 'Nickname: ${widget.character.nickname}'),
          TextInfo(label: 'Birthday: ${widget.character.birthday}'),
          TextInfo(label: 'Status: ${widget.character.status}'),
          TextInfo(label: 'Actor: ${widget.character.portrayed}'),
          _showOccupations(),
          _showAppearance(
              'Breaking Bad Appearance: ', widget.character.appearance),
          _showAppearance('Better Call Saul Appearance: ',
              widget.character.betterCallSaulAppearance),
          TextInfo(label: 'Deaths : ${_controller.death.toString()}'),
          _buildQuote()
        ],
      ),
    );
  }

  _showOccupations() {
    final itemCount = widget.character.occupation?.length ?? 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextInfo(label: 'Occupation(s):'),
        ListView.builder(
          itemBuilder: _buildTextOcupation,
          itemCount: itemCount,
          shrinkWrap: true,
        ),
      ],
    );
  }

  _showAppearance(String label, List<int> appearance) {
    final itemCount = appearance?.length ?? 0;
    if (itemCount == 0) return Container();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextInfo(label: label),
        ListView.builder(
          itemBuilder: (context, index) =>
              _buildTextAppearance(index, appearance),
          itemCount: itemCount,
          shrinkWrap: true,
        ),
      ],
    );
  }

  Widget _buildTextAppearance(int index, List<int> listAppearance) {
    final appearance = listAppearance[index];
    return TextListView(label: 'Season ' + appearance.toString());
  }

  Widget _buildTextOcupation(BuildContext context, int index) {
    final occupation = widget.character.occupation[index];
    return TextListView(label: occupation);
  }

  _buildQuote() {
    return _controller.quote.isNotEmpty
        ? TextInfo(label: 'Quote: ${_controller.quote}')
        : TextInfo(label: '');
  }
}
