# Aplicativo de Temperatura com Flutter e Servidor Node.js

Este repositório contém um exemplo simples de um aplicativo Flutter para consultar a temperatura de uma cidade usando um servidor Node.js como backend.


![Flutter_Logo](flutter-logo.png)
![Node_Logo](Node.png)

## Configurando o Servidor Node.js

1. **Clone este repositório:**

    ```bash
    git clone https://github.com/samirbergonzi/temperatura-flutter-node.git
    ```

2. **Acesse o diretório do servidor Node.js:**

    ```bash
    cd temperatura-flutter-node/Server_node
    ```

3. **Instale as dependências do server.js:**

    ```bash
    npm init -y
    npm install
    ```

4. **Abra o arquivo `server.js` e substitua `'sua_chave_de_api'` pela sua chave de API do OpenWeatherMap.**

5. **Inicie o servidor:**

    ```bash
    node server.js
    ```

    O servidor estará disponível em `http://localhost:3000`.

## Configurando o Aplicativo Flutter

1. **Acesse o diretório do aplicativo Flutter:**

    ```bash
    cd temperatura-flutter-node/AppFlutter
    ```

2. **Certifique-se de ter o Flutter instalado. Se não tiver, [instale-o](https://flutter.dev/docs/get-started/install).**

3. **Execute os comandos para obter as dependências do Flutter:**

    ```bash
    flutter pub get
    ```

4. **Abra o arquivo `lib/main.dart` e certifique-se de que a URL no método `_getTemperatura` corresponda à URL do seu servidor Node.js.**

    ```dart
    final uri = Uri.parse('http://localhost:3000/temperatura/$cidade');
    ```

5. **Compile e execute o aplicativo:**

    ```bash
    flutter run
    ```

    Certifique-se de ter um dispositivo ou emulador conectado.

O aplicativo Flutter agora deve ser capaz de se comunicar com o servidor Node.js para obter a temperatura da cidade especificada.

Lembre-se de ajustar as configurações conforme necessário para o seu ambiente de desenvolvimento. Se você estiver usando um dispositivo físico para testar o aplicativo, certifique-se de que o dispositivo esteja na mesma rede que o servidor Node.js.

**Observação:** Este exemplo usa uma chave de API do OpenWeatherMap. Certifique-se de ter permissão para usar a API e respeitar os termos de serviço da OpenWeatherMap.
