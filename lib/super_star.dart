import 'package:flutter/material.dart';
import 'package:orderha/model/Product.dart';
import 'package:orderha/product.dart' as prod;
import 'controller/product_controller.dart';

class SuperStar extends StatefulWidget {
  const SuperStar({super.key});

  @override
  State<SuperStar> createState() => _SuperStarState();
}

class _SuperStarState extends State<SuperStar> {
  late Future<List<Product>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = ProductService().fetchProducts() as Future<List<Product>>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Super Start'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Image.asset('images/Super star.jpg'),
              ),
            ),
            Text(
              'Our Menu:',
              style: TextStyle(
                fontFamily: 'Lobster',
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            FutureBuilder<List<Product>>(
              future: futureProducts,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Text('No products available');
                }

                // Filter products by store_id
                final products = snapshot.data!.where((product) => product.storeId == 3).toList();

                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ListTile(
                      title: Text(product.name),
                      subtitle: Text(product.description,style: TextStyle(fontSize: 13),),
                      leading: Image.asset('images/French corner.jpg'),
                      trailing:Text('\$${product.price}') ,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => prod.ProductPage(
                              productDescription: product.description,
                              productName: product.name,
                              productPrice: '\$${product.price}',
                              imageUrl:'images/French corner.jpg' ,
                              productId: product.id,
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

