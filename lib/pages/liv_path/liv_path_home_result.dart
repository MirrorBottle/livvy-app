import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:livvy_app/components/button_component.dart';
import 'package:livvy_app/components/input_picker_component.dart';
import 'package:livvy_app/pages/home/main.dart';
import 'package:livvy_app/pages/liv_path/liv_path_profile.dart';

class LivPathHomeResultScreen extends StatefulWidget {
  const LivPathHomeResultScreen({super.key});

  @override
  State<LivPathHomeResultScreen> createState() =>
      _LivPathHomeResultScreenState();
}

class _LivPathHomeResultScreenState extends State<LivPathHomeResultScreen> {
  final filterArray = [
    ">100.000.000",
    "<300.000.000",
    "2 Kamar",
  ];
  final List<Map> houseList = [
    {
      "id": 1,
      "amount": "102.000.000",
      "address": "Jl. Pahlawan No. 10, Samarinda, Kalimantan Timur, Indonesia",
      "bedrooms": 2,
      "image": "https://source.unsplash.com/random/?house&1"
    },
    {
      "id": 2,
      "amount": "104.000.000",
      "address": "Jl. A. Yani No. 5, Samarinda, Kalimantan Timur, Indonesia",
      "bedrooms": 2,
      "image": "https://source.unsplash.com/random/?house&2"
    },
    {
      "id": 3,
      "amount": "106.000.000",
      "address": "Jl. S. Parman No. 3, Samarinda, Kalimantan Timur, Indonesia",
      "bedrooms": 2,
      "image": "https://source.unsplash.com/random/?house&3"
    },
    {
      "id": 4,
      "amount": "108.000.000",
      "address":
          "Jl. Gatot Subroto No. 8, Samarinda, Kalimantan Timur, Indonesia",
      "bedrooms": 2,
      "image": "https://source.unsplash.com/random/?house&4"
    },
    {
      "id": 5,
      "amount": "110.000.000",
      "address":
          "Jl. M. H. Thamrin No. 15, Samarinda, Kalimantan Timur, Indonesia",
      "bedrooms": 2,
      "image": "https://source.unsplash.com/random/?house&5"
    },
    {
      "id": 6,
      "amount": "112.000.000",
      "address":
          "Jl. Imam Bonjol No. 12, Samarinda, Kalimantan Timur, Indonesia",
      "bedrooms": 2,
      "image": "https://source.unsplash.com/random/?house&6"
    },
    {
      "id": 7,
      "amount": "114.000.000",
      "address":
          "Jl. P. Diponegoro No. 7, Samarinda, Kalimantan Timur, Indonesia",
      "bedrooms": 2,
      "image": "https://source.unsplash.com/random/?house&7"
    },
    {
      "id": 8,
      "amount": "116.000.000",
      "address": "Jl. G. Merdeka No. 9, Samarinda, Kalimantan Timur, Indonesia",
      "bedrooms": 2,
      "image": "https://source.unsplash.com/random/?house&8"
    },
    {
      "id": 9,
      "amount": "118.000.000",
      "address":
          "Jl. Jend. Sudirman No. 11, Samarinda, Kalimantan Timur, Indonesia",
      "bedrooms": 2,
      "image": "https://source.unsplash.com/random/?house&9"
    },
    {
      "id": 10,
      "amount": "120.000.000",
      "address": "Jl. Antasari No. 14, Samarinda, Kalimantan Timur, Indonesia",
      "bedrooms": 2,
      "image": "https://source.unsplash.com/random/?house&10"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child:
              Text("LivPath", style: Theme.of(context).textTheme.displayMedium),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Kecamatan",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                "Samarinda Ilir",
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                child: ListView.builder(
                  shrinkWrap: false,
                  scrollDirection: Axis.horizontal,
                  itemCount: filterArray.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                            ),
                            child: Text(
                              filterArray[index],
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: List.generate(
                  houseList.length,
                  (index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LivPathProfileScreen()),
                            );
                          },
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(left: 12, right: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  houseList[index]['image'],
                                ),
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
                                "Rp." + houseList[index]['amount'],
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                houseList[index]['address'],
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
