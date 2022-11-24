import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mengenal_satwa/animation/fade_animation.dart';
import 'package:mengenal_satwa/model/animal.dart';

var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');

class DetailScreen extends StatelessWidget {
  final animalModel animal;

  const DetailScreen({Key? key, required this.animal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return DetailWebPage(animal: animal);
        } else {
          return DetailMobilePage(animal: animal);
        }
      },
    );
  }
}

class DetailMobilePage extends StatelessWidget {
  final animalModel animal;

  const DetailMobilePage({Key? key, required this.animal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.network(animal.imageAsset,
                    height: 450,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const FavoriteButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Column(children: [
                Text(
                  animal.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30.0,
                  ),
                ),
                Text(
                  animal.latinName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ]),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const FaIcon(FontAwesomeIcons.crown),
                      const SizedBox(height: 8.0),
                      Text(
                        animal.kingdom,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const FaIcon(FontAwesomeIcons.userGroup),
                      const SizedBox(height: 8.0),
                      Text(
                        animal.classType,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const FaIcon(FontAwesomeIcons.paw),
                      const SizedBox(height: 8.0),
                      Text(
                        animal.ordo,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Expanded(
                child: Column(
                  children: [
                    Text(
                      animal.description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Oxygen',
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        const FaIcon(FontAwesomeIcons.globe),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            animal.from,
                            style: informationTextStyle,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        const FaIcon(FontAwesomeIcons.plateWheat),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            animal.food,
                            style: informationTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            FadeAnimation(
              delay: .4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 12.0),
                  Expanded(child: PlayButton(soundFile: animal.soundAsset)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailWebPage extends StatefulWidget {
  final animalModel animal;

  const DetailWebPage({Key? key, required this.animal}) : super(key: key);

  @override
  _DetailWebPageState createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: kIsWeb ? null : AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 64,
        ),
        child: Center(
          child: SizedBox(
            width: screenWidth <= 1200 ? 800 : 1200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                  height: 32,
                ),
                const SizedBox(height: 32),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(widget.animal.imageAsset,
                                height: 400,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                    const SizedBox(width: 32),
                    Expanded(
                      child: Card(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 325,
                              padding: const EdgeInsets.all(12),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Text(
                                      widget.animal.name,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 30.0,
                                      ),
                                    ),
                                    Text(
                                      widget.animal.latinName,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    const SizedBox(height: 12.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            const FaIcon(
                                                FontAwesomeIcons.crown),
                                            const SizedBox(height: 8.0),
                                            Text(
                                              widget.animal.kingdom,
                                              style: informationTextStyle,
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            const FaIcon(
                                                FontAwesomeIcons.userGroup),
                                            const SizedBox(height: 8.0),
                                            Text(
                                              widget.animal.classType,
                                              style: informationTextStyle,
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            const FaIcon(FontAwesomeIcons.paw),
                                            const SizedBox(height: 8.0),
                                            Text(
                                              widget.animal.ordo,
                                              style: informationTextStyle,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            widget.animal.description,
                                            textAlign: TextAlign.justify,
                                            style: const TextStyle(
                                              fontSize: 16.0,
                                              fontFamily: 'Oxygen',
                                            ),
                                          ),
                                          const SizedBox(height: 8.0),
                                          Row(
                                            children: <Widget>[
                                              const FaIcon(
                                                  FontAwesomeIcons.globe),
                                              const SizedBox(width: 8.0),
                                              Expanded(
                                                child: Text(
                                                  widget.animal.from,
                                                  style: informationTextStyle,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8.0),
                                          Row(
                                            children: <Widget>[
                                              const FaIcon(
                                                  FontAwesomeIcons.plateWheat),
                                              const SizedBox(width: 8.0),
                                              Expanded(
                                                child: Text(
                                                  widget.animal.food,
                                                  style: informationTextStyle,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            FadeAnimation(
                              delay: .4,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color:
                                              Color.fromARGB(255, 34, 34, 34),
                                        ),
                                      ),
                                      child: const FavoriteButton(),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: PlayButton(
                                        soundFile: widget.animal.soundAsset,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class PlayButton extends StatefulWidget {
  final String soundFile;
  const PlayButton({Key? key, required this.soundFile}) : super(key: key);

  @override
  _PlayButtonState createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  bool isPlaying = false;
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        setState(() {
          isPlaying = !isPlaying;
        });
        final url = widget.soundFile;
        await player.setUrl(url);
        player.play();
        // player.playerStateStream.listen((_state) {
        //   if (_state.playing) {

        //   }
        // });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 34, 34, 34),
          border: Border.all(
            color: Color.fromARGB(255, 34, 34, 34),
          ),
        ),
        child: const Center(
          child: Text(
            textAlign: TextAlign.center,
            'Listen This Animal Sound',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
