import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:livvy_app/components/button_component.dart';
import 'package:livvy_app/pages/liv_path/liv_path_home_search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Image.asset('assets/img/logo_full.png', height: 40),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // * HEADER
            Container(
                color: Colors.white,
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      "Nilai Portfolio",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      "Rp200.000.000",
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Sisa Target",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              "RP 200.000.000",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.greenAccent),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Persentase",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              "50%",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.greenAccent),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                )),
            const SizedBox(height: 40),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/svg/onboarding_1.svg', height: 230),
                  Text("Cobain LivPath",
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: Theme.of(context).colorScheme.secondary)),
                  Text("Solusi DP-Mu, dari Livvy",
                      style: Theme.of(context).textTheme.displayMedium),

                  const SizedBox(height: 30,),
                  SizedBox(
                    width: 200,
                    child: ButtonComponent(
                        buttontext: "Coba Sekarang", onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LivPathHomeSearchScreen()),
                          );
                        }),
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
