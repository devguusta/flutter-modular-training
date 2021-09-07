class Validators {
  static String? validateEmail(String? email, {bool? result = true}) {
    var emailPatter = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    print("Result $result");
    if (email!.isEmpty) {
      return "Insira um endereço de email";
    } else if (!emailPatter.hasMatch(email)) {
      return "e-mail inválido";
    } else if (!result!) {
      // print(email);
      return "Não existe uma conta com esse email";
    }
  }
    String? validateName(String value) {
    String pattern = r'^[a-z A-Z,.\-]+$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Campo obrigatório*';
    } else if (!regExp.hasMatch(value)) {
      return 'Porfavor, preencha o campo corretamente*';
    }
    print(value);
    return null;
  }

 
}