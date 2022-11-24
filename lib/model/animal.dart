class animalModel {
  String name;
  String latinName;
  String kingdom;
  String classType;
  String ordo;
  String food;
  String from;
  String description;
  String imageAsset;
  String soundAsset;

  animalModel({
    required this.name,
    required this.latinName,
    required this.kingdom,
    required this.classType,
    required this.ordo,
    required this.food,
    required this.from,
    required this.description,
    required this.imageAsset,
    required this.soundAsset,
  });
}

var animalData = [
  animalModel(
    name: 'African Lion, "King of Beasts"',
    latinName: 'Panthera Leo',
    kingdom: 'Animalia',
    classType: 'Mammalia',
    ordo: 'Carnivora',
    food: 'Meat, small mammals, birds, reptiles and insects',
    from: 'Africa',
    description:
        'In comparison to other big cats, Lions love to socialize with members of their pride. Unlike the female, male lions have long hair around their neck and the top of their head which is known as their mane. Female lions are the main hunters, but the males will be the first to eat. Did you know? A lion can run up to 80 kilometers per hour.',
    imageAsset: 'https://www.bali-zoo.com/assets/img/animal/modal_image/1.jpg',
    soundAsset:
        'https://upload.wikimedia.org/wikipedia/commons/7/7d/Lion_raring-sound1TamilNadu178.ogg',
  ),
  animalModel(
    name: 'Green Peafowl',
    latinName: 'Pavo Muticus',
    kingdom: 'Animalia',
    classType: 'Aves',
    ordo: 'Galliformes',
    food: 'Seeds, grass, leaves, insects',
    from: 'Myanmar (Burma), Indonesia',
    description:
        'The Green Peafowl is found in the tropical forests of Southeast Asia and nests on the ground laying 3 to 6 eggs. A heavy-bodied ground-feeding bird, ticks and termites, flower petals, buds leaves and berries are their favorite foods. Did you know? Even though the Green Peafowl has a large heavy body it is able to fly.',
    imageAsset: 'https://www.bali-zoo.com/assets/img/animal/modal_image/17.jpg',
    soundAsset:
        'https://upload.wikimedia.org/wikipedia/commons/0/0b/Peacock1.ogg',
  ),
  animalModel(
    name: 'Sun Bear',
    latinName: 'Helarctos Malayanus',
    kingdom: 'Animalia',
    classType: 'Mammalia',
    ordo: 'Carnivora',
    food: 'Fruits, roots, leaves, honey, birds and small insects',
    from: 'South East Asia Rain forest',
    description:
        'The sun bear`s fur is jet-black, short and sleek with some under-wool. As sun bears live in tropical regions with year-round available foods, they do not hibernate. Except for females with their offspring, they are usually solitary. Did you know? That the Sun bear is the smallest member of the bear family, and has the shortest and softest hair.',
    imageAsset: 'https://www.bali-zoo.com/assets/img/animal/modal_image/22.jpg',
    soundAsset:
        'https://upload.wikimedia.org/wikipedia/commons/4/4e/Bear_growl.ogg',
  ),
];
