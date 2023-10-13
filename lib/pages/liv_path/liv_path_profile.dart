import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:livvy_app/components/button_component.dart';
import 'package:livvy_app/components/input_picker_component.dart';
import 'package:livvy_app/pages/home/main.dart';
import 'package:livvy_app/pages/liv_path/liv_path_breakdown.dart';

class LivPathProfileScreen extends StatefulWidget {
  const LivPathProfileScreen({super.key});

  @override
  State<LivPathProfileScreen> createState() =>
      _LivPathProfileScreenState();
}

class _LivPathProfileScreenState extends State<LivPathProfileScreen> {
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
                "Livvy Pengen Tahu, deh",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                "Bantu Livvy Buat Kenal Kamu!",
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Pekerjaan",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: 10,
              ),
              InputPickerComponent(items: const [
                'Karyawan',
                'Profesional',
                'Wirausaha',
                'Lainnya',
              ], title: "Pilih Pekerjaan"),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Usia",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: 10,
              ),
              InputPickerComponent(items: const [
                '25-30 Tahun',
                '31-35 Tahun',
                '36-40 Tahun',
              ], title: "Pilih Usia"),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Status",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: 10,
              ),
              InputPickerComponent(items: const [
                'Lajang',
                'Menikah',
              ], title: "Pilih Status"),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Penghasilan Bulanan",
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
                ).format('8000000'),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Nama lengkap sesuai KTP",
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ButtonComponent(
                buttontext: "Simulasi DP",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LivPathBreakdownScreen()),
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
