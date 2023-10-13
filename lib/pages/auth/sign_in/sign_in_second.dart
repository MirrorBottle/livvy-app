import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:livvy_app/components/button_component.dart';
import 'package:livvy_app/components/input_password_component.dart';
import 'package:livvy_app/components/input_picker_component.dart';
import 'package:livvy_app/models/samarinda.dart';
import 'package:livvy_app/pages/auth/log_in.dart';
import 'package:livvy_app/pages/home/main.dart';
import 'package:pinput/pinput.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:unicons/unicons.dart';

class SignInSecondScreen extends StatefulWidget {
  List<String> districts;
  SignInSecondScreen({super.key, required this.districts});

  @override
  State<SignInSecondScreen> createState() => _SignInSecondScreenState();
}

class _SignInSecondScreenState extends State<SignInSecondScreen> {
  bool _isOtp = false;
  bool showError = false;
  final controller = TextEditingController();
  final _dio = Dio();
  final focusNode = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    print(widget.districts.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Text(
              "Step 2/2",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
            ),
          )
        ],
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
                  child: Text("Tentangmu",
                      style: Theme.of(context).textTheme.displayLarge),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 8),
                  child: Text("Livvy pengen tau lebih tentangmu, nih!",
                      style: Theme.of(context).textTheme.displaySmall),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 190),
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
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(
                            UniconsLine.user,
                            size: 24,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Data Diri",
                            style: Theme.of(context).textTheme.displayMedium,
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      const TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Nama lengkap sesuai KTP",
                        ),
                      ),
                      const SizedBox(height: 20),
                      InputPickerComponent(
                          items: widget.districts, title: "Kecamatan"),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Icon(
                            UniconsLine.lock,
                            size: 24,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Keamanan Akun",
                            style: Theme.of(context).textTheme.displayMedium,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InputPasswordComponent(
                        hintText: 'Buat passwordmu dulu',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InputPasswordComponent(
                        hintText: 'Ulangi passwordmu biar yakin',
                      ),
                      const SizedBox(height: 40),
                      ButtonComponent(
                        buttontext: "Buat Akun",
                        onPressed: () {
                          showTopSnackBar(
                            Overlay.of(context),
                            const CustomSnackBar.success(
                              message: "Selamat Datang, member Livvy",
                            ),
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainScreen()),
                          );
                        },
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
