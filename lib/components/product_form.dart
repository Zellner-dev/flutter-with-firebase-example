import 'dart:math';

import 'package:firebase_app/model/product.dart';
import 'package:flutter/material.dart';

class ProductForm extends StatefulWidget {
  const ProductForm({
    super.key, 
    required this.onSubmit, 
    this.product
  });

  final void Function(Product) onSubmit;
  final Product? product;

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {

  final _formKey = GlobalKey<FormState>();
  final _formData = <String, dynamic>{};

  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if(!isValid) return;

    _formKey.currentState?.save();  
    
    widget.onSubmit(
      Product(
        id: widget.product == null
          ?  Random().nextDouble().toString()
          : widget.product!.id,
        name: _formData["name"],
        price: double.parse(_formData["price"])
      )
    );
    
    Navigator.of(context).pop();
  }
  
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      height: 250,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                onSaved: (newValue) => _formData["name"] = newValue ?? "",
                validator: (value) {
                  if(value == "" || value == null) {
                    return "Insira um valor válido.";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: "Nome do produto",
                  hintText: "Mouse"
                ),
              ),
              TextFormField(
                onSaved: (newValue) => _formData["price"] = newValue ?? "",
                validator: (value) {
                  value = value ?? "";
                  if(value == "") {
                    return "Insira um valor válido.";
                  }
                  try{
                    double.parse(value);
                  } catch(_) {
                    return "Valor inválido.";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: "Valor do produto",
                  hintText: "19.99"
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    _submitForm();
                  }, 
                  child: const Text('Adicionar')
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}