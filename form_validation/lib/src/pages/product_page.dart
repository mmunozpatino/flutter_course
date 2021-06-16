import 'package:flutter/material.dart';
import 'package:form_validation/src/models/productModel.dart';
import 'package:form_validation/src/utils/utils.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final _formKey = GlobalKey<FormState>();

  ProductModel product = ProductModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Producto"),
        actions: [
          IconButton(
            icon: Icon(Icons.photo_size_select_actual), 
            onPressed: () {}
          ),
          IconButton(
            icon: Icon(Icons.camera_alt), 
            onPressed: () {}
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          //TOMA EL SUBMIT
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _renderName(),
                _renderPrice(),
                _renderAvailable(context),
                _renderSubmit(context)
              ],
            )
          )
        ),
      )
    );
  }

  Widget _renderName() {
    return TextFormField(
      initialValue: product.title,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        labelText: 'Producto'
      ),
      onSaved: (value) => product.title = value,
      validator: (value) {
        if( value.length < 3) {
          return 'Pone el nombre puta';
        } else {
          return null;
        }
      }
    );
  }

  Widget _renderPrice() {
    return TextFormField(
      initialValue: product.price.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Precio'
      ),
      onSaved: (value) => product.price = double.parse(value),
      validator: (value) {
        if( !isNumber(value) ) {
          return 'Pone un numero lpm';
        } else {
          return null;
        }
      },
    );
  }

  Widget _renderSubmit(BuildContext context) {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      label: Text("Save"),
      icon: Icon(Icons.save),
      onPressed: _submit
    );
  }

  Widget _renderAvailable(BuildContext context) {
    return SwitchListTile(
      value: product.available, 
      title: Text("Está disponible"),
      activeColor: Theme.of(context).primaryColor,
      onChanged: (value) => setState(() {
        product.available = value;
      })
    );
  }
  void _submit() {
    if( !_formKey.currentState.validate() ) return;

    _formKey.currentState.save();
    print('todo ok');
    print(product.title);
    print(product.price);
    print(product.available);
  }
}