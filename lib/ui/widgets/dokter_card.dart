import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ngepet_id/models/dokter_model.dart';
import 'package:ngepet_id/ui/pages/produk_detail_page.dart';
import '../../shared/theme.dart';
import '../pages/dokter_detail_page.dart';

class DokterCard extends StatelessWidget {
  final DokterModels dokter;

  const DokterCard(
    this.dokter, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DokterDetailPage(
              dokter: dokter,
            ),
          ),
        );
      },
      child: Container(
        height: 165,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        margin: const EdgeInsets.only(
          right: 15,
          bottom: 15,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xffF1F1F1),
            width: 2,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.5), // 25% hitam, // Warna shadow
              offset: Offset(0, 4), // Posisi shadow (X, Y)
              blurRadius: 10, // Radius blur
              spreadRadius: 0, // Jarak penyebaran shadow
            ),
          ],
        ),
        child: Column(children: [
          Row(children: [
            Container(
              height: 70,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(dokter.imageUrl),
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  dokter.name,
                  style: boldTextStyle.copyWith(
                    fontSize: 16,
                    color: kBlackColor,
                  ),
                )
              ],
            )
          ])
        ]),
      ),
    );
  }
}

// Container(
//         width: 184,
//         height: 220,
//         padding: const EdgeInsets.symmetric(horizontal: 18),
//         margin: const EdgeInsets.only(
//           right: 15,
//           bottom: 15,
//         ),
//         decoration: BoxDecoration(
//           color: kWhiteColor,
//           borderRadius: BorderRadius.circular(20),
//           border: Border.all(
//             color: const Color(0xffF1F1F1),
//             width: 2,
//           ),
//           boxShadow: const [
//             BoxShadow(
//               color: Color.fromRGBO(0, 0, 0, 0.5), // 25% hitam, // Warna shadow
//               offset: Offset(0, 4), // Posisi shadow (X, Y)
//               blurRadius: 10, // Radius blur
//               spreadRadius: 0, // Jarak penyebaran shadow
//             ),
//           ],
//         ),
//         child: Column(
//           children: [
//             Container(
//               height: 145,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: NetworkImage(dokter.imageUrl),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               dokter.name,
//               textAlign: TextAlign.center,
//               style: regularTextStyle.copyWith(
//                 fontSize: 12,
//                 color: kBlackColor,
//               ),
//               overflow: TextOverflow.ellipsis,
//               maxLines: 2,
//             ),
//             const SizedBox(height: 5),
//             FittedBox(
//               fit: BoxFit.scaleDown,
//               child: Text(
//                 NumberFormat.currency(
//                         locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0)
//                     .format(dokter.harga), // Format mata uang,
//                 textAlign: TextAlign.center,
//                 style: boldTextStyle.copyWith(
//                   fontSize: 12,
//                   color: kBlackColor,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),