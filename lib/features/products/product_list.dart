import 'package:flutter/material.dart';
import 'package:flutter_lio_integration/features/products/model/product.dart';
import 'package:flutter_lio_integration/routing/routes.dart';
import 'package:go_router/go_router.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> items = Product.list();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Escolha um produto"),
      ),
      body: ListView.separated(
        itemCount: items.length,
        itemBuilder: ((context, index) {
          return ListTile(
            title: Text(
              items[index].name ?? '',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              context.go(Routes.checkout, extra: items[index]);
            },
          );
        }),
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }
}
