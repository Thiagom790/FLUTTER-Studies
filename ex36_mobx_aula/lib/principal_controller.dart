import 'package:ex36_mobx_aula/item_controller.dart';
import 'package:mobx/mobx.dart';
part 'principal_controller.g.dart';

class PrincipalController = PrincipalControllerBase with _$PrincipalController;

abstract class PrincipalControllerBase with Store {
  @observable
  String novoItem = '';

  @action
  void setNovoItem(String valor) => novoItem = valor;

  /* o problema nesse caso abaixo é que ele não verifica
  se cada item da lista modificou só o primeiro item */
  //   @observable
  //   List<String> listaItens = [];

//   ObservableList<String> listaItens = ObservableList();
  ObservableList<ItemController> listaItens = ObservableList<ItemController>();

  @action
  void adicionarItem() {
    listaItens.add(ItemController(this.novoItem));
    print('passou');
  }
}
