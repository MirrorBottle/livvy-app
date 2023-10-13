import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:livvy_app/components/button_component.dart';
import 'package:livvy_app/components/input_picker_component.dart';
import 'package:livvy_app/global.dart';
import 'package:livvy_app/pages/home/main.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LivPathBreakdownScreen extends StatefulWidget {
  const LivPathBreakdownScreen({super.key});

  @override
  State<LivPathBreakdownScreen> createState() => _LivPathBreakdownScreenState();
}

class _LivPathBreakdownScreenState extends State<LivPathBreakdownScreen> {
  int _amount = 100000000;
  int _salary = 8000000;
  int _payment = 0;
  int _total = 0;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(top: 20),
          child:
              Text("LivPath", style: Theme.of(context).textTheme.displayMedium),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Dah cakep, nih",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                "Cek Simulasi DP Keren-mu",
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(left: 12, right: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          "https://source.unsplash.com/random/?house&1",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 15,
                      bottom: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          CurrencyFormat.convertToIdr(_amount, 2),
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Jl. Pahlawan No. 10, Samarinda, Kalimantan Timur, Indonesia",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Text(
                "Persentase DP",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _percentageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Persentase DP",
                  // Here is key idea
                  suffix: Text("%"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                leading: Text("Penghasilan Bulanan",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 16)),
                trailing: Text(CurrencyFormat.convertToIdr(_salary, 2),
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 16)),
              ),
              ListTile(
                leading: Text("Total DP",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 20)),
                trailing: Text(CurrencyFormat.convertToIdr(_total, 2),
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 20, color: Colors.lightGreen)),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Row(
                  children: [
                    Text(CurrencyFormat.convertToIdr(_payment, 2),
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 28)),
                    Text(
                      " / bulan",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ButtonComponent(
                buttontext: "Konfirmasi Simulasi!",
                onPressed: () {
                  showTopSnackBar(
                    Overlay.of(context),
                    const CustomSnackBar.success(
                      message: "Simulasi DP KPR mu ready!",
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MainScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
