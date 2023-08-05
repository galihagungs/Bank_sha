// ignore_for_file: use_build_context_synchronously

import 'package:bank__sha/blocs/auth/auth_bloc.dart';
import 'package:bank__sha/blocs/topup/topup_bloc.dart';
import 'package:bank__sha/shared/shared_method.dart';
import 'package:bank__sha/shared/theme.dart';
import 'package:bank__sha/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/topup_form_model.dart';

class TopupAmountPage extends StatefulWidget {
  final TopupFormModel data;

  const TopupAmountPage({super.key, required this.data});

  @override
  State<TopupAmountPage> createState() => _TopupAmountPageState();
}

class _TopupAmountPageState extends State<TopupAmountPage> {
  final TextEditingController amountController =
      TextEditingController(text: '0');

  @override
  void initState() {
    super.initState();
    amountController.addListener(() {
      final text = amountController.text;
      amountController.value = amountController.value.copyWith(
        text: NumberFormat.currency(
          locale: 'id',
          decimalDigits: 0,
          symbol: '',
        ).format(
          int.parse(text.replaceAll('.', '')),
        ),
      );
    });
  }

  addAmount(String number) {
    if (amountController.text == '0') {
      amountController.text = '';
    }
    setState(() {
      amountController.text = amountController.text + number;
    });
  }

  deleteAmount() {
    if (amountController.text.isNotEmpty) {
      setState(() {
        amountController.text = amountController.text
            .substring(0, amountController.text.length - 1);
        if (amountController.text == '') {
          amountController.text = '0';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: BlocProvider(
        create: (context) => TopupBloc(),
        child: BlocConsumer<TopupBloc, TopupState>(
          listener: (context, state) async {
            if (state is TopupFailed) {
              showCustomSnackbar(context, state.e);
            }

            if (state is TopupSuccess) {
              Uri url = Uri.parse(state.redirectUrl);
              await launchUrl(
                url,
              );

              context.read<AuthBloc>().add(
                    AuthUpdateBalance(
                      int.parse(
                        amountController.text.replaceAll('.', ''),
                      ),
                    ),
                  );

              Navigator.pushNamedAndRemoveUntil(
                context,
                '/topup-success',
                (route) => false,
              );
            }
          },
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 58,
              ),
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 36,
                    ),
                    Center(
                      child: Text(
                        'Total Amount',
                        style: whiteTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: semibold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 67,
                    ),
                    Align(
                      child: SizedBox(
                        width: 250,
                        child: TextFormField(
                          controller: amountController,
                          cursorColor: greyColor,
                          enabled: false,
                          style: whiteTextStyle.copyWith(
                            fontSize: 36,
                            fontWeight: medium,
                          ),
                          decoration: InputDecoration(
                            prefixIcon: Text(
                              'Rp. ',
                              style: whiteTextStyle.copyWith(
                                fontSize: 36,
                                fontWeight: medium,
                              ),
                            ),
                            disabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: greyColor,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: greyColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 66,
                    ),
                    Wrap(
                      spacing: 40,
                      runSpacing: 40,
                      children: [
                        InputButtonPin(
                          number: '1',
                          onTap: () {
                            addAmount('1');
                          },
                        ),
                        InputButtonPin(
                          number: '2',
                          onTap: () {
                            addAmount('2');
                          },
                        ),
                        InputButtonPin(
                          number: '3',
                          onTap: () {
                            addAmount('3');
                          },
                        ),
                        InputButtonPin(
                          number: '4',
                          onTap: () {
                            addAmount('4');
                          },
                        ),
                        InputButtonPin(
                          number: '5',
                          onTap: () {
                            addAmount('5');
                          },
                        ),
                        InputButtonPin(
                          number: '6',
                          onTap: () {
                            addAmount('6');
                          },
                        ),
                        InputButtonPin(
                          number: '7',
                          onTap: () {
                            addAmount('7');
                          },
                        ),
                        InputButtonPin(
                          number: '8',
                          onTap: () {
                            addAmount('8');
                          },
                        ),
                        InputButtonPin(
                          number: '9',
                          onTap: () {
                            addAmount('9');
                          },
                        ),
                        const SizedBox(
                          width: 60,
                          height: 60,
                        ),
                        InputButtonPin(
                          number: '0',
                          onTap: () {
                            addAmount('0');
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            deleteAmount();
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: numberBackgroundColor,
                            ),
                            child: Center(
                                child: Icon(
                              Icons.arrow_back,
                              color: whiteColor,
                              size: 24,
                            )),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomFilledButton(
                  title: 'Checkout Now',
                  onPressed: () async {
                    if (await Navigator.pushNamed(context, '/pin') == true) {
                      final authState = context.read<AuthBloc>().state;

                      String pin = '';
                      if (authState is AuthSuccess) {
                        pin = authState.user.pin!;
                      }

                      context.read<TopupBloc>().add(
                            TopupPost(
                              widget.data.copyWith(
                                pin: pin,
                                amount:
                                    amountController.text.replaceAll('.', ''),
                              ),
                            ),
                          );
                    }
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextButton(
                  title: 'Terms & Conditions',
                  onPressed: () {},
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
