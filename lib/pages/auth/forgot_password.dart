import 'package:flutter/material.dart';
import 'package:livvy_app/components/button_component.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: const BackButton(color: Colors.white),
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
                  child: Text("Lupa Password?",
                      style: Theme.of(context).textTheme.displayLarge),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 8),
                  child: Text("Jangan khawatir, buat password baru, yuk.",
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
                      const SizedBox(height: 30),
                      const TextField(
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Masukkan No. Handphone",
                            prefixIcon: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "+62 ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                              ],
                            )),
                      ),
                      const SizedBox(height: 40),
                      ButtonComponent(
                        buttontext: "Reset Password",
                        onPressed: () {},
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
