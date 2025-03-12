import 'dart:convert';
import 'package:app_links/app_links.dart';
import 'package:flutter_lio_integration/features/payment_checkout/model/Payment_request.dart';
import 'package:flutter_lio_integration/features/payment_checkout/model/payment_type.dart';
import 'package:flutter_lio_integration/features/payment_checkout/payment_checkout_view.dart';
import 'package:flutter_lio_integration/features/products/model/product.dart';
import 'package:url_launcher/url_launcher.dart';
import 'model/payment_response.dart';
import 'model/payment_response_success.dart';

class PaymentCheckoutPresenter {
  PaymentCheckoutView view;
  final Product product;

  PaymentCheckoutPresenter(this.product) : view = PaymentCheckoutView();

  Future<void> checkout(PaymentType paymentType, Product product) async {
    final payment = PaymentRequest.makeOrder(paymentType, product);

    final uri = Uri.parse(
      "lio://payment?request=${payment.toBase64Encode()}&urlCallback=order://payment",
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
      return;
    }
    view.showMessage('Erro: App URI não instalado.');
  }

  void onFailure(PaymentCheckoutResponse response) {
    view.showMessage(response.toJson());
  }

  void onSuccess(PaymentCheckoutResponseSuccess response) {
    view.showMessage(response.toJson());
  }

  final AppLinks _appLinks = AppLinks();

  Future<void> startListener() async {
    try {
      final Uri? initialUri = await _appLinks.getInitialLink();
      if (initialUri != null) {
        handleUri(initialUri);
      }
    } catch (e) {
      print("Erro ao obter o link inicial: $e");
    }

    _appLinks.uriLinkStream.listen(
      (Uri uri) {
        handleUri(uri);
      },
      onError: (err) {
        print("Erro ao escutar links: ${err.toString()}");
      },
    );
  }

  void handleUri(Uri uri) {
    String response = uri.queryParameters["response"] ?? '';
    if (response.isNotEmpty) {
      final converted = String.fromCharCodes(
        base64Decode(
          response.replaceAll("\n", ""),
        ),
      );

      print(converted);
      if (uri.queryParameters["responsecode"] != null) {
        onSuccess(PaymentCheckoutResponseSuccess.fromJson(converted));
        return;
      }
      onFailure(PaymentCheckoutResponse.fromJson(converted));
    }
  }
}
