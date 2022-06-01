import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const id = 'home_screen';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: null,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: const Text(
          'Cars',
          style: TextStyle(
            color: Colors.redAccent,
            fontSize: 25,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.notifications_none, color: Colors.redAccent),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.shopping_cart, color: Colors.redAccent),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    singleTab(true, 'All'),
                    singleTab(false, 'Red'),
                    singleTab(false, 'Blue'),
                    singleTab(false, 'Green'),
                    singleTab(false, 'Grey'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              makeItem('assets/images/image1.jpg', '\$65 000'),
              makeItem('assets/images/image2.jpg', '\$40 000'),
              makeItem('assets/images/image3.jpg', '\$60 000'),
              makeItem('assets/images/image4.jpg', '\$55 000'),
              makeItem('assets/images/image5.jpg', '\$70 000'),
            ],
          ),
        ),
      ),
    );
  }

  Widget singleTab(bool type, String text) {
    return AspectRatio(
      aspectRatio: 2.2 / 1,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: type ? Colors.redAccent : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: Text(text,
                style: TextStyle(
                  fontSize: type ? 20 : 17,
                  color: type ? Colors.white : Colors.black,
                ))),
      ),
    );
  }

  Widget makeItem(image, price) {
    return Container(
      height: 240,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, blurRadius: 10, offset: Offset(0, 10))
          ]),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            colors: [
              Colors.black.withOpacity(0.9),
              Colors.black.withOpacity(0.7),
              Colors.black.withOpacity(0.4),
              Colors.black.withOpacity(0.2),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text('Camaro Car',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        )),
                    SizedBox(width: 10),
                    Text('Diesel',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                        )),
                  ],
                ),
                const SizedBox(height: 10),
                Text(price,
                    style: const TextStyle(color: Colors.white, fontSize: 20)),
              ],
            ),
            Container(
              height: 35,
              width: 35,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.redAccent,
              ),
              child: const Center(
                child:
                    Icon(Icons.favorite_border, color: Colors.white, size: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
