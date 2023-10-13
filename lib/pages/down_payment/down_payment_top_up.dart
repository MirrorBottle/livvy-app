import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:livvy_app/components/button_component.dart';
import 'package:livvy_app/components/input_picker_component.dart';
import 'package:livvy_app/global.dart';
import 'package:livvy_app/pages/home/main.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

class DownPaymentTopUpScreen extends StatefulWidget {
  const DownPaymentTopUpScreen({super.key});

  @override
  State<DownPaymentTopUpScreen> createState() => _DownPaymentTopUpScreenState();
}

class _DownPaymentTopUpScreenState extends State<DownPaymentTopUpScreen> {
  int _amount = 100000000;
  int _salary = 8000000;
  int _payment = 0;
  int _total = 0;
  final dio = Dio();
  final uuid = const Uuid();

  TextEditingController _percentageController = TextEditingController();

  @override
  void initState() {
    int total = _amount * 40 ~/ 100;
    setState(() {
      _percentageController.text = "40";
      _total = total;
      _payment = (_salary * 30 ~/ 100).toInt();
    });
  }

  _handleTopUp() async {
    try {
      final response = await dio.post(
        'http://10.0.2.2:3000/add',
        data: {
          'transactionNumber': '2',
          'amount': _payment.toString(),
          'userId': uuid.v4(),
          'balance': _payment.toString(),
          'status': '1'
        },
      );
    } catch (e) {
      print(e.toString());
    }
    showTopSnackBar(
      // ignore: use_build_context_synchronously
      Overlay.of(context),
      const CustomSnackBar.success(
        message: "Semakin dekat dengan impianmu, nih!",
      ),
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MainScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text("Down Payment",
              style: Theme.of(context).textTheme.displayMedium),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "DP #828303",
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 32),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(CurrencyFormat.convertToIdr(_payment, 2),
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 22)),
                    Text(
                      " / bulan",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                leading: Text("Harga Properti",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 16)),
                trailing: Text(CurrencyFormat.convertToIdr(_amount, 2),
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 16)),
              ),
              ListTile(
                leading: Text("Target DP",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 16)),
                trailing: Text(CurrencyFormat.convertToIdr(_total, 2),
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 16)),
              ),
              ListTile(
                leading: Text("DP Terkumpul",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 16)),
                trailing: Text(CurrencyFormat.convertToIdr(0, 2),
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 16)),
              ),
              ListTile(
                leading: Text("Sisa Bulan",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 16)),
                trailing: Text("16 Bulan",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 16)),
              ),
              const SizedBox(
                height: 50,
              ),
              ButtonComponent(
                buttontext: "Top Up",
                onPressed: () {
                  _handleTopUp();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
