import 'package:braille_app/models/fases.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Topico1ConteudoScreen extends StatelessWidget {
  const Topico1ConteudoScreen({Key? key}) : super(key: key);

  void _testar(BuildContext context) {
    final Fase faset = ModalRoute.of(context)!.settings.arguments as Fase;
    Navigator.of(context).pushNamed('/testar-screen', arguments: faset);
  }

  void _voltar(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFDDE9DD),
      appBar: AppBar(
        backgroundColor: Color(0xFFF1FEF1),
        title: Text("Tópico 1"),
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
              color: Color(0xFFF1FEF1),
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Inserir o vídeo aqui
                      Container(
                        height: 200,
                        child: VideoPlayerWidget(videoPath: 'assets/videos/video1.mp4')),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Text(
              'Autonomia e empoderamento',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: Text(
              'A integração do Braille na vida cotidiana desempenha um papel fundamental na promoção da autonomia e independência. Ao dominar esse sistema tátil, indivíduos cegos ou com deficiência visual têm a capacidade de ler, escrever e acessar informações de maneira autônoma. A alfabetização em Braille não apenas amplia as oportunidades educacionais, mas também permite que essas pessoas participem ativamente em atividades profissionais e sociais, contribuindo para uma vida mais independente e plena.',
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.justify,
            ),
          ),
          Spacer(),
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
                  child: Text(
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
                    backgroundColor: Color(0xFF208B52),
                  ),
                  onPressed: () {
                    _testar(context);
                  },
                  child: Text(
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

class VideoPlayerWidget extends StatefulWidget {
  final String videoPath;

  const VideoPlayerWidget({Key? key, required this.videoPath}) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(0.0); // Set the volume to zero
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: _controller.value.isInitialized
                ? VideoPlayer(_controller)
                : Container(),
          );
        } else if (snapshot.hasError) {
          return Text('Erro ao carregar o vídeo: ${snapshot.error}');
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}