import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:livvy_app/pages/auth/log_in.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: OnBoardingSlider(
        headerBackgroundColor: Colors.white,
        finishButtonText: 'Register',
        finishButtonStyle: FinishButtonStyle(
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        onFinish: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LogInScreen()),
          );
        },
        skipTextButton: const Text('Skip'),
        trailing: const Text('Login'),
        controllerColor: Theme.of(context).colorScheme.primary,
        background: [
          Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: SvgPicture.asset('assets/svg/onboarding_1.svg',
                      height: 340),
                ),
              )),
          Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: SvgPicture.asset('assets/svg/onboarding_2.svg',
                      height: 340),
                ),
              )),
          Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: SvgPicture.asset('assets/svg/onboarding_3.svg',
                      height: 340),
                ),
              )),
        ],
        totalPage: 3,
        speed: 1.8,
        pageBodies: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 480,
                ),
                Text('KPR Mudah Anti Ribet', style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Theme.of(context).colorScheme.secondary)),
                const SizedBox(height: 10,),
                Text('LivPath memberikan Simulasi DP KPR yang akurat dan praktis!', style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 20)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 480,
                ),
                Text('Blockchain, Keamanan Terjamin', style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Theme.of(context).colorScheme.secondary)),
                const SizedBox(height: 10,),
                Text('Livvy menggunakan blockchain untuk menyimpan data pembayaran DP KPR mu', style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 20)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 480,
                ),
                Text('Urusan Bank, Biar Kami di Depan', style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Theme.of(context).colorScheme.secondary)),
                const SizedBox(height: 10,),
                Text('Livvy akan melakukan negosiasi dengan bank untuk mendapatkan yang terbaik', style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 20)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
