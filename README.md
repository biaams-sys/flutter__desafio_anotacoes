````md
#  Bloco de Anotações

Aplicativo mobile desenvolvido em Flutter para a aula de Programação para Dispositivos Móveis, referente ao **Desafio 03 da Aula 04 — Consumo de APIs Externas**.

O aplicativo permite realizar autenticação utilizando a API DummyJSON e criar e armazenar anotações localmente no dispositivo.

---

##  Funcionalidades

- Splash Screen com animação de entrada e saída
- Tela de Login
- Autenticação utilizando a API DummyJSON
- Validação de usuário e senha
- Mensagem de acesso negado para login inválido
- Tela Home com lista de anotações
- Menu lateral
- Acesso à Splash pelo menu
- Opção de sair do aplicativo
- Criação de novas anotações
- Armazenamento local das anotações
- Recuperação das anotações após fechar e abrir o aplicativo
- Interface com tema e paleta de cores personalizada
- Fonte personalizada do Google Fonts
- Ícone personalizado para o aplicativo

---

##  Interface

O aplicativo possui uma interface com visual simples e intuitivo, utilizando uma paleta em tons de rosa e creme.

### Splash

![Splash](assets/screenshots/01-splash.png)

### Login

![Login](assets/screenshots/02-login.png)

### Home

![Home](assets/screenshots/03-home.png)

### Nova anotação

![Nova anotação](assets/screenshots/04-anotacao.png)

### Menu lateral

![Menu lateral](assets/screenshots/05-menu.png)

---

##  Tecnologias utilizadas

- Flutter
- Dart
- API REST
- DummyJSON
- SharedPreferences
- Google Fonts
- Android Studio
- Visual Studio Code

---

##  API utilizada

A autenticação do aplicativo utiliza a API **DummyJSON**.

O aplicativo envia o nome de usuário e a senha informados na tela de Login para a API.

Quando a autenticação é realizada com sucesso, o usuário é direcionado para a tela Home.

Quando a autenticação falha, é exibida uma mensagem de acesso negado.

---

##  Persistência de dados

As anotações são armazenadas localmente utilizando o `SharedPreferences`.

Dessa forma, as anotações permanecem disponíveis mesmo depois que o aplicativo é fechado e aberto novamente no dispositivo.

---

##  Requisitos

Para executar o projeto, é necessário ter instalado:

- Flutter
- Dart
- Android Studio ou outro ambiente compatível com Flutter
- Emulador Android ou dispositivo Android

---

## ▶ Como executar

Clone o repositório:

```bash
git clone URL_DO_REPOSITORIO
````

Entre na pasta do projeto:

```bash
cd flutter_desafio_anotacoes
```

Instale as dependências:

```bash
flutter pub get
```

Execute o aplicativo:

```bash
flutter run
```

Também é possível executar em um dispositivo Android ou emulador configurado.

---

##  APK

O APK de release foi gerado utilizando:

```bash
flutter build apk --release
```

### Download

[⬇ Baixar APK](LINK_DO_APK)

---

##  Estrutura principal

```text
lib/
├── main.dart
├── splash_screen.dart
├── login_screen.dart
├── home_screen.dart
├── anotacao_screen.dart
├── auth_service.dart
└── storage_service.dart
```

---

##  Desafio

**Aula 04 — Consumo de APIs Externas**

**Desafio 03 — Aplicativo de bloco de anotações**

Requisitos implementados:

* RF001 — Splash com animação de entrada e saída
* RF002 — Login utilizando a API DummyJSON
* RF003 — Home com menu lateral, lista de anotações e botão para adicionar novas anotações

---

##  Desenvolvido por

**Beatriz Albuquerque**

Projeto desenvolvido para a disciplina de Programação para Dispositivos Móveis — SENAI.

````

###  Só tem 3 coisas que você precisa substituir

No README acima, ainda existem placeholders:

**1. As imagens**

Crie na raiz:

```text
assets/
└── screenshots/
    ├── 01-splash.png
    ├── 02-login.png
    ├── 03-home.png
    ├── 04-anotacao.png
    └── 05-menu.png
````

Depois coloque seus prints nessas posições.

**2. URL do GitHub**

Troque:

```md
git clone URL_DO_REPOSITORIO
```

pela URL real do seu repositório.

**3. Link do APK**

Troque:

```md
[⬇ Baixar APK](LINK_DO_APK)
```

pelo link que você vai colocar no GitHub para o `app-release.apk`.

### Uma observação importante

Eu **não colocaria o `app-debug.apk`** no README. O arquivo correto para entrega é o:

```text
app-release.apk
```

que você já gerou com **49,2 MB**.

Também não precisa colocar os arquivos `.sha1` na entrega principal.
