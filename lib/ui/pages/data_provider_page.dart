import 'package:bank__sha/blocs/operator_card/operator_card_bloc.dart';
import 'package:bank__sha/models/operator_card_model.dart';
import 'package:bank__sha/shared/shared_method.dart';
import 'package:bank__sha/shared/theme.dart';
import 'package:bank__sha/ui/pages/data_package_page.dart';
import 'package:bank__sha/ui/widgets/button.dart';
import 'package:bank__sha/ui/widgets/data_provider_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';

class DataProviderPage extends StatefulWidget {
  const DataProviderPage({super.key});

  @override
  State<DataProviderPage> createState() => _DataProviderPageState();
}

class _DataProviderPageState extends State<DataProviderPage> {
  OperatorCardModel? selectedOperatorCard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beli Data'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              'From Wallet',
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
                            // 'Balance: ${formatCurrency(num.parse(state.user.balance.toString()))}',
                            'Balance: ${formatCurrency(state.user.balance ?? 0)}',
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
              'Select Provider',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semibold,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            BlocProvider(
              create: (context) => OperatorCardBloc()..add(OperatorCardGet()),
              child: BlocBuilder<OperatorCardBloc, OperatorCardState>(
                builder: (context, state) {
                  if (state is OperatorCardSuccess) {
                    return Column(
                      children: state.operatorCards.map((operatorCard) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedOperatorCard = operatorCard;
                            });
                          },
                          child: DataProviderItem(
                            data: operatorCard,
                            isSelected:
                                operatorCard.id == selectedOperatorCard?.id,
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
          ],
        ),
      ),
      floatingActionButton: (selectedOperatorCard != null)
          ? Container(
              margin: const EdgeInsets.all(24),
              child: CustomFilledButton(
                title: 'Continue',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DataPackagePage(
                            operatorCard: selectedOperatorCard!),
                      ));
                },
              ),
            )
          : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
