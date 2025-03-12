import 'dart:convert';
import 'package:flutter_lio_integration/auth/lio_deeplink_constants.dart';
import 'package:flutter_lio_integration/features/payment_checkout/model/payment_type.dart';
import 'package:flutter_lio_integration/features/products/model/product.dart';

class PaymentRequest {
  String? accessToken;
  String? clientId;
  dynamic email;
  int? installments;
  List<Item>? items;
  String? merchantCode;
  String? paymentCode;
  int? value;

  PaymentRequest({
    this.accessToken,
    this.clientId,
    this.email,
    this.installments,
    this.items,
    this.merchantCode,
    this.paymentCode,
    this.value,
  });

  factory PaymentRequest.fromJson(String str) =>
      PaymentRequest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PaymentRequest.fromMap(Map<String, dynamic> json) => PaymentRequest(
        accessToken: json["accessToken"],
        clientId: json["clientID"],
        email: json["email"],
        installments: json["installments"],
        merchantCode: json["merchantCode"],
        paymentCode: json["paymentCode"],
        value: json["value"],
        items: json["items"] != null
            ? List<Item>.from(json["items"].map((x) => Item.fromMap(x)))
            : null,
      );

  Map<String, dynamic> toMap() => {
        "accessToken": accessToken,
        "clientID": clientId,
        "email": email,
        "installments": installments,
        "merchantCode": merchantCode,
        "paymentCode": paymentCode,
        "value": value,
        "items": items != null
            ? List<dynamic>.from(items!.map((x) => x.toMap()))
            : null,
      };

  String toBase64Encode() => base64Encode(utf8.encode(toJson()));

  static PaymentRequest makeOrder(PaymentType paymentType, Product product) {
    return PaymentRequest(
        accessToken: LioDeepLinkConstants.accessToken,
        clientId: LioDeepLinkConstants.clientId,
        email: "defina_email@gmail.com",
        installments: 0,
        merchantCode: "",
        paymentCode: paymentType == PaymentType.creditoAVista
            ? "creditoAVista"
            : "debitoAVista",
        items: makeItem(product),
        value: product.unitPrice);
  }

  static List<Item> makeItem(Product product) {
    return [
      Item(
          name: product.name,
          quantity: product.quantity,
          sku: product.sku,
          unitOfMeasure: product.unitOfMeasure,
          unitPrice: product.unitPrice)
    ];
  }
}

class Item {
  String? name;
  int? quantity;
  String? sku;
  String? unitOfMeasure;
  int? unitPrice;

  Item({
    this.name,
    this.quantity,
    this.sku,
    this.unitOfMeasure,
    this.unitPrice,
  });

  factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        name: json["name"],
        quantity: json["quantity"],
        sku: json["sku"],
        unitOfMeasure: json["unitOfMeasure"],
        unitPrice: json["unitPrice"],
      );

  Map<String, dynamic> toMap() => {
        "name": name == null ? null : name,
        "quantity": quantity == null ? null : quantity,
        "sku": sku == null ? null : sku,
        "unitOfMeasure": unitOfMeasure == null ? null : unitOfMeasure,
        "unitPrice": unitPrice == null ? null : unitPrice,
      };
}
