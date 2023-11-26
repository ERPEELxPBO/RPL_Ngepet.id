// ignore_for_file: constant_pattern_never_matches_value_type

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ngepet_id/cubit/pilih_voucher_cubit.dart';

import '../../cubit/metode_pembayaran_cubit.dart';
import '../../cubit/metode_pengiriman_cubit.dart';
import '../../shared/theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/top_section_widget.dart';

class PesananPage extends StatefulWidget {
  PesananPage({super.key});

  @override
  State<PesananPage> createState() => _PesananPageState();
}

class _PesananPageState extends State<PesananPage> {
  MetodePembayaran? selectedMetodePembayaran;

  List<Toko> daftarToko = [
    Toko(nama: "Toko ABC"),
    Toko(nama: "Toko XYZ"),
    // Tambahkan toko lainnya sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            TopSectionWidget(
              title: "Detail Pesanan",
              back: true,
            ),
            Container(
              margin: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 50,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        for (int i = 0; i < daftarToko.length; i++)
                          buildTokoSection(daftarToko[i], i),
                      ],
                    ),
                    PesanSection(),
                    MetodePembayaranSection(),
                    VoucherSection(),
                    RincianPembayaranSection(),
                    SizedBox(height: 80),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: CustomButton(
                    title: "Buat Pesanan",
                    color: kPrimaryColor,
                    onTap: () {
                      Navigator.pushNamed(context, '/pesanan');
                    },
                    titleColor: kWhiteColor,
                    width: 319,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MetodePengirimanSection extends StatefulWidget {
  MetodePengirimanSection({
    super.key,
  });

  @override
  State<MetodePengirimanSection> createState() =>
      _MetodePengirimanSectionState();
}

class _MetodePengirimanSectionState extends State<MetodePengirimanSection> {
  MetodePengiriman? selectedMetodePengiriman;

  @override
  Widget build(BuildContext context) {
    String metodeText = selectedMetodePengiriman
            ?.toString()
            .split('.')
            .last
            .replaceAll('_', ' ') ??
        "Pilih Pengiriman";

    // Ambil harga dari metode pengiriman yang dipilih
    int selectedMetodeHarga = 0;
    if (selectedMetodePengiriman != null) {
      switch (selectedMetodePengiriman!) {
        case MetodePengiriman.Reguler:
          selectedMetodeHarga = 5000;
        case MetodePengiriman.Express:
          selectedMetodeHarga = 20000;
        case MetodePengiriman.Ninja_Hatori:
          selectedMetodeHarga = 50000;
        case MetodePengiriman.Burokh:
          selectedMetodeHarga = 10000000;
        case MetodePengiriman.Kura_kura:
          selectedMetodeHarga = 3000;
        default:
          selectedMetodeHarga = 0;
      }
    }
    return GestureDetector(
      onTap: () async {
        final result = await Navigator.pushNamed(
          context,
          "/pengiriman",
        );
        if (result != null && result is MetodePengiriman) {
          setState(() {
            selectedMetodePengiriman = result;
          });
        }
      },
      child: Container(
        height: 75,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(
              width: 1.0,
              color: kSilver2Color,
            ),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Metode Pengiriman",
              style: semiBoldTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: selectedMetodeHarga != 0
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              metodeText,
                              style: mediumTextStyle.copyWith(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              NumberFormat.currency(
                                      locale: 'id_ID',
                                      symbol: 'Rp ',
                                      decimalDigits: 0)
                                  .format(
                                      selectedMetodeHarga), // Tolong sesuaikan disini
                              textAlign: TextAlign.center,
                              style: regularTextStyle.copyWith(
                                fontSize: 14,
                                color: kSilverColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ],
                        )
                      : Text(
                          metodeText,
                          style: mediumTextStyle.copyWith(
                            fontSize: 14,
                          ),
                        ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/icons/icon_arrow_right.png",
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PesanSection extends StatelessWidget {
  PesanSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
          border: Border.all(
            width: 1.0,
            color: kSilver2Color,
          ),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Pesan",
            style: semiBoldTextStyle.copyWith(
              fontSize: 16,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Silakan tinggalkan pesan",
                style: regularTextStyle.copyWith(
                  fontSize: 14,
                  color: kSilverColor,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/icons/icon_arrow_right.png",
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class MetodePembayaranSection extends StatefulWidget {
  MetodePembayaranSection({
    Key? key,
  }) : super(key: key);

  @override
  _MetodePembayaranSectionState createState() =>
      _MetodePembayaranSectionState();
}

class _MetodePembayaranSectionState extends State<MetodePembayaranSection> {
  MetodePembayaran? selectedMetodePembayaran;

  @override
  Widget build(BuildContext context) {
    String metodeText = selectedMetodePembayaran
            ?.toString()
            .split('.')
            .last
            .replaceAll('_', ' ') ??
        "Pilih Metode";

    return GestureDetector(
      onTap: () async {
        final result = await Navigator.pushNamed(
          context,
          "/pembayaran",
        );
        if (result != null && result is MetodePembayaran) {
          setState(() {
            selectedMetodePembayaran = result;
          });
        }
      },
      child: Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.0,
            color: kSilver2Color,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/icons/icon_coin.png",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Metode Pembayaran",
                    style: semiBoldTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 15),
                  Text(
                    metodeText,
                    style: regularTextStyle.copyWith(
                      fontSize: 14,
                      color: kSilverColor,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/icons/icon_arrow_right.png",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VoucherSection extends StatefulWidget {
  VoucherSection({
    super.key,
  });

  @override
  State<VoucherSection> createState() => _VoucherSectionState();
}

class _VoucherSectionState extends State<VoucherSection> {
  Vouchers? selectedVoucher;

  @override
  Widget build(BuildContext context) {
    String metodeText =
        selectedVoucher?.toString().split('.').last.replaceAll('_', ' ') ??
            "Pilih Voucher";

    return GestureDetector(
      onTap: () async {
        final result = await Navigator.pushNamed(
          context,
          "/pilih-voucher",
        );
        if (result != null && result is Vouchers) {
          setState(() {
            selectedVoucher = result;
          });
        }
      },
      child: Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: BoxDecoration(
            border: Border.all(
              width: 1.0,
              color: kSilver2Color,
            ),
            borderRadius: BorderRadius.circular(20)),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/icons/icon_discount.png",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Voucher digunakan",
                    style: semiBoldTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    metodeText != Vouchers.none || metodeText != "Pilih Voucher"
                        ? "$metodeText%"
                        : metodeText,
                    style: regularTextStyle.copyWith(
                      fontSize: 14,
                      color: kSilverColor,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/icons/icon_arrow_right.png",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RincianPembayaranSection extends StatefulWidget {
  RincianPembayaranSection({
    super.key,
  });

  @override
  State<RincianPembayaranSection> createState() =>
      _RincianPembayaranSectionState();
}

class _RincianPembayaranSectionState extends State<RincianPembayaranSection> {
  MetodePengiriman? selectedMetodePengiriman;

  @override
  Widget build(BuildContext context) {
    int selectedMetodeHarga = 0;
    switch (selectedMetodePengiriman != null) {
      case MetodePengiriman.Reguler:
        selectedMetodeHarga = 5000;
        break;
      case MetodePengiriman.Express:
        selectedMetodeHarga = 20000;
        break;
      case MetodePengiriman.Ninja_Hatori:
        selectedMetodeHarga = 50000;
        break;
      case MetodePengiriman.Burokh:
        selectedMetodeHarga = 10000000;
        break;
      case MetodePengiriman.Kura_kura:
        selectedMetodeHarga = 3000;
        break;
      default:
        selectedMetodeHarga = 0;
    }

    return Container(
      margin: EdgeInsets.only(top: 20),
      height: 130,
      padding: EdgeInsets.only(
        right: 20,
        left: 20,
        top: 10,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        color: kWhiteColor,
        border: Border.all(
          width: 1.0,
          color: kSilver2Color,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/icons/icon_card.png"))),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "Rincian Pembayaran",
                style: semiBoldTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Subtotal Produk",
                    style: mediumTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    NumberFormat.currency(
                            locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0)
                        .format(20000), // Tolong sesuaikan disini
                    textAlign: TextAlign.center,
                    style: mediumTextStyle.copyWith(
                      fontSize: 14,
                      color: kSilverColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Subtotal Pengiriman",
                    style: mediumTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    NumberFormat.currency(
                            locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0)
                        .format(
                      selectedMetodeHarga != 0 ? selectedMetodeHarga : 0,
                    ),
                    textAlign: TextAlign.center,
                    style: mediumTextStyle.copyWith(
                      fontSize: 14,
                      color: kSilverColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Pembayaran",
                    style: boldTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    NumberFormat.currency(
                            locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0)
                        .format(00), // Tolong sesuaikan disini
                    textAlign: TextAlign.center,
                    style: mediumTextStyle.copyWith(
                      fontSize: 14,
                      color: kSilverColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget buildTokoSection(Toko toko, int index) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 20,
      ),
      Padding(
        padding: EdgeInsets.only(
          left: 15,
          top: 5,
          bottom: 15,
        ),
        child: Row(
          children: [
            Text(
              toko.nama,
              style: boldTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      for (int i = 0; i < 3; i++)
        buildProduk(
            toko.nama, "Whiskas Adult 1+ Years Tuna Flavor", 58000, index, i),
      MetodePengirimanSection(),
    ],
  );
}

Widget buildProduk(String namaToko, String namaProduk, int hargaProduk,
    int indexToko, int indexProduk) {
  String key = '$namaToko-$namaProduk';
  return Container(
    width: 350,
    height: 100,
    padding: EdgeInsets.only(
      left: 14,
      right: 14,
      top: 10,
      bottom: 10,
    ),
    margin: EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
      border: Border.all(
        width: 1.0,
        color: kSilver2Color,
      ),
      borderRadius: BorderRadius.circular(20),
    ),
    child: FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: kSilver2Color,
                      borderRadius: BorderRadius.circular(
                        16,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.scaleDown,
                          image: AssetImage("assets/produk/produk_1.png"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 208,
                    height: 78,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          namaProduk,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: boldTextStyle.copyWith(
                            fontSize: 16,
                            color: kBlack2Color,
                          ),
                        ),
                        Text(
                          NumberFormat.currency(
                                  locale: 'id_ID',
                                  symbol: 'Rp ',
                                  decimalDigits: 0)
                              .format(hargaProduk), // Format mata uang,
                          textAlign: TextAlign.center,
                          style: boldTextStyle.copyWith(
                            fontSize: 20,
                            color: kPrimaryColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Tambahkan widget lainnya sesuai kebutuhan
        ],
      ),
    ),
  );
}

class Toko {
  String nama;

  Toko({required this.nama});
}
