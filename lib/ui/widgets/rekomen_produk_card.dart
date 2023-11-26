import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ngepet_id/models/product_model.dart';
import 'package:ngepet_id/ui/pages/produk_detail_page.dart';
import '../../shared/theme.dart';

class RekomenProdukCard extends StatelessWidget {
  final ProductModels product;

  const RekomenProdukCard(
    this.product, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProdukDetailPage(
              product: product,
              storeId: product.storeId,
            ),
          ),
        );
      },
      child: Container(
        width: 184,
        height: 220,
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
              color: Color.fromRGBO(0, 0, 0, 63), // 25% hitam, // Warna shadow
              offset: Offset(0, 4), // Posisi shadow (X, Y)
              blurRadius: 4, // Radius blur
              spreadRadius: 0, // Jarak penyebaran shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 145,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(product.imageUrl),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              product.name,
              textAlign: TextAlign.center,
              style: regularTextStyle.copyWith(
                fontSize: 12,
                color: kBlackColor,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            const SizedBox(height: 5),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                NumberFormat.currency(
                        locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0)
                    .format(product.hargaSatuan), // Format mata uang,
                textAlign: TextAlign.center,
                style: boldTextStyle.copyWith(
                  fontSize: 12,
                  color: kBlackColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
