import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:livvy_app/components/button_component.dart';
import 'package:livvy_app/components/input_picker_component.dart';
import 'package:livvy_app/pages/home/main.dart';
import 'package:livvy_app/pages/liv_path/liv_path_home_result.dart';

class LivPathHomeSearchScreen extends StatefulWidget {
  const LivPathHomeSearchScreen({super.key});

  @override
  State<LivPathHomeSearchScreen> createState() =>
      _LivPathHomeSearchScreenState();
}

class _LivPathHomeSearchScreenState extends State<LivPathHomeSearchScreen> {
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
                "Dengan LivPath",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                "Cari Rumah Impianmu!",
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Kecamatan",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: 10,
              ),
              InputPickerComponent(items: const [
                'Samarinda Ilir',
                'Palaran',
                'Loa Janan Ilir',
                'Samarinda Kota',
                'Samarinda Seberang',
              ], title: "Pilih Kecamatan"),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Total Kamar",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: 10,
              ),
              InputPickerComponent(items: const [
                '2',
                '3',
                '4',
                '5',
                '6',
              ], title: "Pilih Total Kamar"),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Harga Minimal",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                inputFormatters: [
                  CurrencyTextInputFormatter(
                    locale: 'id',
                    decimalDigits: 0,
                    symbol: 'Rp. ',
                  )
                ],
                initialValue: CurrencyTextInputFormatter(
                  locale: 'id',
                  decimalDigits: 0,
                  symbol: 'Rp. ',
                ).format('100000000'),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Nama lengkap sesuai KTP",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Harga Maksimal",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                inputFormatters: [
                  CurrencyTextInputFormatter(
                    locale: 'id',
                    decimalDigits: 0,
                    symbol: 'Rp. ',
                  )
                ],
                initialValue: CurrencyTextInputFormatter(
                  locale: 'id',
                  decimalDigits: 0,
                  symbol: 'Rp. ',
                ).format('300000000'),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Nama lengkap sesuai KTP",
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ButtonComponent(
                buttontext: "Mulai LivPath!",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LivPathHomeResultScreen()),
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
