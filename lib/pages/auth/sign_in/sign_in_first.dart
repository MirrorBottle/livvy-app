import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:livvy_app/components/button_component.dart';
import 'package:livvy_app/models/samarinda.dart';
import 'package:livvy_app/pages/auth/log_in.dart';
import 'package:livvy_app/pages/auth/sign_in/sign_in_second.dart';
import 'package:pinput/pinput.dart';
import 'package:unicons/unicons.dart';

class SignInFirstScreen extends StatefulWidget {
  const SignInFirstScreen({super.key});

  @override
  State<SignInFirstScreen> createState() => _SignInFirstScreenState();
}

class _SignInFirstScreenState extends State<SignInFirstScreen> {
  bool _isOtp = false;
  bool showError = false;
  List<String> _districts = [];
  final controller = TextEditingController();
  final focusNode = FocusNode();
  final _dio = Dio();
  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  void _handleComplete() async {
    EasyLoading.show(
        status: 'Mohon Ditunggu', maskType: EasyLoadingMaskType.black);
    Response response = await _dio.get(
        'http://api.samarindakota.go.id/api/v2/generate/data-monografi/monografi-kecamatan',
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization":
              "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjBjZTJhNWRmY2IzY2Q1YzU0Nzk3NjkxZGE0MjJiZGI0MTE0NmZlYWI1NmE1MWQ1MTlhNGUyZGVkMjU4M2YyZWNkMWJkMjhiN2VmOGEwNWQ5In0.eyJhdWQiOiIzIiwianRpIjoiMGNlMmE1ZGZjYjNjZDVjNTQ3OTc2OTFkYTQyMmJkYjQxMTQ2ZmVhYjU2YTUxZDUxOWE0ZTJkZWQyNTgzZjJlY2QxYmQyOGI3ZWY4YTA1ZDkiLCJpYXQiOjE2OTYzMzM0OTQsIm5iZiI6MTY5NjMzMzQ5NCwiZXhwIjoxNzI3OTU1ODk0LCJzdWIiOiI3NDMiLCJzY29wZXMiOlsibW9ub2dyYWZpLWtlY2FtYXRhbiIsIm1vbm9ncmFmaS1rZWx1cmFoYW4iLCJwdXNrZXNtYXMiLCJ0ZW1wYXQtaWJhZGFoIiwicGVydXNhaGFhbi1qYXNhIiwic2FyYW5hLW9sYWhyYWdhIiwib3JnYW5pc2FzaSJdfQ.lxl_oxv-PsbNoSvfH5Hy8spigTPL3arG12vFyjuEyPDjULw2syawYCUk8sce_veW5R4d_30ix8h_ue7qg2whWNcOgO4gJb_p5jc0SEa6RF0lawuKCbuNMtGpKLaC7kdbBzURCjK3zMkcC8wQhZAQQVcZHIG_f0TPB7GCsskjcHGtZCBkuMB691VFYgSTCDLdIsnDozxmGASwl13iP7JO_xo7ZpomL6tKJFFVkzqblYPRPNUlmbAjjD3EOIxmHQpdgMBJB8XTDDkenvfWN7aHHsXVB0hp9Ny-J0hVhUU8accuKDvKCWarfElnGJrDjALXYomN4H58S94vvLQ5AffVwnXiMiUJ8wdZygWvcXOd-bPBsHzZknK99HoVJ00bjpAstBpwa8g7UUHEcvkEm4afeB0JKk3QB2AtpDUo6q2oin6odH_Z-_6OWFRUtBSzrjyt1bOiOoxbSOY4JVPsj-Wmt5z7-_08CxFqkZNtk2qaFtkRo5ZybPU5KUTWuBj334vOUzA9rSwmfmSZYAHjhSe9YYXwvSLvzxqq_dJGQoexYLe8xqCu1AW69WdetPgcWSq7iP8kffcU1bipeUFV_qyfILTj5aBoD9tcokxj1vngrutzo2g-gkAO53GJ-pvZ0W6kr7mjIDJW2jmdkAmIyR_vegdgji6HLeMnFPYb_dEadlM",
        }));
    List<Subdistrict> districtData =
        (response.data as List).map((x) => Subdistrict.fromJson(x)).toList();
    setState(() {
      _districts = districtData.map((d) => d.name).toList();
    });
    EasyLoading.dismiss();
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SignInSecondScreen(
                districts: districtData.map((d) => d.name).toList(),
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    const length = 4;
    const errorColor = Color.fromRGBO(255, 234, 238, 1);
    const fillColor = Color.fromRGBO(222, 231, 240, .57);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: GoogleFonts.poppins(
        fontSize: 22,
        color: const Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8),
        border:
            Border.all(color: Theme.of(context).colorScheme.primary, width: 3),
      ),
    );

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
              "Step 1/2",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
            ),
          )
        ],
        leading: BackButton(
            color: Colors.white,
            onPressed: () {
              if (_isOtp) {
                setState(() {
                  _isOtp = !_isOtp;
                });
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LogInScreen()),
                );
              }
            }),
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
                  child: Text("Daftar",
                      style: Theme.of(context).textTheme.displayLarge),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 8),
                  child: Text("Ayo bergabung dengan livvy!",
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
                  if (_isOtp) ...[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(UniconsLine.phone),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Data Diri",
                              style: Theme.of(context).textTheme.displayMedium,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Kami telah mengirimkan 4-digit kode OTP",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Row(
                              children: [
                                Text(
                                  "ke no. HP Anda",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                Text(
                                  "+6282353165184",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 30),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 40),
                            child: Pinput(
                              length: length,
                              controller: controller,
                              focusNode: focusNode,
                              defaultPinTheme: defaultPinTheme,
                              onCompleted: (pin) {
                                _handleComplete();
                              },
                              focusedPinTheme: defaultPinTheme.copyWith(
                                height: 68,
                                width: 64,
                                decoration:
                                    defaultPinTheme.decoration!.copyWith(
                                  border: Border.all(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      width: 3),
                                ),
                              ),
                              errorPinTheme: defaultPinTheme.copyWith(
                                decoration: BoxDecoration(
                                  color: errorColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ] else ...[
                    Column(
                      children: [
                        const SizedBox(height: 30),
                        const TextField(
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
                        const SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                              hintText: "Email aktifmu",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        const SizedBox(height: 40),
                        ButtonComponent(
                          buttontext: "Daftar",
                          onPressed: () {
                            setState(() {
                              _isOtp = true;
                            });
                          },
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Sudah Punya Akun?",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              child: Text("Masuk disini!",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          fontWeight: FontWeight.w900,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary)),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LogInScreen()),
                                );
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ]
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
