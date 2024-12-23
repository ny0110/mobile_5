import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile_5/model/favorites.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({super.key});

  final List<Map<String, String>> flowers = [
    {
      'id': '1',
      'name': 'Пион',
      'image': 'https://avatars.mds.yandex.net/i?id=81dbedd25b5ea0a93ff573b74aabde1e_l-9122788-images-thumbs&ref=rim&n=13&w=1020&h=1020'
    },
    {
      'id': '2',
      'name': 'Альстромерия',
      'image': 'https://i.pinimg.com/originals/0e/a8/8f/0ea88f06cb3eaefe2b80a7e824e76908.jpg'
    },
    {
      'id': '3',
      'name': 'Ромашка',
      'image': 'https://pinkbuket.ru/wp-content/uploads/2024/05/romashka.jpeg'
    },
    {
      'id': '4',
      'name': 'Георгин',
      'image': 'https://avatars.mds.yandex.net/get-pdb/2828115/bf01180c-5c1a-4d1e-934f-225b4a80e0d7/s1200?webp=false'
    },
    {
      'id': '5',
      'name': 'Циния',
      'image': 'https://www.dobies.co.uk/product_images/FLSZIN2220.jpg'
    },
    {
      'id': '6',
      'name': 'Хризантема',
      'image': 'https://avatars.mds.yandex.net/i?id=ad419143d7c0479e5476544c176e7fa0_l-10262551-images-thumbs&n=13'
    },
    {
      'id': '7',
      'name': 'Эустома',
      'image': 'https://avatars.mds.yandex.net/get-altay/4303652/2a00000178f44de5d24643fa59faea9984ad/XXXL'
    },
    {
      'id': '8',
      'name': 'Матиола',
      'image': 'https://avatars.mds.yandex.net/i?id=b4a7cc883773b32f07c222bacd6d8b7a_l-8356602-images-thumbs&n=13'
    },
    {
      'id': '9',
      'name': 'Статица',
      'image': 'https://cdn.100sp.ru/pictures/950128683'
    },
    {
      'id': '10',
      'name': 'Антиринум',
      'image': 'https://avatars.mds.yandex.net/i?id=48b3962c948fc5ca1dc960b0ed4ab36c_l-5286448-images-thumbs&n=13'
    },
  ];

  @override
  Widget build(BuildContext context) {
    var favorites = context.watch<FavoritesModel>();
    var favoriteFlowers = flowers.where((flower) {
      var id = int.tryParse(flower['id'] ?? '');
      return id != null && favorites.favoriteItemIds.contains(id);
    }).toList();

    return Scaffold(
      body: favoriteFlowers.isNotEmpty
          ? ListView.builder(
        itemCount: favoriteFlowers.length,
        itemBuilder: (context, index) {
          var flower = favoriteFlowers[index];
          return ListTile(
            leading: Image.network(
              flower['image']!,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(flower['name']!),
            trailing: IconButton(
              icon: const Icon(Icons.favorite),
              color: Colors.pink,
              onPressed: () {
                var id = int.tryParse(flower['id'] ?? '');
                if (id != null) {
                  favorites.remove(id);
                }
              },
            ),
          );
        },
      )
          : const Center(
        child: Text('Нет избранных товаров'),
      ),
    );
  }
}
