import 'package:firebase_app/components/product_form.dart';
import 'package:firebase_app/model/product.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {

  const ProductItem({
    super.key, 
    required this.product, 
    required this.onDelete, 
    required this.onEdit
  });

  final Product product;
  final void Function(Product product) onDelete;
  final void Function(Product product) onEdit;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(product.name),
        subtitle: Text('R\$${product.price}'),
        trailing: SizedBox(
          width: 100,
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => showDialog(
                  context: context, 
                  builder: (context) {
                    return ProductForm(
                      onSubmit: onEdit,
                      product: product,
                    );
                  }, 
                ),
                icon: const Icon(
                  Icons.edit_rounded,
                  color: Colors.blue,
                )
              ),
              IconButton(
                onPressed: () => onDelete(product), 
                icon: const Icon(
                  Icons.delete_rounded,
                  color: Colors.red,
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}

