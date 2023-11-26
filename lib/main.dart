import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngepet_id/cubit/auth_cubit.dart';
import 'package:ngepet_id/cubit/page_cubit.dart';
import 'package:ngepet_id/cubit/pilih_voucher_cubit.dart';
import 'package:ngepet_id/cubit/product_cubit.dart';
import 'package:ngepet_id/cubit/store_cubit.dart';
import 'package:ngepet_id/ui/pages/ajukan_buka_toko_page.dart';
import 'package:ngepet_id/ui/pages/pencarian_page.dart';
import 'package:ngepet_id/ui/pages/pilih_voucher_page.dart';
import 'package:ngepet_id/ui/pages/profile_detail_page.dart';

import 'cubit/metode_pembayaran_cubit.dart';
import 'cubit/metode_pengiriman_cubit.dart';
import 'ui/pages/ajukan_dokter.dart';
import 'ui/pages/cart_page.dart';
import 'ui/pages/login_page.dart';
import 'ui/pages/main_page.dart';
import 'ui/pages/notifikasi_page.dart';
import 'ui/pages/onboarding_page.dart';
import 'ui/pages/pembayaran_page.dart';
import 'ui/pages/pengiriman_page.dart';
import 'ui/pages/produk_detail_page.dart';
import 'ui/pages/register_page.dart';
import 'ui/pages/pesanan_page.dart';
import 'ui/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyAeIJ6Lj-1oJtk4zRwnIcSOUV8pZfVgLvQ',
      appId: '1:293977394839:android:206dfec17e371a9eb663d2',
      messagingSenderId: '293977394839',
      projectId: 'ngepet-id',
      storageBucket: 'gs://ngepet-id.appspot.com',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => ProductCubit(),
        ),
        BlocProvider(
          create: (context) => StoreCubit(),
        ),
        BlocProvider(
          create: (context) => MetodePembayaranCubit(),
        ),
        BlocProvider(
          create: (context) => MetodePengirimanCubit(),
        ),
        BlocProvider(
          create: (context) => PilihVoucherCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/main': (context) => const MainPage(),
          '/onboarding': (context) => const OnBoardingPage(),
          '/login': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
          '/notifikasi': (context) => const NotifikasiPage(),
          '/cart': (context) => const CartPage(),
          '/pesanan': (context) => PesananPage(),
          '/pembayaran': (context) => const PembayaranPage(),
          '/pengiriman': (context) => const PengirimanPage(),
          '/pilih-voucher': (context) => const PilihVoucherPage(),
          '/profile-detail': (context) => const ProfileDetailPage(),
          '/ajukan-toko': (context) => const AjukanBukaTokoPage(),
          '/ajukan-role-dokter': (context) => const AjukanDokterPage(),
          '/pencarian': (context) => PencarianPage(),
        },
      ),
    );
  }
}
