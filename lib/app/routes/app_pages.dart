import 'package:get/get.dart';

import '../modules/homePage/bindings/home_page_binding.dart';
import '../modules/homePage/views/home_page_view.dart';
import '../modules/jadwalDokter/bindings/jadwal_dokter_binding.dart';
import '../modules/jadwalDokter/views/jadwal_dokter_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/pasien/bindings/pasien_binding.dart';
import '../modules/pasien/views/pasien_view.dart';
import '../modules/signUp/bindings/sign_up_binding.dart';
import '../modules/signUp/views/sign_up_view.dart';
import '../modules/splashScreen/bindings/splash_screen_binding.dart';
import '../modules/splashScreen/views/splash_screen_view.dart';
import '../modules/tambahPasien/bindings/tambah_pasien_binding.dart';
import '../modules/tambahPasien/views/tambah_pasien_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.HOME_PAGE,
      page: () => HomePageView(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.PASIEN,
      page: () => PasienView(),
      binding: PasienBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_PASIEN,
      page: () => TambahPasienView(),
      binding: TambahPasienBinding(),
    ),
    GetPage(
      name: _Paths.JADWAL_DOKTER,
      page: () => JadwalDokterView(),
      binding: JadwalDokterBinding(),
    ),
  ];
}
