import 'package:bank__sha/blocs/auth/auth_bloc.dart';
import 'package:bank__sha/blocs/payment_method/payment_method_bloc.dart';
import 'package:bank__sha/models/payment_method_model.dart';
import 'package:bank__sha/models/topup_form_model.dart';
import 'package:bank__sha/shared/theme.dart';
import 'package:bank__sha/ui/pages/topup_amount_page.dart';
import 'package:bank__sha/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/topup_bank_item.dart';

class TopupPage extends StatefulWidget {
  const TopupPage({super.key});

  @override
  State<TopupPage> createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
  PaymentMethodModel? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Up'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Wallet',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semibold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthSuccess) {
                      return Row(
                        children: [
                          Image.asset(
                            'assets/img_wallet.png',
                            width: 80,
                            height: 55,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.user.cardNumber!.replaceAllMapped(
                                    RegExp(r".{4}"),
                                    (match) => "${match.group(0)} "),
                                style: blackTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: medium,
                                ),
                              ),
                              Text(
                                state.user.name.toString(),
                                style: greyTextStyle.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }
                    return Container();
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Select Bank',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semibold,
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                BlocProvider(
                  create: (context) =>
                      PaymentMethodBloc()..add(PaymentMethodGet()),
                  child: BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
                    builder: (context, state) {
                      if (state is PaymentMethodSuccess) {
                        return Column(
                          children: state.paymentMethods.map((paymentMethod) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedPaymentMethod = paymentMethod;
                                });
                              },
                              child: TopupBankItem(
                                paymentMethodModel: paymentMethod,
                                isSelected: paymentMethod.id ==
                                    selectedPaymentMethod?.id,
                              ),
                            );
                          }).toList(),
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: (selectedPaymentMethod != null)
          ? Container(
              margin: const EdgeInsets.all(24),
              child: CustomFilledButton(
                title: 'Continue',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TopupAmountPage(
                          data: TopupFormModel(
                            paymentMethodCode: selectedPaymentMethod?.code,
                          ),
                        ),
                      ));
                },
              ),
            )
          : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
