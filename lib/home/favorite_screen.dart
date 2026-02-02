import 'package:flutter/material.dart';
// import 'package:flutter_application_1/constants.dart/colors.dart';

// class FavoriteScreen extends StatelessWidget {
//   final List<Map<String, String>> favoriteList;
//   const FavoriteScreen({super.key, required this.favoriteList});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back_ios_new_outlined,
//             size: 18,
//             color: AppColor.erroclr,
//           ),
//           onPressed: () {},
//         ),
//         title: Text("Favorites"),
//         centerTitle: true,
//       ),
//       body: favoriteList.isEmpty
//           ? Center(child: Text("No Favorites Added"))
//           : ListView.builder(
//               itemCount: favoriteList.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   leading: Image.asset(favoriteList[index]['path']!, width: 40),
//                   title: Text(favoriteList[index]['text']!),
//                   subtitle: Text(favoriteList[index]['subtext']!),
//                   trailing: Icon(Icons.favorite, color: Colors.red),
//                 );
//               },
//             ),
//     );
//   }
// }
class FavoriteScreen extends StatelessWidget {
  final List<Map<String, String>> favoriteList;
  const FavoriteScreen({super.key, required this.favoriteList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18,),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Favourite",style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(12),
        itemCount: favoriteList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: .72,
        ),
        itemBuilder: (context, i) {
          final item = favoriteList[i];
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.green),
            ),
            child: Stack(
              children: [
                const Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(Icons.favorite, color: Colors.red),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(item['path']!, height: 90),
                      ),
                      const SizedBox(height: 10),
                      Text(item['text']!,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(item['subtext']!,
                          style: const TextStyle(color: Colors.grey)),
                      const Spacer(),
                      Text(item['price'] ?? "15 Rs./1kg",
                          style: const TextStyle(fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    child:  Icon(Icons.add, color: Colors.white),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
