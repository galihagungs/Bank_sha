import 'package:bank__sha/models/transaction_mode.dart';
import 'package:bank__sha/shared/shared_method.dart';
import 'package:bank__sha/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeLatestTransactionItem extends StatelessWidget {
  // final String iconUrl;
  // final String title;
  // final String time;
  // final String value;
  final TransactionModel transaction;

  const HomeLatestTransactionItem({
    super.key,
    // required this.iconUrl,
    // required this.title,
    // required this.time,
    // required this.value,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 18,
      ),
      child: Row(
        children: [
          // Image.network(
          //   transaction.transactionTypeModel!.thumbnail!,
          //   width: 48,
          //   height: 48,
          // ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.transactionTypeModel!.name.toString(),
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  dateToMonthDate(
                    DateTime.parse(
                      transaction.createdAt!.toString(),
                    ),
                  ),
                  style: greyTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            formatCurrency(
              transaction.amount ?? 0,
              symbol: transaction.transactionTypeModel!.action == 'cr'
                  ? '+ '
                  : '- ',
            ),
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ],
      ),
    );
  }
}
