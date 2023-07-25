import 'package:bank__sha/shared/theme.dart';
import 'package:bank__sha/ui/widgets/button.dart';
import 'package:flutter/material.dart';

class PinPage extends StatefulWidget {
  const PinPage({super.key});

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  final TextEditingController pinController = TextEditingController(text: '');

  addPin(String number) {
    if (pinController.text.length < 6) {
      setState(() {
        pinController.text = pinController.text + number;
      });
    }
    if (pinController.text == '123123') {
      Navigator.pop(context, true);
    }
  }

  deletPin() {
    if (pinController.text.isNotEmpty) {
      setState(() {
        pinController.text =
            pinController.text.substring(0, pinController.text.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 58,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sha PIN',
                style: whiteTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semibold,
                ),
              ),
              const SizedBox(
                height: 72,
              ),
              SizedBox(
                width: 200,
                child: TextFormField(
                  controller: pinController,
                  obscureText: true,
                  obscuringCharacter: '*',
                  cursorColor: greyColor,
                  enabled: false,
                  style: whiteTextStyle.copyWith(
                    fontSize: 36,
                    fontWeight: medium,
                    letterSpacing: 16,
                  ),
                  decoration: InputDecoration(
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
                      addPin('1');
                    },
                  ),
                  InputButtonPin(
                    number: '2',
                    onTap: () {
                      addPin('2');
                    },
                  ),
                  InputButtonPin(
                    number: '3',
                    onTap: () {
                      addPin('3');
                    },
                  ),
                  InputButtonPin(
                    number: '4',
                    onTap: () {
                      addPin('4');
                    },
                  ),
                  InputButtonPin(
                    number: '5',
                    onTap: () {
                      addPin('5');
                    },
                  ),
                  InputButtonPin(
                    number: '6',
                    onTap: () {
                      addPin('6');
                    },
                  ),
                  InputButtonPin(
                    number: '7',
                    onTap: () {
                      addPin('7');
                    },
                  ),
                  InputButtonPin(
                    number: '8',
                    onTap: () {
                      addPin('8');
                    },
                  ),
                  InputButtonPin(
                    number: '9',
                    onTap: () {
                      addPin('9');
                    },
                  ),
                  const SizedBox(
                    width: 60,
                    height: 60,
                  ),
                  InputButtonPin(
                    number: '0',
                    onTap: () {
                      addPin('0');
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      deletPin();
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
        ),
      ),
    );
  }
}
