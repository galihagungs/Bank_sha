import 'dart:convert';

import 'package:bank__sha/models/payment_method_model.dart';
import 'package:bank__sha/services/auth_service.dart';
import 'package:bank__sha/shared/shared_value.dart';
import 'package:http/http.dart' as http;

class PaymentMethodService {
  Future<List<PaymentMethodModel>> getPaymentMethod() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/payment_methods'),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        return List<PaymentMethodModel>.from(jsonDecode(res.body).map(
                (paymentMethod) => PaymentMethodModel.fomJson(paymentMethod)))
            .toList();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
