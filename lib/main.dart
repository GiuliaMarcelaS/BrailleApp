import 'package:braille_app/models/information_1.dart';
import 'package:braille_app/models/topico.dart';
import 'package:braille_app/models/user_data.dart';
import 'package:braille_app/screens/acertos_screen.dart';
import 'package:braille_app/screens/auth_screen.dart';
import 'package:braille_app/screens/forgot_password.dart';
import 'package:braille_app/screens/learn_screen.dart';
import 'package:braille_app/screens/quest_1_screen.dart';
import 'package:braille_app/screens/register_screen.dart';
import 'package:braille_app/screens/about_you_1_screen.dart';
import 'package:braille_app/screens/about_you_2_screen.dart';
import 'package:braille_app/screens/about_you_3_screen.dart';
import 'package:braille_app/screens/account_created_screen.dart';
import 'package:braille_app/screens/login_screen.dart';
import 'package:braille_app/models/alphabet_list.dart';
import 'package:braille_app/models/auth.dart';
import 'package:braille_app/models/ball.dart';
import 'package:braille_app/models/balls_list.dart';
import 'package:braille_app/models/braillecell.dart';
import 'package:braille_app/models/cells_list.dart';
import 'package:braille_app/models/expressions_list.dart';
import 'package:braille_app/models/fase_list.dart';
import 'package:braille_app/models/graphic.dart';
import 'package:braille_app/models/number_list.dart';
import 'package:braille_app/models/passer.dart';
import 'package:braille_app/models/passer1.dart';
import 'package:braille_app/models/passer_item.dart';
import 'package:braille_app/models/teste.dart';
import 'package:braille_app/screens/alphabet_translator_screen.dart';
import 'package:braille_app/screens/auth_or_home_screen.dart';
import 'package:braille_app/screens/expressions_translator_screen.dart';
import 'package:braille_app/screens/fase_screen.dart';
import 'package:braille_app/screens/graphic_screen.dart';
import 'package:braille_app/screens/number_translator_screen.dart';
import 'package:braille_app/screens/phrase_translator_screen.dart';
import 'package:braille_app/screens/ready_screen.dart';
import 'package:braille_app/screens/tabs_screen.dart';
import 'package:braille_app/screens/tabs_screen_2.dart';
import 'package:braille_app/screens/testar_screen.dart';
import 'package:braille_app/screens/topic_1_screen.dart';
import 'package:braille_app/screens/topico_1_conteudo_screen.dart';
import 'package:braille_app/screens/users_chart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/modulos_screen.dart';
import 'package:braille_app/screens/interface_screen.dart';
import 'package:braille_app/models/fases.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const BrailleApp());
}

class BrailleApp extends StatelessWidget {
  const BrailleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
        ChangeNotifierProvider(
          create: (_) => FaseList(),
        ),
        ChangeNotifierProvider(
          create: (_) => BallsList(),
        ),
        ChangeNotifierProvider(
          create: (_) => CellsList(),
        ),
        ChangeNotifierProvider(
          create: (_) => AlphabetList(),
        ),
        ChangeNotifierProvider(
          create: (_) => NumberList(),
        ),
        ChangeNotifierProvider(
          create: (_) => ExpressionList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Fase(),
        ),
        ChangeNotifierProvider(
          create: (_) => Topico(),
        ),
        ChangeNotifierProvider(
          create: (_) => Ball(),
        ),
        ChangeNotifierProvider(
          create: (_) => Passer1(),
        ),
        ChangeNotifierProvider(
          create: (_) => PasserItem(),
        ),
        ChangeNotifierProvider(
          create: (_) => Graphic(),
        ),
        ChangeNotifierProvider(
          create: (_) => Teste(),
        ),
        ChangeNotifierProvider(
          create: (_) => Information1(),
        ),
        ChangeNotifierProvider(
          create: (_) => ModulosScreen(),
        ),
        ChangeNotifierProxyProvider<Auth, Cell>(
          create: (_) => Cell("", ''),
          update: (ctx, auth, previous) {
            return Cell(auth.token ?? '', auth.userId ?? '');
          },
        ),
        ChangeNotifierProxyProvider<Auth, Passer>(
          create: (_) => Passer("", ''),
          update: (ctx, auth, previous) {
            return Passer(auth.token ?? '', auth.userId ?? '');
          },
        ),
        ChangeNotifierProxyProvider<Auth, UserData>(
          create: (_) => UserData("", ''),
          update: (ctx, auth, previous) {
            return UserData(auth.token ?? '', auth.userId ?? '');
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (ctx) => const AuthScreen(),
          '/modulos-screen': (ctx) => ModulosScreen(),
          '/interface-screen': (ctx) => const Interface(),
          '/tabs-screen': (ctx) => const TabsScreen(),
          '/tabs-screen-2': (ctx) => const TabsScreen2(),
          '/phrase-translator-screen': (ctx) => const PhraseTranslatorScreen(),
          '/alphabet-translator-screen': (ctx) =>
              const AlphabetTranslatorScreen(),
          '/number-translator-screen': (ctx) => const NumberTranslatorScreen(),
          '/expression-translator-screen': (ctx) =>
              const ExpressionTranslatorScreen(),
          '/fases-screen': (ctz) => const FaseScreen(),
          '/graphic-screen': (ctz) => GraphicScreen(),
          '/users-chart-screen': (ctz) => const UsersChartScreen(),
          '/login-screen': (ctz) => const LoginScreen(),
          '/register-screen': (ctz) => const RegisterScreen(),
          '/account-created-screen': (ctz) => const AccountCreatedScreen(),
          '/about-you-1-screen': (ctz) => const AboutYou1Screen(),
          '/about-you-2-screen': (ctz) => const AboutYou2Screen(),
          '/about-you-3-screen': (ctz) => const AboutYou3Screen(),
          '/ready-screen': (ctz) => const ReadyScreen(),
          '/forgot-password-screen': (ctx) => ForgotPasswordScreen(),
          '/learn-screen': (ctx) => LearnScreen(),
          '/topic-1-screen': (ctx) => Topic1Screen(),
          '/topico-1-conteudo-screen': (ctx) => Topico1ConteudoScreen(),
          '/testar-screen': (ctx) => TestarScreen(),
          '/quest-1-screen': (ctx) => Quest1Screen(),
          '/acertos-screen': (ctx) => AcertosScreen(),
        },
      ),
    );
  }
}
