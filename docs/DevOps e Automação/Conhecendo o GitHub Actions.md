# Conhecendo o GitHub Actions

GitHub Actions é uma plataforma de automação de fluxos de trabalho (workflows) que permite a você criar e executar workflows automaticamente quando certas condições são satisfeitas. Isso significa que você pode automatizar tarefas rotineiras, como testes, construção, deploy e release de software, dentre outras.

Com GitHub Actions, você pode:

- Criar workflows personalizados para seu repositório;
- Executar workflows automaticamente quando houver mudanças no código;
- Utilizar uma variedade de ações (etapas) pré-construídas, como testes, construção, deploy e release, entre outras;
- Personalizar os workflows com scripts customizados ou integrar com outras ferramentas.

As principais características de GitHub Actions incluem:

- **Fluxos de trabalho**: Crie workflows personalizados para seu repositório;
- **Ações**: Utilize ações pré-construídas, como testes, construção, deploy e release, entre outras;
- **Triggers**: Defina condições que desencadeiam o workflow, como mudanças no código ou pull requests;
- **Jobs**: Divida seu workflow em tarefas menores, chamadas de jobs, para melhorar a escalabilidade e a performance.

GitHub Actions é uma ferramenta muito útil para desenvolvedores, pois permite automatizar processos rotineiros e simplificar o fluxo de trabalho ao longo do tempo. Além disso, é gratuito e integrado com o GitHub, tornando-o um ótimo complemento para qualquer projeto que você esteja trabalhando!

# Exemplos

```yaml
name: Deploy HTML Page to FTP Server

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Build HTML page
        run: |
          echo "Building HTML page..."
          cp index.html build/index.html

      - name: Create FTP credentials
        env:
          FTP_HOST: ${{ secrets.FTP_HOST }}
          FTP_USERNAME: ${{ secrets.FTP_USERNAME }}
          FTP_PASSWORD: ${{ secrets.FTP_PASSWORD }}

      - name: Upload files to FTP server
        run: |
          echo "Uploading files to FTP server..."
          ftp -iv <<EOF
            open ${FTP_HOST}
            user ${FTP_USERNAME} ${FTP_PASSWORD}
            put build/index.html /public_html/
          EOF

      - name: Remove temporary build directory
        run: |
          echo "Removing temporary build directory..."
          rm -rf build

```

```yaml
 name: Build and Deploy .NET Core App to Kubernetes

on:
  push:
    branches:
      - main

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Install .NET SDK and Docker
        run: |
          sudo apt-get update && sudo apt-get install -y dotnet-sdk-5.0
          sudo apt-get install -y docker-ce

      - name: Restore NuGet packages
        run: dotnet restore

      - name: Build the app
        run: dotnet build -c Release

      - name: Create a Docker image
        uses: docker/build-push@v1
        with:
          push: true
          labels:
            io.registry: myapp
          args:
            --build-arg .NETCORE_RUNTIME=5.0

      - name: Push the Docker image to Docker Hub
        uses: docker/login-action@v1
        with:
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKER_PASSWORD }}

      - name: Deploy the app to Kubernetes
        uses: kubernetes/deploy@v1
        with:
          deploy-name: myapp
          namespace: default
          image: registry.example.com/myapp:latest

      - name: Verify the deployment
        run: |
          kubectl get deployments
```