import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:livvy_app/components/button_component.dart';
import 'package:livvy_app/components/input_password_component.dart';
import 'package:livvy_app/pages/auth/forgot_password.dart';
import 'package:livvy_app/pages/auth/sign_in/sign_in_first.dart';
import 'package:livvy_app/pages/home/main.dart';
import 'package:nb_utils/nb_utils.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> user = {
      "name": "Bayu Setiawan",
      "subdistrict": "Samarinda Ilir",
      "phone_number": "82353165184",
      "email": "setiawanbayu66152@gmail.com",
      "status": "Menikah",
      "age": 20,
      "income": 0,
      "job": "Karyawan"
    };

    Map<String, dynamic> downPayment = {
      "property_name": "",
      "property_address": "",
      "subdistrict": "",
      "balance": 0,
      "target": 0,
      "total_value": 0,
      "dp_percentage": 0,
      "monthly_payment": 0,
      "bank": "",
      "kpr_name": "",
      "kpr_tenor": "",
      "kpr_rate": 0
    };

    String userEncoded = json.encode(user);
    String downPaymentEncoded = json.encode(downPayment);
    prefs.setString('user', userEncoded);
    prefs.setString('down_payment', downPaymentEncoded);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("Masuk",
                      style: Theme.of(context).textTheme.displayLarge),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 8),
                  child: Text("Sudah menjadi member livvy?",
                      style: Theme.of(context).textTheme.displaySmall),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 220),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.only(topRight: Radius.circular(60.0)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 30),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Masukkan No. Handphone",
                            prefixIcon: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 5),
                                Text(
                                  "+62 ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      const SizedBox(height: 20),
                      InputPasswordComponent(
                        hintText: 'Password Akun livvy',
                      ),
                      const SizedBox(height: 40),
                      ButtonComponent(
                        buttontext: "Masuk",
                        onPressed: () {
                          Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MainScreen()),
                              );
                        },
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Belum Punya Akun?",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            child: Text("Daftar disini!",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        fontWeight: FontWeight.w900,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary)),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignInFirstScreen()),
                              );
                            },
                          )
                        ],
                      )
                    ],
                  ),
                  GestureDetector(
                    child: Text("Lupa Password?",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgotPasswordScreen()),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
