import 'package:mobx/mobx.dart';
import 'package:modular1/app/modules/login/repositories/login_repository.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;
abstract class _LoginStoreBase with Store {
  final LoginRepository _loginRepository;

  @observable
  String userName = '';
  
  @action
  void setUserName(String value) => userName = value;

  @observable
  String name = '';
  void setName(String value) => name = value;

  @observable
  String email = '';

  @action
  void setEmail(String value) => email = value;

  @observable
  bool isLoading = false;

  _LoginStoreBase(this._loginRepository);

  @action
  void changeLoading(bool value) => isLoading = value;

  Future<bool> login() async {
    bool loginSuccess = false;
   changeLoading(true);
   try{
     final userResponse = await _loginRepository.login(userName: userName, name: name, email: email);
     loginSuccess = true;
   } catch (e){
     rethrow;
   } finally {
     changeLoading(false);
   }
   return loginSuccess;
  }
}