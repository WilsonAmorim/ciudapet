part of '../register_page.dart';

class _RegisterForm extends StatefulWidget {
  const _RegisterForm({Key? key}) : super(key: key);

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends ModularState<_RegisterForm, RegisterControle> {
  final _formKey = GlobalKey<FormState>();
  final _loginEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _loginEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CuidapetTextFormField(
            label: 'Login',
            controller: _loginEC,
            validator: Validatorless.multiple([
              Validatorless.required('Login obrigatório'),
              Validatorless.email('Login deve ser um E-mail válido')
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          CuidapetTextFormField(
            label: 'Senha',
            obscureText: true,
            controller: _passwordEC,
            validator: Validatorless.multiple([
              Validatorless.required('Senha obrigatório'),
              Validatorless.min(6, 'Senha precisa ter pelo menos 6 caracteres')
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          CuidapetTextFormField(
            label: 'Confirmar senha',
            obscureText: true,
            validator: Validatorless.multiple([
              Validatorless.required('Confrima senha obrigatório'),
              Validatorless.min(
                  6, 'Confirma senha precisa ter pelo menos 6 caracteres'),
              Validatorless.compare(
                  _passwordEC, 'Senha e confirma senha não são iguais')
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          CuidapetDefaultButton(
              onPressed: () {
                final formValid = _formKey.currentState?.validate() ?? false;
                if (formValid) {
                  controller.register(
                      email: _loginEC.text, password: _passwordEC.text);
                }
                //Navigator.pushNamed(context, "/loginPage");
              },
              label: 'Cadastrar')
        ],
      ),
    );
  }
}
