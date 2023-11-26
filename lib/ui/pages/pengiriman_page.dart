import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../cubit/metode_pengiriman_cubit.dart';
import '../../shared/theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/top_section_widget.dart';

class PengirimanPage extends StatefulWidget {
  const PengirimanPage({Key? key}) : super(key: key);

  @override
  State<PengirimanPage> createState() => _PengirimanPageState();
}

class _PengirimanPageState extends State<PengirimanPage> {
  late MetodePengiriman selectedMetodePengiriman;
  late MetodePengirimanCubit metodePengirimanCubit;

  @override
  void initState() {
    super.initState();
    metodePengirimanCubit = context.read<MetodePengirimanCubit>();
    selectedMetodePengiriman = metodePengirimanCubit.state;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    metodePengirimanCubit.getSavedMetodePengiriman();
  }

  Widget metodePengirimanSection(
    String nama,
    String deskripsi,
    int harga,
    MetodePengiriman metode,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMetodePengiriman = metode;
        });
      },
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Container(
          height: 80,
          margin: const EdgeInsets.only(
            bottom: 20,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          decoration: BoxDecoration(
            color: selectedMetodePengiriman == metode
                ? kPrimaryColor
                : kWhiteColor,
            border: Border.all(
              width: 1.0,
              color: kSilver2Color,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      nama,
                      style: semiBoldTextStyle.copyWith(
                        fontSize: 14,
                        color: selectedMetodePengiriman == metode
                            ? kWhiteColor
                            : kBlackColor,
                      ),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      deskripsi,
                      style: regularTextStyle.copyWith(
                        fontSize: 14,
                        color: selectedMetodePengiriman == metode
                            ? kWhiteColor
                            : kBlackColor,
                      ),
                    ),
                  ),
                ],
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  NumberFormat.currency(
                          locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0)
                      .format(harga),
                  textAlign: TextAlign.center,
                  style: mediumTextStyle.copyWith(
                    fontSize: 14,
                    color: selectedMetodePengiriman == metode
                        ? kWhiteColor
                        : kBlackColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<MetodePengirimanCubit, MetodePengiriman>(
          builder: (context, state) {
            return Stack(
              children: [
                const TopSectionWidget(
                  title: "Metode Pengiriman",
                  back: true,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 50,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        metodePengirimanSection(
                          "Reguler",
                          "Estimasi pengiriman sampai 3-4 hari",
                          5000,
                          MetodePengiriman.Reguler,
                        ),
                        metodePengirimanSection(
                          "Express",
                          "Estimasi pengiriman sampai 1-2 hari",
                          20000,
                          MetodePengiriman.Express,
                        ),
                        metodePengirimanSection(
                          "Ninja Hatori",
                          "Estimasi pengiriman sampai 1 hari",
                          50000,
                          MetodePengiriman.Ninja_Hatori,
                        ),
                        metodePengirimanSection(
                          "Burokh",
                          "Estimasi pengiriman sampai 25 detik",
                          10000000,
                          MetodePengiriman.Burokh,
                        ),
                        metodePengirimanSection(
                          "Kura-kura",
                          "Estimasi pengiriman sampai 1-2 bulan",
                          3000,
                          MetodePengiriman.Kura_kura,
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Container(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: CustomButton(
                        title: "Pilih Pengiriman",
                        color: kPrimaryColor,
                        onTap: () {
                          metodePengirimanCubit
                              .selectMetodePengiriman(selectedMetodePengiriman);
                          Navigator.pop(context, selectedMetodePengiriman);
                        },
                        titleColor: kWhiteColor,
                        width: 319,
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
