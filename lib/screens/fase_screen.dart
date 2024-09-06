import 'package:braille_app/data/topicos_data.dart';
import 'package:braille_app/models/fases.dart';
import 'package:braille_app/models/passer.dart';
import 'package:braille_app/models/passer1.dart';
import 'package:braille_app/models/topico.dart';
import 'package:braille_app/screens/modulos_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:braille_app/models/auth.dart';

class FaseScreen extends StatefulWidget {
  const FaseScreen({super.key});

  @override
  State<FaseScreen> createState() => _FaseScreenState();
}

class _FaseScreenState extends State<FaseScreen> {
  void _topic1f(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Fase fase = args['fase'];
    final Topico topico = args['topico'];
    final Passer passer = args['passer'];
    Navigator.of(context).pushReplacementNamed('/topic-1-screen', arguments: {'fase': fase, "topico": topico, "passer": passer});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final fracao = Provider.of<Passer>(context, listen: false);
    final auth = Provider.of<Auth>(context, listen: false);
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Fase modulo = args['fase'];
    final Topico topico = args['topico'];

    fracao.getTelaT(modulo, auth.token ?? '', auth.userId ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDDE9DD),
      appBar: AppBar(
        title: Text('${ModalRoute.of(context)!.settings.arguments != null ? (ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>)['fase'].title : 'Fase'}'),
        backgroundColor: Color(0xFFF1FEF1),
        centerTitle: true,
        actions: [
          Container(
            child: Image.asset('assets/images/muiraq_preto.png'),
            width: MediaQuery.of(context).size.width * 20 / 360,
            margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 25 / 360),
          )
        ],
      ),
      body: Consumer<Passer>(builder: (ctx, fracao, child) {
        double screenHeight = MediaQuery.of(context).size.height;
        double screenWidth = MediaQuery.of(context).size.width;
        int telas = 11;
        final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
        final Fase modulo = args['fase'];
        final Topico topico = args['topico'];
        final List<List<Topico>> topicos = topicos_data;

        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black)),
              ),
              child: Container(
                color: Color(0xFFF1FEF1),
                padding: EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Image.asset('assets/images/modulo1.png'),
                      margin: EdgeInsets.only(right: 20),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Introdução ao Braille",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          width: screenWidth - 200,
                          child: Text(
                            'Este módulo tem como objetivo proporcionar uma compreensão abrangente do sistema Braille e destacar sua relevância crucial na educação de pessoas com deficiência visual',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 30),
                          child: Text(
                            '${(((fracao.fracaoT) / telas) * 100).toInt()}% concluído',
                            style: TextStyle(
                              color: Color(0xFF208B52),
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              height: 10,
              child: Stack(
                children: [
                  Container(
                    color: Colors.white,
                  ),
                  FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: fracao.fracaoT / telas,
                    child: Container(
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            topicos[modulo.id - 1][0],
            topicos[modulo.id - 1][1],
            topicos[modulo.id - 1][2],
            topicos[modulo.id - 1][3],
          ],
        );
      }),
    );
  }
}