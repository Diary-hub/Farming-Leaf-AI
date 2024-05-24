class Plant4 {
  final int plantId;
  final String imageURL;

  Plant4({
    required this.plantId,
    required this.imageURL,
  });

  static List<Plant4> plantList = [
    Plant4(
      plantId: 1,
      imageURL:
          'https://static.vecteezy.com/system/resources/previews/018/743/086/original/bell-pepper-isolated-png.png',
    ),
    Plant4(
      plantId: 2,
      imageURL:
          'https://static.vecteezy.com/system/resources/previews/011/704/547/non_2x/isolated-tomato-on-transparent-background-free-png.png',
    ),
    Plant4(
      plantId: 3,
      imageURL:
          "https://static.vecteezy.com/system/resources/previews/029/720/186/original/cucumber-transparent-background-png.png",
    ),
    Plant4(
      plantId: 4,
      imageURL:
          "https://static.vecteezy.com/system/resources/previews/034/339/082/original/red-onion-cut-with-ai-generated-free-png.png",
    ),
    Plant4(
      plantId: 5,
      imageURL:
          "https://static.vecteezy.com/system/resources/previews/022/149/238/non_2x/green-lettuce-isolated-png.png",
    ),
    Plant4(
      plantId: 6,
      imageURL:
          'https://static.vecteezy.com/system/resources/previews/018/743/086/original/bell-pepper-isolated-png.png',
    ),
    Plant4(
      plantId: 7,
      imageURL:
          'https://static.vecteezy.com/system/resources/previews/011/704/547/non_2x/isolated-tomato-on-transparent-background-free-png.png',
    ),
    Plant4(
      plantId: 8,
      imageURL:
          "https://static.vecteezy.com/system/resources/previews/029/720/186/original/cucumber-transparent-background-png.png",
    ),
    Plant4(
      plantId: 9,
      imageURL:
          "https://static.vecteezy.com/system/resources/previews/034/339/082/original/red-onion-cut-with-ai-generated-free-png.png",
    ),
    Plant4(
      plantId: 10,
      imageURL:
          "https://static.vecteezy.com/system/resources/previews/022/149/238/non_2x/green-lettuce-isolated-png.png",
    ),
    Plant4(
      plantId: 11,
      imageURL:
          'https://static.vecteezy.com/system/resources/previews/018/743/086/original/bell-pepper-isolated-png.png',
    ),
    Plant4(
      plantId: 12,
      imageURL:
          'https://static.vecteezy.com/system/resources/previews/011/704/547/non_2x/isolated-tomato-on-transparent-background-free-png.png',
    ),
    Plant4(
      plantId: 13,
      imageURL:
          "https://static.vecteezy.com/system/resources/previews/029/720/186/original/cucumber-transparent-background-png.png",
    ),
    Plant4(
      plantId: 14,
      imageURL:
          "https://static.vecteezy.com/system/resources/previews/034/339/082/original/red-onion-cut-with-ai-generated-free-png.png",
    ),
    Plant4(
      plantId: 15,
      imageURL:
          "https://static.vecteezy.com/system/resources/previews/022/149/238/non_2x/green-lettuce-isolated-png.png",
    ),
  ];
  static Plant4? getPlantById(int id) {
    return plantList.firstWhere(
      (plant) => plant.plantId == id,
    );
  }
}
