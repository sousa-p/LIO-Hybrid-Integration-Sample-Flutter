import 'dart:convert';
import 'package:flutter_lio_integration/features/payment_checkout/model/payment.dart';


class PaymentCheckoutResponseSuccess {
  String? createdAt;
  String? id;
  List<Item>? items;
  String? notes;
  String? number;
  int? paidAmount;
  List<Payment>? payments;
  int? pendingAmount;
  int? price;
  String? reference;
  String? status;
  String? type;
  String? updatedAt;

  PaymentCheckoutResponseSuccess({
    this.createdAt,
    this.id,
    this.items,
    this.notes,
    this.number,
    this.paidAmount,
    this.payments,
    this.pendingAmount,
    this.price,
    this.reference,
    this.status,
    this.type,
    this.updatedAt,
  });

  factory PaymentCheckoutResponseSuccess.fromJson(String str) =>
      PaymentCheckoutResponseSuccess.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PaymentCheckoutResponseSuccess.fromMap(Map<String, dynamic> json) =>
      PaymentCheckoutResponseSuccess(
        createdAt: json["createdAt"],
        id: json["id"],
        items: json["items"] != null
            ? List<Item>.from(json["items"].map((x) => Item.fromMap(x!)))
            : null,
        notes: json["notes"],
        number: json["number"],
        paidAmount: json["paidAmount"],
        payments: json["payments"] == null
            ? null
            : List<Payment>.from(
                json["payments"].map((x) => Payment.fromMap(x))),
        pendingAmount:
            json["pendingAmount"],
        price: json["price"],
        reference: json["reference"],
        status: json["status"],
        type: json["type"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toMap() => {
        "createdAt": createdAt == null ? null : createdAt,
        "id": id == null ? null : id,
        "items": items != null
            ? List<dynamic>.from(items!.map((x) => x.toMap()))
            : null,
        "notes": notes == null ? null : notes,
        "number": number == null ? null : number,
        "paidAmount": paidAmount == null ? null : paidAmount,
        "payments": payments != null
            ? List<dynamic>.from(payments!.map((x) => x.toMap()))
            : null,
        "pendingAmount": pendingAmount == null ? null : pendingAmount,
        "price": price == null ? null : price,
        "reference": reference == null ? null : reference,
        "status": status == null ? null : status,
        "type": type == null ? null : type,
        "updatedAt": updatedAt == null ? null : updatedAt,
      };
}
class Item {
  String ?description;
  String ?details;
  String ?id;
  String ?name;
  int ?quantity;
  String ?reference;
  String ?sku;
  String ?unitOfMeasure;
  int ?unitPrice;

  Item({
    this.description,
    this.details,
    this.id,
    this.name,
    this.quantity,
    this.reference,
    this.sku,
    this.unitOfMeasure,
    this.unitPrice,
  });

  factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        description: json["description"],
        details: json["details"],
        id: json["id"],
        name: json["name"],
        quantity: json["quantity"],
        reference: json["reference"],
        sku: json["sku"],
        unitOfMeasure:
            json["unitOfMeasure"],
        unitPrice: json["unitPrice"],
      );

  Map<String, dynamic> toMap() => {
        "description": description,
        "details": details,
        "id": id,
        "name": name,
        "quantity": quantity,
        "reference": reference,
        "sku": sku,
        "unitOfMeasure": unitOfMeasure,
        "unitPrice": unitPrice,
      };
}