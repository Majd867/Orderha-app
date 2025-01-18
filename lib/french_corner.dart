import 'package:flutter/material.dart';
import 'package:orderha/model/Product.dart';
import 'package:orderha/product.dart' as prod;
//import 'package:orderha/product.dart';
import 'controller/product_controller.dart';

class FrenchCornerPage extends StatefulWidget {
  @override
  State<FrenchCornerPage> createState() => _FrenchCornerPageState();
}

class _FrenchCornerPageState extends State<FrenchCornerPage> {

  late Future<List<Product>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = ProductService(2).fetchProducts() as Future<List<Product>>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('French Corner'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Image.asset('images/French corner.jpg'),
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
                final products = snapshot.data!.where((product) => product.storeId == 2).toList();

                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final  product = products[index];
                   print(product.toString());
                    return ListTile(
                      title: Text(product.name),
                      subtitle: Text(product.description,style: TextStyle(fontSize: 13),),
                      leading: Image.asset(''),
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
