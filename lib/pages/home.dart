import 'package:firebase_app/components/product_form.dart';
import 'package:firebase_app/components/product_item.dart';
import 'package:firebase_app/model/product.dart';
import 'package:firebase_app/model/product_list.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool _inRequest = false;

  ProductList products = ProductList();

  void getItens() async {
    setState(() {
      _inRequest = true;
    });
    await products.getItems();
     setState(() {
      _inRequest = false;
    });
  }

  void _addProduct(Product product) async {
    setState(() {
      _inRequest = true;
    });
    await products.addItem(product);
    setState(() {
      _inRequest = false;
    });
  }

  void _deleteProduct(Product product) async {
    setState(() {
      _inRequest = true;
    });
    await products.removeItem(product.id);
    setState(() {
      _inRequest = false;
    });
  }

  void _editProduct(Product product) async {
    setState(() {
      _inRequest = true;
    });
    await products.editItem(product);
    setState(() {
      _inRequest = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Produtos"),
        actions: [
          IconButton(
            onPressed: _inRequest 
            ? null
            : getItens,
            icon: const Icon(
              Icons.refresh
            )
          ),
          IconButton(
            onPressed: _inRequest   
            ? null
            : () => showDialog(
              context: context, 
              builder: (context) => ProductForm(onSubmit: _addProduct)
            ),
            icon: const Icon(
              Icons.add
            )
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          getItens();
        },
        child: _inRequest
        ? const Center(
            child: CircularProgressIndicator()
          )
        : products.items.isEmpty
        ? ListView(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: const Text("Nenhum item encontrado.")
                )
              ),
            ],
          )
        : ListView.builder(
            itemCount: products.items.length,
            itemBuilder: (context, index) {
              return ProductItem(
                product: products.items[index],
                onDelete: _deleteProduct,
                onEdit: _editProduct,
              );
            },
          ),
      ),
    );
  }
}

