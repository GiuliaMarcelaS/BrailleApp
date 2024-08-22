import 'package:braille_app/models/auth.dart';
import 'package:braille_app/models/fases.dart';
import 'package:braille_app/models/passer.dart';
import 'package:braille_app/models/topico.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Topico1ConteudoScreen extends StatefulWidget {
  const Topico1ConteudoScreen({Key? key}) : super(key: key);

  @override
  State<Topico1ConteudoScreen> createState() => _Topico1ConteudoScreenState();
}

class _Topico1ConteudoScreenState extends State<Topico1ConteudoScreen> {
  late YoutubePlayerController _controller;
  int indice = 0;

   @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Fase fase = args['fase'];
    final Topico topico = args['topico'];

    _controller = YoutubePlayerController(
      initialVideoId: topico.videos[indice],
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _testar(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Fase fase = args['fase'];
    final Topico topico = args['topico'];
    final Passer passer = args['passer'];
    final auth = Provider.of<Auth>(context, listen: false);
    if (passer.topicoCompleto <= topico.id) {
      passer.incrementaFracao(passer, auth.token??'', auth.userId??"");
    }
    Navigator.of(context).pushNamed('/testar-screen', arguments: {'fase': fase, "topico": topico, "passer": passer});
  }

  void _voltar(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Fase fase = args['fase'];
    final Topico topico = args['topico'];
    final Passer passer = args['passer'];
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    int incrementaLista(){
      setState(() {
        indice++;
        _controller.load(topico.videos[indice]);
      });
      return indice;
    }
    return Scaffold(
      backgroundColor: const Color(0xFFDDE9DD),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF1FEF1),
        title: Text("Tópico ${topico.number}"),
        centerTitle: true,
        actions: [
          Container(
            child: Image.asset('assets/images/muiraq_preto.png'),
            width: screenWidth * 20 / 360,
            margin: EdgeInsets.only(right: screenWidth * 25 / 360),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black)),
            ),
            child: Container(
              color: const Color(0xFFF1FEF1),
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [],
              ),
            ),
          ),
          Container(
            width: screenWidth,
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Color.fromRGBO(164, 228, 245, 1),
            ),
          ),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Text(
              topico.titulos[indice],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
              textAlign: TextAlign.justify,
            ),
          ),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: Text(
              topico.conteudos[indice],
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.justify,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: screenHeight * 50 / 800, right: 20),
                height: screenHeight * 50 / 800,
                width: screenWidth * 150 / 360,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    _voltar(context);
                  },
                  child: const Text(
                    'Voltar',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: screenHeight * 50 / 800),
                height: screenHeight * 50 / 800,
                width: screenWidth * 150 / 360,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF208B52),
                  ),
                  onPressed: () {
                    if(indice+1==topico.titulos.length){
                    _testar(context);
                    }
                    else{
                      incrementaLista();
                    }
                  },
                  child: const Text(
                    'Continuar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}