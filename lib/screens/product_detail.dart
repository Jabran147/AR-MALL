import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ar_mall/utils/app_assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../widgets/appbar.dart';
import '../widgets/bottomnavbar.dart';
import '../widgets/size_selector.dart';
import '../provider/product_provider.dart';
import '../provider/quantity_provider.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  static const namedRoute = '/productDetail';

  void _launchURL(_url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    final quantity = Provider.of<QuantityProvider>(context);
    final products = Provider.of<ProductProvider>(context).items;
    final productID = ModalRoute.of(context)!.settings.arguments;
    final productData =
        products.firstWhere((element) => element.id == productID);
    print(productData.desc);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    height: 420,
                    decoration:
                        BoxDecoration(color: Theme.of(context).primaryColor),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Column(
                        children: [
                          Appbar(
                            title: productData.title as String,
                            color: Colors.white,
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                AppAssets.bgLogoPng,
                                width: 300,
                              ),
                              Positioned(
                                top: 30,
                                child: CachedNetworkImage(
                                  imageUrl: productData.imageURL as String,
                                  width: 210,
                                  fit: BoxFit.cover,
                                  placeholder: ((context, url) => Center(
                                        child: CircularProgressIndicator(),
                                      )),
                                  errorWidget: ((context, url, error) =>
                                      Icon(Icons.error)),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 325),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                      height: 720,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: Offset(0, -2),
                              blurRadius: 10,
                              spreadRadius: 1)
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            'FOOTWEAR IDEAS',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            productData.title as String,
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            'PKR ${productData.price.toString()}',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    backgroundColor:
                                        Theme.of(context).indicatorColor,
                                  ),
                                  onPressed: () {
                                    _launchURL(productData.arFilter);
                                  },
                                  child: Text(
                                    'Try it!',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'Add to cart',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              Text(
                                'Description',
                                style: TextStyle(
                                    fontSize: 18,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          SizedBox(height: 6),
                          Text(
                            productData.desc as String,
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'Sizes',
                                style: TextStyle(
                                    fontSize: 18,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          SizeSelector(
                            selectedSize: '40',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'Quantity',
                                style: TextStyle(
                                    fontSize: 18,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => quantity.decrementQuantity(),
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: quantity.qty > 1
                                        ? Theme.of(context).primaryColor
                                        : Color(0xFFF3F3F3),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/svgs/minus.svg',
                                    color: quantity.qty > 1
                                        ? Colors.white
                                        : Colors.black,
                                    width: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                quantity.qty.toString(),
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () => quantity.incrementQuantity(),
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/svgs/add.svg',
                                    color: Colors.white,
                                    width: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                'Sold by',
                                style: TextStyle(
                                    fontSize: 18,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  productData.sellerName as String,
                                  style: TextStyle(
                                      fontSize: 18,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Reviews',
                                    style: TextStyle(
                                        fontSize: 18,
                                        letterSpacing: 0.5,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '(120)',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '5.0',
                                    style: TextStyle(
                                        fontSize: 16,
                                        letterSpacing: 0.5,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  for (int i = 0; i < 5; i++)
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: SvgPicture.asset(
                                        'assets/svgs/star.svg',
                                        width: 14,
                                        color: Theme.of(context).indicatorColor,
                                      ),
                                    ),
                                  GestureDetector(
                                    onTap: () {
                                      showReviews(context, productData);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xFFF3F3F3),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      height: 25,
                                      width: 25,
                                      child: SvgPicture.asset(
                                        'assets/svgs/chevron-right.svg',
                                        width: 19,
                                        // color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Future<dynamic> showReviews(BuildContext context, data) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(15),
            ),
          ),
          height: 500,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: SvgPicture.asset(
                            'assets/svgs/close.svg',
                            width: 24,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.center,
                      child: CachedNetworkImage(
                        imageUrl: data.imageURL as String,
                        width: 140,
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        errorWidget: ((context, url, error) =>
                            Icon(Icons.error)),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: Column(
                    children: [
                      Text(
                        'Reviews',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            letterSpacing: 0.5),
                      ),
                      Text(
                        '120 reviews',
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      for (int i = 0; i < 5; i++)
                        Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Color(0xFFF3F3F3),
                            ),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 24,
                              backgroundColor: Theme.of(context).indicatorColor,
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    width: 140,
                                    imageUrl:
                                        'https://images.unsplash.com/photo-1588516903720-8ceb67f9ef84?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjF8fHdvbWVufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
                                    placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    errorWidget: ((context, url, error) =>
                                        Icon(Icons.error)),
                                  ),
                                ),
                              ),
                            ),
                            title: Text(
                              'Mozell Legros',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
                                    for (int i = 0; i < 5; i++)
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: SvgPicture.asset(
                                          'assets/svgs/star.svg',
                                          width: 10,
                                          color:
                                              Theme.of(context).indicatorColor,
                                        ),
                                      ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(data.desc),
                              ],
                            ),
                            trailing: Text(
                                '${DateFormat.Md().format(DateTime.now())}'),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
