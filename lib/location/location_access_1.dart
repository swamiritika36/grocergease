import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/primary_btn.dart';

import 'package:flutter_application_1/components/textfleld_srch.dart';
import 'package:flutter_application_1/constants.dart/colors.dart';
import 'package:flutter_application_1/constants.dart/images.dart';
import 'package:flutter_application_1/location/location_manually.dart';

class LocationAccess1 extends StatefulWidget {
  const LocationAccess1({super.key});

  @override
  State<LocationAccess1> createState() => _LocationAccess1State();
}

class _LocationAccess1State extends State<LocationAccess1> {
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;
  List<Map<String, String>> allLocations = [
    {"title": "HSR Layout", "subtitle": "Bengaluru, Karnataka, India"},
    {"title": "Indiranagar", "subtitle": "Bengaluru, Karnataka, India"},
    {"title": "Sector 1-4", "subtitle": "Hisar, Haryana, India"},
    {"title": "MG Road", "subtitle": "Bengaluru, Karnataka, India"},
  ];

  List<Map<String, String>> filteredLocations = [];
  Map<String, String>? selectedLocation;

  @override
  void initState() {
    super.initState();
    filteredLocations = allLocations;
  }

  void onSearch(String value) {
    setState(() {
      if (value.isEmpty) {
        filteredLocations = allLocations;
      } else {
        filteredLocations = allLocations
            .where(
              (loc) =>
                  loc["title"]!.toLowerCase().contains(value.toLowerCase()) ||
                  loc["subtitle"]!.toLowerCase().contains(value.toLowerCase()),
            )
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Search for location",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),

        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextfleldSrch(
                text: "Search",
                controller: searchController,
                onChanged: onSearch,
              ),
              Expanded(
                child: searchController.text.isEmpty
                    ? defaultViewWidget()
                    : locationListWidget(
                        context: context,
                        locations: filteredLocations,
                        width: MediaQuery.of(context).size.width,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget defaultViewWidget() {
  return ListView(
    children: [
      ListTile(
        leading: Image.asset(
          AppImg.loction,
          height: 18,
          width: 18,
          fit: BoxFit.cover,
        ),
        title: Text(
          "Use current location",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      Divider(),

      Text(
        "Recent searches",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),

      ListTile(
        leading: Image.asset(
          AppImg.bold,
          height: 18,
          width: 18,
          fit: BoxFit.cover,
        ),
        title: const Text(
          "Sector 1-4",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        subtitle: const Text("Hisar, Haryana, India"),
      ),

      ListTile(
        leading: Image.asset(
          AppImg.bold,
          height: 18,
          width: 18,
          fit: BoxFit.cover,
        ),
        title: const Text(
          "Indiranagar",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        subtitle: const Text("Bengaluru, Karnataka, India"),
      ),

      const Divider(),

      const Text(
        "Saved address",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),

      ListTile(
        leading: Image.asset(
          AppImg.home,
          height: 18,
          width: 18,
          fit: BoxFit.cover,
        ),
        title: const Text(
          "Home",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        subtitle: const Text("Hisar, Haryana, India"),
      ),

      ListTile(
        leading: Image.asset(
          AppImg.frame,
          height: 18,
          width: 18,
          fit: BoxFit.cover,
        ),
        title: const Text(
          "Office",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        subtitle: const Text("Bengaluru, Karnataka, India"),
      ),
    ],
  );
}

Widget locationListWidget({
  required BuildContext context,
  required List<Map<String, String>> locations,
  double? width,
}) {
  return Center(
    child: SizedBox(
      width: width ?? double.infinity,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: locations.length,
              itemBuilder: (context, index) {
                final loc = locations[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LocationManually(
                          title: loc["title"]!,
                          subtitle: loc["subtitle"]!,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        const Icon(Icons.location_on_outlined),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                loc["title"] ?? "",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                loc["subtitle"] ?? "",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColor.greyblr,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          PrimaryBtn(
            text: "Select",
            isLoading: false,
            bgclr: AppColor.backgColor,
            onPressed: () {},
          ),
        ],
      ),
    ),
  );
}
