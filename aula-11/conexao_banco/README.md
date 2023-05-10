# Aula 11 - 09/05 

## Entregas
* 03/08/2023 → Fechamento Diário / Retomada conteúdo
* 03/08/2023 → Entrega projeto
* 10/08/2023 → Avaliação 
* 17/08/2023 → Recuperação

## Conteudo de hoje

### [Conteudo Form](https://docs.flutter.dev/cookbook/forms)
### @@@@ Widgets
#### Quais widgets trabalhamos?
* AppBar
* Snackbar
* ScaffoldMensager
* Form
* Row
* Column 

#### O que é e para que serve a key de uma widget? Qual a vantegem de ser tipado?
* as keys em Flutter são usadas para identificar e rastrear widgets durante o processo de construção. A vantagem de serem tipadas é a verificação de tipo em tempo de compilação e a melhoria no desempenho do aplicativo.

#### O que tem em comum? o que tem de diferente?
#### Definir exemplos práticos e comentários de uso.
* trabalhando com formulários;

* como pegar valor de um campo;
```dart
        controller: _textOTNController,
```
* restrições (validador, keyboardType, maxLength, inputFormatters, RegExp, outros)
```dart
  validator: (valorDigitado) {
                if(valorDigitado == null || valorDigitado.isEmpty) {
                  return 'O campo é obrigatório';
                } return null;
              }
  
    keyboardType: TextInputType.number
    maxLength: 2
    inputFormatters: [FilteringTextInputFormatter.digitsOnly]
```
* O que é plugin? Para que serve?
o que é? vantagens e desvantagens.
Os plugins são desenvolvidos para fornecer uma integração fácil e eficiente entre o código Flutter e as funcionalidades nativas de cada plataforma (Android e iOS). São produtivos e possibilitam a reutizilação de códigos, porem ficamos dependentes e temos que ter atenção na compatibilidade e estabilidade do plugin

 → O que é pub.dev? Como funciona?

 
 → Como escolher um plugin? Justifique.
Ele dever ser compativel ao seu projeto, ter uma alta popularidade e ser ativamente mantido

 → exemplo de como utilizar/configurar o projeto com explicações passo a passo.



### Anotações da aula

* Form pode substituir o Container, mas o Form possui métodos especiais, como pegar os valores e fazer validações

* A validação tem varias formas, por exemplo, reastivo e passivo, vamos utilizar dependendo onde formos aplicar
Passivo quando clica num botão 
Reativo é validade enquanto digita 

* Expressão regular 
Valido para todas as linguagens !!!


### @@@@ atividade 1
* definir 1 campo sobrenome e mostrar o nome e sobrenome no clique
```dart
TextFormField(
              controller: _sobrenomeController,
              decoration: InputDecoration(
                labelText: 'Sobrenome',
                hintText: 'Informe o seu sobrenome.'
              ),
              validator: (valorDigitado) {
                if(valorDigitado == null || valorDigitado.isEmpty) {
                  return 'O campo é obrigatório';
                } return null;
              },
            ),
```
* definir 1 campo de sua preferência mostra todos os valores no clique
```dart
TextFormField(
              controller: _idadeController,
              decoration: InputDecoration(
                labelText: 'Idade',
                hintText: 'Informe sua idade'
              ),
                validator: (valorDigitado) {
                
                  var testaInt = int.tryParse(valorDigitado!) ?? null;
                  if(valorDigitado == null || valorDigitado.isEmpty) {
                    return 'O campo é obrigatório';
                  } else if(testaInt == null) {
                    return 'O campo deve ser numerico';
                  } 
                  return null;
                },
            ),
```

* definir um DTO, inserir os valores dos campos nos atributos e no clique do botão mostrar o DTO

### @@@@ atividade 2

crie um novo formulário com os seguintes campos
- 3 de sua preferência com restrições diferentes
- definir 1 campo CEP
```dart
TextFormField(
              controller: _CEPController,
              inputFormatters: [_CEPMask],
              decoration: InputDecoration(
                labelText: 'CEP',
                hintText: 'Digite seu CEP '
              ), validator: (valorDigitado) {
                  if(valorDigitado == null || valorDigitado.isEmpty) {
                    return 'O campo é obrigatório';
                  } return null;
                },
            ),
```
- definir 1 campo de código do objeto que não pode conter a letra x e y
```dart
TextFormField(
              controller: _textWttXYController,
              inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'x|y|X|Y'))],
              decoration: InputDecoration(
                labelText: 'Texto sem X e Y'
              ),
            ),
```
- definir 1 campo de código de produto que só pode conter letras e os números 9 e 0.
```dart
TextFormField(
              controller: _textOTNController,
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9a-zA-Z]'))],
              decoration: InputDecoration(
                labelText: 'Texto somente letras e numeros'
              ),
            )
```
- definir um DTO, inserir os valores dos campos nos atributos e no clique do botão mostrar o DTO

O que é plugin? Para que serve?
 - o que é? vantagens e desvantagens.
 - O que é pub.dev? Como funciona?
 - Como escolher um plugin? Justifique.
 - exemplo de como utilizar/configurar o projeto com explicações passo a passo.

