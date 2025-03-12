import 'package:flutter/material.dart';
import 'package:flutter_lio_integration/features/payment_checkout/model/payment_type.dart';
import 'package:flutter_lio_integration/features/payment_checkout/payment_checkout_presenter.dart';
import 'package:flutter_lio_integration/features/payment_checkout/payment_checkout_view.dart';
import 'package:flutter_lio_integration/features/products/model/product.dart';

class PaymentCheckoutScreen extends StatefulWidget {
  final Product product;

  const PaymentCheckoutScreen({super.key, required this.product});

  @override
  State<PaymentCheckoutScreen> createState() => _PaymentCheckoutScreenState();
}

class _PaymentCheckoutScreenState extends State<PaymentCheckoutScreen>
    implements PaymentCheckoutView {
  late PaymentCheckoutPresenter presenter;
  String message = "";

  @override
  void initState() {
    super.initState();
    presenter = PaymentCheckoutPresenter(this.widget.product);
    presenter.startListener();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Checkout de Venda",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 16,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              widget.product.name ?? '',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Quantidade: ${widget.product.quantity}"),
            SizedBox(
              height: 10,
            ),
            Text("Preço: R\$ ${widget.product.unitPrice?.roundToDouble()}"),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 58,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  child: Text(
                    "Crédito Avista",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onPressed: () {
                    presenter.checkout(
                      PaymentType.creditoAVista,
                      widget.product,
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 58,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  child: Text(
                    "Débito Avista",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onPressed: () {
                    presenter.checkout(
                      PaymentType.debitoAVista,
                      widget.product,
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Text(
                  message,
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void showMessage(String message) {
    this.message = message;
    setState(() {});
  }
}
