import 'package:flutter/material.dart';
import 'package:flutter_application_1/home/favorite_screen.dart';
// import 'package:flutter_application_1/constants.dart/colors.dart';
import 'package:flutter_application_1/home/product_details.dart';

class Vegbag extends StatefulWidget {
  final List<Map<String, String>> vegbag;

  const Vegbag({super.key, required this.vegbag});

  @override
  State<Vegbag> createState() => _VegbagState();
}

class _VegbagState extends State<Vegbag> {
  Set<int> favoriteIndexes = {};
  List<Map<String, String>> favoriteList = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 255,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
       
      padding: EdgeInsets.symmetric(horizontal: 10,),
      
        itemCount: widget.vegbag.length,
        itemBuilder: (context, index) {
          final item = widget.vegbag[index];
          final isFavorite = favoriteIndexes.contains(index);

          return
            Padding(
      padding: const EdgeInsets.only(right: 16),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetails(vegItem: item),
                  ),
                );
              },
              child: Container(
                width: 190,
                padding: const EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.grey,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  FavoriteScreen(favoriteList: favoriteList),
                            ),
                          );
                          setState(() {
                            if (isFavorite) {
                              favoriteIndexes.remove(index);
                              favoriteList.remove(item);
                            } else {
                              favoriteIndexes.add(index);
                              favoriteList.add(item);
                            }
                          });
                        },
                      ),
                    ),
                    Image.asset(
                      item['path']!,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item['text']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      item['subtext']!,
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(height: 6),
                    Text(item['kg']!, style: const TextStyle(fontSize: 14)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
