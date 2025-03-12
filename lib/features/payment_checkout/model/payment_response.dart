import 'dart:convert';
import 'order.dart';

class PaymentCheckoutResponse {
  int? code;
  Order? order;
  String? reason;

  PaymentCheckoutResponse({
    this.code,
    this.order,
    this.reason,
  });

  factory PaymentCheckoutResponse.fromJson(String str) =>
      PaymentCheckoutResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PaymentCheckoutResponse.fromMap(Map<String, dynamic> json) =>
      PaymentCheckoutResponse(
        code: json["code"],
        order: (json["order"] != null) ? Order.fromMap(json["order"]) : null,
        reason: json["reason"],
      );

  Map<String, dynamic> toMap() => {
        "code": code == null ? null : code,
        "order": (order != null) ? order!.toMap() : {},
        "reason": reason == null ? null : reason,
      };
}
