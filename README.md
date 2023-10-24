# Projeto Docker, Nginx, Gunicorn e Flask
## Visão Geral

Este projeto demonstra a configuração de uma pilha de aplicativos web utilizando as tecnologias Docker, Nginx, Gunicorn e Flask. Ele permite a implantação de um aplicativo Flask simples, servido por um servidor Gunicorn, com um proxy reverso Nginx para gerenciar as solicitações HTTP e HTTPS.

## Componentes do Projeto

O projeto é composto pelos seguintes componentes:
1. Flask App: Um aplicativo web Flask simples que responde a solicitações HTTP.
2. Nginx: Um servidor web que atua como um proxy reverso para encaminhar solicitações para o aplicativo Flask e gerenciar conexões HTTPS usando certificados SSL/TLS.
3. Gunicorn: Um servidor HTTP WSGI para executar o aplicativo Flask.
4. Docker Compose: É utilizado para gerenciar e orquestrar os contêineres do Docker.

## Estrutura de Diretórios
O projeto segue a seguinte estrutura de diretórios:

```bash
|-- docker-compose.yml
|-- flask_app
|   |-- Dockerfile
|   |-- app.py
|   |-- requirements.txt
|   |-- wsgi.py
|-- nginx
|   |-- Dockerfile
|   |-- nginx.conf
|   |-- project.conf
|-- run_docker.sh
|-- server.crt
|-- server.key
```
## Configuração e Implantação
1. Gerando Certificados SSL (Opcional)
Caso deseje habilitar o suporte a HTTPS, você pode gerar certificados SSL/TLS autoassinados com o seguinte comando:

```bash
openssl req -x509 -newkey rsa:4096 -keyout server.key -out server.crt -days 365 -nodes
```
2. Construindo os Contêineres Docker
Para construir e iniciar os contêineres Docker, execute o script run_docker.sh:

```bash
./run_docker.sh
```
3. Acessando o Aplicativo

Após a implantação bem-sucedida, o aplicativo Flask estará acessível em http://localhost:8000, e o Nginx encaminhará as solicitações HTTP para o aplicativo Flask.

Para acessar o aplicativo através de HTTPS, você deve configurar um DNS apontando para o servidor ou adicionar um registro no arquivo /etc/hosts do seu sistema para mapear o domínio usado no arquivo nginx/project.conf para localhost.

4. Encerrando o Projeto
Para encerrar os contêineres Docker, você pode executar:

```bash
docker-compose down
```

## Personalização
Você pode personalizar este projeto da seguinte forma:

- Aplicativo Flask: Edite o código no diretório flask_app para implementar seu próprio aplicativo Flask.
- Configuração do Nginx: Personalize as configurações do Nginx no arquivo nginx/project.conf conforme necessário.
- Certificados SSL/TLS: Se preferir certificados SSL/TLS de uma autoridade certificadora confiável, substitua os arquivos server.crt e server.key pelos certificados apropriados.

## Conclusão
Este projeto é um exemplo simples de como criar uma pilha de aplicativos web seguros usando Docker, Nginx, Gunicorn e Flask. Você pode personalizá-lo de acordo com suas necessidades e usá-lo como ponto de partida para desenvolver aplicativos web mais complexos e seguros. Certifique-se de seguir as melhores práticas de segurança ao implantar aplicativos em produção.
