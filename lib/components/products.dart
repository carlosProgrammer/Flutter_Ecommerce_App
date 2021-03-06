import 'package:flutter/material.dart';

//Local Imports
import 'package:upwork_diego/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Red Dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": 100,
      "price": 50,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return SingleProduct(
            productName: productList[index]['name'],
            productPicture: productList[index]['picture'],
            productOldPrice: productList[index]['old_price'],
            productPrice: productList[index]['price'],
          );
        });
  }
}

class SingleProduct extends StatelessWidget {
  final productName;
  final productPicture;
  final productOldPrice;
  final productPrice;

  SingleProduct({
    this.productName,
    this.productPicture,
    this.productOldPrice,
    this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: productName,
          child: Material(
            child: InkWell(
              onTap: ()=> Navigator.of(context).push(
                  new MaterialPageRoute(
                    //Passing values of the product to the product details page
                      builder: (context)=> new ProductDetails(
                        product_detail_name: productName,
                        product_detail_price: productPrice,
                        product_detail_old_price: productOldPrice,
                        product_detail_picture: productPicture,
                      ))),
              child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: ListTile(
                      leading: Text(
                        productName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        "\€$productPrice",
                        style: TextStyle(
                            color: Colors.redAccent, fontWeight: FontWeight.w800),
                      ),
                      subtitle: Text("\€$productOldPrice",
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.lineThrough),
                      ),
                    ),
                  ),
                  child: Image.asset(
                    productPicture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}
