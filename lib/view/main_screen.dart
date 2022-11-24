import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mengenal_satwa/view/detail_screen.dart';
import 'package:mengenal_satwa/view/favorite_screen.dart';
import 'package:mengenal_satwa/model/animal.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                  height: 32,
                ),
                const FavoriteRouteButton()
              ],
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0.0,
          ),
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth <= 600) {
                return const AnimalList();
              } else if (constraints.maxWidth <= 1200) {
                return const AnimalListGrid(gridCount: 4);
              } else {
                return const AnimalListGrid(gridCount: 6);
              }
            },
          ),
        );
      },
    );
  }
}

class AnimalListGrid extends StatefulWidget {
  final int gridCount;
  const AnimalListGrid({Key? key, required this.gridCount}) : super(key: key);

  @override
  State<AnimalListGrid> createState() => _AnimalListGridState();
}

class _AnimalListGridState extends State<AnimalListGrid> {
  TextEditingController _searchController = TextEditingController(text: "");
  late List<animalModel> _dataSearch = animalData;
  bool isSearchEmpty = false;
  searchData() {
    setState(() {
      setState(() {
        _dataSearch = animalData
            .where(
              (element) => element.name.toLowerCase().contains(
                    _searchController.text.toLowerCase(),
                  ),
            )
            .toList();
        _dataSearch.isEmpty ? isSearchEmpty = true : isSearchEmpty = false;
        log(_searchController.text);
        log(_dataSearch.length.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 24.0),
      const Text(
        'Hello There,',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30.0,
        ),
      ),
      const Text(
        'What`s Animal Do You Want To Know Today?',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15.0,
        ),
      ),
      const SizedBox(height: 24.0),
      Container(
        width: 250,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: TextField(
          controller: _searchController,
          onChanged: (text) => searchData(),
          maxLines: 1,
          textAlignVertical: TextAlignVertical.center,
          onTap: () {},
          decoration: const InputDecoration(
              prefixIcon: Padding(
                  padding: EdgeInsets.all(8),
                  child: FaIcon(FontAwesomeIcons.magnifyingGlass)),
              hintText: "Tiger, Bird",
              border: InputBorder.none),
        ),
      ),
      isSearchEmpty == false
          ? Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: GridView.count(
                  crossAxisCount: widget.gridCount,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: _dataSearch.map((animal) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DetailScreen(animal: animal);
                        }));
                      },
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Image.network(animal.imageAsset,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter,
                                  height: 250),
                            ),
                            const SizedBox(height: 12),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                animal.name,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, bottom: 8.0),
                              child: Text(
                                animal.latinName,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            )
          : Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(48.0),
                child: Column(
                  children: const [
                    FaIcon(FontAwesomeIcons.faceFrown, size: 48),
                    SizedBox(height: 8.0),
                    Text("Animal Not Found!"),
                  ],
                ),
              ),
            )
    ]);
  }
}

class AnimalList extends StatefulWidget {
  const AnimalList({Key? key}) : super(key: key);

  @override
  State<AnimalList> createState() => _AnimalListState();
}

class _AnimalListState extends State<AnimalList> {
  TextEditingController _searchController = TextEditingController(text: "");
  late List<animalModel> _dataSearch = animalData;
  bool isSearchEmpty = false;
  searchData() {
    setState(() {
      setState(() {
        _dataSearch = animalData
            .where(
              (element) => element.name.toLowerCase().contains(
                    _searchController.text.toLowerCase(),
                  ),
            )
            .toList();
        _dataSearch.isEmpty ? isSearchEmpty = true : isSearchEmpty = false;
        log(_searchController.text);
        log(_dataSearch.length.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 14.0),
          const Text(
            "Hello There, ",
          ),
          const SizedBox(
            height: 4,
          ),
          const SizedBox(
            width: 300,
            child: Text("What`s Animal Do You Want To Know Today?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                )),
          ),
          const SizedBox(
            height: 4,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: _searchController,
              onChanged: (text) => searchData(),
              maxLines: 1,
              textAlignVertical: TextAlignVertical.center,
              onTap: () {},
              decoration: const InputDecoration(
                  prefixIcon: Padding(
                      padding: EdgeInsets.all(8),
                      child: FaIcon(FontAwesomeIcons.magnifyingGlass)),
                  hintText: "Tiger, Bird",
                  border: InputBorder.none),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          isSearchEmpty == false
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final animalModel animal = _dataSearch[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DetailScreen(animal: animal);
                        }));
                      },
                      child: Card(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Image.network(animal.imageAsset,
                                  height: 150,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      animal.name,
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        const FaIcon(FontAwesomeIcons.paw),
                                        const SizedBox(width: 8.0),
                                        Text(
                                          textAlign: TextAlign.center,
                                          animal.ordo,
                                          style: informationTextStyle,
                                        ),
                                      ],
                                    ),
                                    Text(animal.latinName),
                                    Text(
                                      animal.description,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: _dataSearch.length,
                )
              : Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(48.0),
                    child: Column(
                      children: const [
                        FaIcon(FontAwesomeIcons.faceFrown, size: 48),
                        SizedBox(height: 8.0),
                        Text("Animal Not Found!"),
                      ],
                    ),
                  ),
                ),
        ]),
      ),
    );
  }
}

class FavoriteRouteButton extends StatelessWidget {
  const FavoriteRouteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.favorite,
        color: Colors.red,
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return FavoriteScreen();
        }));
      },
    );
  }
}
