import 'package:ar_mall/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../screens/product_detail.dart';

class ProductItems extends StatefulWidget {
  const ProductItems({super.key});

  @override
  State<ProductItems> createState() => _ProductItemsState();
}

var products;

void goToWhiteView(BuildContext context) {
  changeSystemColor(Theme.of(context).primaryColor);
  Navigator.of(context)
      .pushNamed(ProductDetail.namedRoute, arguments: products.id)
      .then((result) {
    changeSystemColor(Colors.transparent);
  });
}

void changeSystemColor(Color color) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: color, statusBarColor: color));
}

class _ProductItemsState extends State<ProductItems> {
  @override
  Widget build(BuildContext context) {
    products = Provider.of<Products>(context);

    return GestureDetector(
      onTap: () => goToWhiteView(context),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey.shade200)),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Column(
          children: [
            Container(
              // height: 120,
              // width: 120,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: CachedNetworkImage(
                imageUrl: products.imageURL as String,
                placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                  color: Color(0xFFFB9ED2),
                )),
                errorWidget: ((context, url, error) => Icon(Icons.error)),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                products.title as String,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'PKR ${products.price.toString()}',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              trailing: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Color(0xFFFB9ED2),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      products.isFavorite = !products.isFavorite;
                    });
                  },
                  color: products.isFavorite ? Colors.red : Colors.white,
                  icon: products.isFavorite
                      ? Icon(
                          Icons.favorite,
                          size: 15,
                        )
                      : Icon(Icons.favorite_border_outlined, size: 15),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
