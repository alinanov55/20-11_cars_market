import 'package:flutter/material.dart';
import 'package:mob_novikova/Page/product_details.dart';


void main() {
  runApp(MyApp());
}

final List<String> ImageUrls = [
  'https://www.corvsport.com/wp-content/uploads/2020/10/Right-Front-2.jpg',
  'https://static.tildacdn.com/tild3566-3365-4539-a537-646133396434/_.jpg',
  'https://img123.s3.amazonaws.com/2020/04/27/87/54ff68bda5b596f2_8c7db07996a7b7.jpg',
  'https://mirfar.com/upload/iblock/2d6/495wwlvde2il1a0f17jletj6g7glolcq.jpg',
  'https://perevozki-stolitsa.ru/wp-content/uploads/2020/04/Specversiya-Toyota-Supra.jpg',
  'https://s.aolcdn.com/commerce/autodata/images/USC70MLC051A021001.jpg',
  'https://i.pinimg.com/originals/26/26/8c/26268c68154966a3c35f6c9868267df0.png',
  'https://i.pinimg.com/originals/89/75/d5/8975d50f05dfe6de1e63dc3f626b1fe5.png',
  'https://static.tildacdn.com/tild3733-3066-4336-b965-336331343738/22.jpg',
  'https://autos.hamariweb.com/images/carimages/AAeulJ2.jpg',
  'https://i.pinimg.com/originals/0e/02/93/0e0293b7637acf736576e85d0dbbe2a6.jpg',
  'https://i.pinimg.com/originals/de/9a/53/de9a53b66859244c261d1e48958e3113.png',
  'https://compare.pricesofindia.com/src/news/2020/07/26/Virat-Kohli-Car-Collection-Audi-R8-PricesOfIndia.jpg',
  'https://cdn.carbuzz.com/car-thumbnails/original/8000/200/8242.jpg',
  'https://grandprixmotors.com/wp-content/uploads/2022/05/Free-Acura-NSX.jpg',
  'https://i.pinimg.com/originals/e2/9a/58/e29a5829debc535bfb13dcc03beb653b.jpg',
];

final List<String> textContent = [
  'Arctic Corvette',
  'Dodge Challenger',
  'BMW M5',
  'Mercedes CLS63 AMG',
  'Toyota Supra',
  'McLaren',
  'Lamborghini Aventador',
  'Ford Mustang',
  'Porsche 911 turbo s',
  'Lotus Exige',
  'Lexus PC',
  'Nissan GTR',
  'Audi R8',
  'Bugatti Chiron',
  'Nissan NSX',
  'BMW I8',
];

final List<double> ProductPriceList = [170000, 17000000, 13000000 , 1956, 3129,12391,95930,12395,123095,56929,123095,12094,21349,293213,2139123,160000];



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cars'),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.grey,
        body: ProductGrid(),
      ),
    );
  }
}


class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(ImageUrls.length, (index) {
        return ProductCard(
          imageUrl: ImageUrls[index],
          productName: textContent[index],
          ProductPrice: ProductPriceList[index],
        );
      }),
    );
  }
}


class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final double ProductPrice;

  ProductCard({required this.imageUrl, required this.productName, required this.ProductPrice});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children:[
            Image.network(
              imageUrl,
              width: 200,
              height: 97,
            ),
            Text('\$${ProductPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
            ),
            Text(productName),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsPage(
                      ImageContent: imageUrl,
                      TextContent: productName,
                    ),
                  ),
                );
              },
              child: Text('Купить'),
            )
          ],
        ),
      ),
    );
  }
}