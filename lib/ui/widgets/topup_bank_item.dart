import 'package:bank__sha/models/payment_method_model.dart';
import 'package:bank__sha/shared/theme.dart';
import 'package:flutter/material.dart';

class TopupBankItem extends StatelessWidget {
  // final String iconUrl;
  // final String nameBank;
  // final String duration;
  final PaymentMethodModel paymentMethodModel;
  final bool isSelected;

  const TopupBankItem({
    super.key,
    // required this.iconUrl,
    // required this.nameBank,
    // required this.duration,
    required this.paymentMethodModel,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 87,
      margin: const EdgeInsets.only(
        bottom: 18,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: whiteColor,
          border: Border.all(
            width: 2,
            color: isSelected ? blueColor : whiteColor,
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              paymentMethodModel.thumbnail.toString(),
              width: 96,
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  paymentMethodModel.name.toString(),
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                Text(
                  "50 mins",
                  style: greyTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
