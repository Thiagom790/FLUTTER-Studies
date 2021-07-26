class Anotacao {
  int id;
  String titulo;
  String descricao;
  String data;

  Anotacao(this.titulo, this.descricao, this.data, {this.id});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "titulo": this.titulo,
      "descricao": this.descricao,
      "data": this.data,
    };

    if (this.id != null) {
      map['id'] = this.id;
    }

    return map;
  }

  factory Anotacao.fromMap(Map<String, dynamic> mapAnotacao) {
    Anotacao anotacao = Anotacao(
      mapAnotacao["titulo"],
      mapAnotacao["descricao"],
      mapAnotacao["data"],
      id: mapAnotacao["id"],
    );
    return anotacao;
  }
}
