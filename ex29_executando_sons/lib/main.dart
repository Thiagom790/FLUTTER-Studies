import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AudioPlayer _audioPlayer = AudioPlayer();
  AudioCache _audioCache = AudioCache(prefix: "audios/");
  bool primeiraExecucao = true;
  double _volume = 0.5;

  _executarOnline() async {
    String url =
        "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3";
    int resultado = await _audioPlayer.play(url);
    if (resultado == 1) {
      //Sucesso
    }
  }

  _executar() async {
    setState(() {
      _volume = 0.5;
    });
    _audioPlayer.setVolume(_volume);
    if (primeiraExecucao) {
      // O método play sempre executa a musica do inicio
      _audioPlayer = await _audioCache.play("musica.mp3");
      primeiraExecucao = false;
    } else {
      _audioPlayer.resume();
    }
  }

  _pausar() async {
    int resultado = await _audioPlayer.pause();
    if (resultado == 1) {
      //Sucesso
    }
  }

  _parar() async {
    int resultado = await _audioPlayer.stop();
    if (resultado == 1) {
      //Sucesso
    }
  }

  @override
  Widget build(BuildContext context) {
    // _executarOnline();
    // _executar();
    return Scaffold(
      appBar: AppBar(
        title: Text('Executando sons'),
      ),
      body: Column(
        children: <Widget>[
          Slider(
            value: _volume,
            min: 0,
            max: 1,
            onChanged: (novoVolume) {
              setState(() {
                _volume = novoVolume;
              });
              _audioPlayer.setVolume(novoVolume);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/images/executar.png"),
                  onTap: _executar,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/images/pausar.png"),
                  onTap: _pausar,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/images/parar.png"),
                  onTap: _parar,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
