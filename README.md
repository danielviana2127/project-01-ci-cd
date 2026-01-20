# Project 01 – CI/CD Completo com Java, Docker e Segurança

## 📌 Status do Projeto

✅ Pipeline CI/CD funcional
✅ Imagem Docker publicada
✅ Scan de segurança ativo (Trivy)

---

## 📖 Sobre o Projeto

Este projeto consiste em uma **API Java simples (Spring Boot)** com um **pipeline CI/CD completo**, cobrindo desde o build da aplicação até a publicação da imagem Docker, incluindo **análise de segurança automatizada**.

O foco não é apenas fazer a aplicação rodar, mas **explicar e justificar cada decisão técnica**, simulando um ambiente real de entrega contínua.

---

## 🏗️ Arquitetura

```
Developer Push
      |
      v
GitHub Repository
      |
      v
GitHub Actions (CI/CD)
  ├─ Build Maven (Java)
  ├─ Build Docker Image
  ├─ Security Scan (Trivy)
  └─ Push Docker Hub
      |
      v
Docker Hub (Imagem publicada)
```

---

## 📂 Estrutura do Repositório

```
project-01-ci-cd/
├── app/                    # Aplicação Java (Spring Boot)
│   ├── pom.xml
│   └── src/
├── Dockerfile              # Build da imagem da aplicação
├── .github/workflows/
│   └── ci.yml              # Pipeline CI/CD
├── .env.example            # Exemplo de variáveis de ambiente
├── README.md
```

📌 **Decisão técnica**: a aplicação Java fica isolada na pasta `app/`, permitindo melhor organização e facilitando escalabilidade do repositório.

---

## 🔄 Pipeline CI/CD (Passo a Passo)

O pipeline é executado automaticamente a cada **push ou pull request para a branch `main`**.

### 1️⃣ Checkout do Código

O código é clonado para o runner do GitHub Actions.

### 2️⃣ Build e Testes (Maven)

O Maven é executado **dentro da pasta `app/`**, onde está o `pom.xml`:

* Compila o projeto
* Executa testes
* Gera o JAR da aplicação

📌 **Motivo**: evita erros de build e mantém separação clara entre código e infraestrutura.

---

### 3️⃣ Build da Imagem Docker

Após o build do JAR, é criada uma imagem Docker da aplicação.

* A imagem contém apenas o necessário para execução
* O JAR é copiado da pasta `app/target`

---

### 4️⃣ Scan de Segurança com Trivy

A imagem Docker é analisada pelo **Trivy**, identificando vulnerabilidades conhecidas.

🔐 Configuração adotada:

* Severidade analisada: **HIGH e CRITICAL**
* Modo **informativo (non-blocking)**

📌 **Decisão técnica**:
Este é um projeto educacional, portanto o scan **não bloqueia o pipeline**, mas fornece visibilidade total das vulnerabilidades.

> Em ambientes produtivos, este step pode ser configurado para falhar o pipeline.

---

### 5️⃣ Push da Imagem

Após o scan, a imagem é publicada automaticamente no **Docker Hub**.

✔ Versionamento controlado
✔ Imagem pronta para uso em Kubernetes ou Docker

---

## 🔐 Segurança Aplicada

* Scan automático de vulnerabilidades (Trivy)
* Credenciais sensíveis armazenadas via **GitHub Secrets**
* Nenhuma senha ou token versionado no repositório

Secrets utilizados:

* `DOCKER_USER`
* `DOCKER_PASSWORD`

---

## ▶️ Como Rodar Localmente

Este projeto pode ser executado de **três formas diferentes**, dependendo do objetivo. Cada cenário existe para evitar rebuilds desnecessários e simular práticas reais de desenvolvimento e produção.

---

### 🔹 Cenário 1 — Rodar a aplicação via Docker (imagem já existente)

**Quando usar:**

* Nenhuma alteração no código
* Apenas executar a aplicação

```bash
docker run -p 8080:8080 dvianaa/project-01-ci-cd:latest
```

📌 **Motivo:** reutiliza a imagem existente, mais rápido e alinhado com produção.

---

### 🔹 Cenário 2 — Alterei o código Java

**Quando usar:**

* Alterações na aplicação
* Necessário gerar novo JAR e imagem

```bash
cd app
mvn clean package
cd ..
docker build -t project-01-ci-cd .
docker run -p 8080:8080 project-01-ci-cd
```

📌 **Motivo:** qualquer mudança no código exige rebuild da imagem Docker.

---

### 🔹 Cenário 3 — Desenvolvimento local (sem Docker)

**Quando usar:**

* Desenvolvimento
* Debug rápido
* Ambiente local

```bash
cd app
mvn spring-boot:run
```

A aplicação ficará disponível em:

```
http://localhost:8080
```

📌 **Motivo:** ciclo de feedback mais rápido, sem overhead de container.

---

## 🤖 Como o Pipeline Roda

1. Realize um push para a branch `main`
2. O GitHub Actions inicia automaticamente
3. Todos os steps são executados
4. A imagem final é publicada no Docker Hub

📌 Logs claros são exibidos em cada etapa do pipeline.

---

## 🎯 Conclusão Técnica

Este projeto demonstra:

* CI/CD funcional de ponta a ponta
* Integração entre Java, Docker e GitHub Actions
* Segurança aplicada desde o pipeline
* Decisões técnicas claras e justificadas

> O objetivo não é apenas automatizar, mas **entender e explicar cada etapa do processo**.

---

## 👤 Autor

**Daniel Viana**

GitHub: [https://github.com/danielviana2127](https://github.com/danielviana2127)

