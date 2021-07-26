import 'package:ex22_youtube_clone/API.dart';
import 'package:ex22_youtube_clone/model/Video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class Inicio extends StatefulWidget {
  String pesquisa;
  Inicio(this.pesquisa);
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  Future<List<Video>> _listarVideos(String pesquisa) async {
    Api api = Api();
    return api.pesquisar(pesquisa);
  }

  @override
  void initState() {
    super.initState();
    print("Chamado 1: initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("Chamado 2: didChangeDependencies");
  }

  @override
  void didUpdateWidget(covariant Inicio oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("Chamado 2: didUpdateWidget");
  }

  @override
  void dispose() {
    super.dispose();
    print("Chamado 4: dispose");
  }

  @override
  Widget build(BuildContext context) {
    print("Chamado 3: build");
    return FutureBuilder<List<Video>>(
      future: _listarVideos(widget.pesquisa),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  List<Video> videos = snapshot.data;
                  Video video = videos[index];

                  return GestureDetector(
                    onTap: () {
                      FlutterYoutube.playYoutubeVideoById(
                        apiKey: CHAVE_YOUTUBE_API,
                        videoId: video.id,
                        autoPlay: true,
                        fullScreen: true,
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(video.imagem),
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(video.titulo),
                          subtitle: Text(video.canal),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: snapshot.data.length,
                separatorBuilder: (BuildContext context, int index) => Divider(
                  height: 2,
                  color: Colors.grey,
                ),
              );
            } else {
              return Center(
                child: Text('Nenhum dado a ser exibido!'),
              );
            }
            break;
        }
      },
    );
  }
}
