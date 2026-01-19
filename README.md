# Projeto 01 – CI/CD Completo com Java, Docker e Segurança

## 🎯 Objetivo do Projeto

Este projeto tem como objetivo demonstrar, de forma prática, a construção de uma **aplicação simples em Java** integrada a um **pipeline CI/CD completo**, aplicando conceitos essenciais de **DevOps**, como:

* Automação de build
* Criação de imagens Docker
* Segurança integrada ao pipeline (Shift Left)
* Publicação automática de imagens
* Documentação clara e objetiva

O foco não é a complexidade da aplicação, mas sim a **qualidade do pipeline, segurança e clareza do processo**.

---

## 🚀 O que o projeto faz

A aplicação é uma **API REST simples em Java (Spring Boot)** que responde a uma requisição HTTP com uma mensagem de status, servindo como base para validar:

* Build automatizado
* Containerização
* Scan de vulnerabilidades
* Deploy de imagem em registry

Endpoint disponível:

```
GET /
```

Resposta:

```
🚀 API Java rodando com CI/CD completo!
```

---

## 🏗️ Arquitetura do Projeto

Arquitetura simplificada do fluxo CI/CD:

```
Desenvolvedor
     |
     v
GitHub (push)
     |
     v
GitHub Actions (CI/CD)
 ├── Build Java (Maven)
 ├── Build da imagem Docker
 ├── Scan de segurança (Trivy)
 └── Push da imagem
     |
     v
Docker Hub (Registry)
```

Essa arquitetura garante **automação, rastreabilidade e segurança desde o código até a imagem final**.

---

## ⚙️ Pipeline CI/CD – Explicação passo a passo

O pipeline é executado automaticamente a cada `push` na branch `main`.

### 1️⃣ Checkout do código

O GitHub Actions clona o repositório para o runner, garantindo que o pipeline sempre execute com o código mais recente.

**Por quê?**
Garante consistência e evita builds manuais ou ambientes divergentes.

---

### 2️⃣ Build e Testes da Aplicação

A aplicação Java é compilada utilizando **Maven**.

**Por quê?**
Detecta erros de compilação logo no início do pipeline, reduzindo falhas em produção.

---

### 3️⃣ Build da Imagem Docker

A imagem é criada usando **Docker multi-stage build**, separando:

* Etapa de build
* Etapa de execução

**Por quê?**

* Reduz o tamanho da imagem final
* Remove dependências desnecessárias
* Melhora segurança e performance

---

### 4️⃣ Scan de Segurança com Trivy

A imagem Docker é analisada pelo **Trivy**, verificando vulnerabilidades conhecidas.

Configuração:

* Severidades: `HIGH` e `CRITICAL`
* Pipeline **falha automaticamente** se vulnerabilidades críticas forem encontradas

**Por quê?**

* Aplica o conceito de **Shift Left Security**
* Evita que imagens inseguras sejam publicadas
* Segurança integrada ao processo, não opcional

---

### 5️⃣ Push da Imagem para o Registry

Após passar por todas as etapas, a imagem é publicada automaticamente no **Docker Hub**.

**Por quê?**

* Garante versionamento
* Facilita deploy futuro (Kubernetes, ECS, etc.)
* Elimina processos manuais

---

## 🔐 Segurança Aplicada no Projeto

Este projeto aplica segurança em múltiplas camadas:

* 🔍 **Trivy** para análise de vulnerabilidades
* 🐳 **Docker multi-stage build**
* 📦 Imagem base mínima (JRE)
* 🔑 Secrets gerenciados via GitHub Actions
* ❌ Nenhuma credencial hardcoded
* 📜 Pipeline falha automaticamente em caso de risco

Essas práticas seguem padrões reais de ambientes profissionais.

---

## 🖥️ Como rodar o projeto localmente

### ▶️ Executando com Java

Pré-requisitos:

* Java 17+
* Maven

```bash
cd app
mvn spring-boot:run
```

Acesse:

```
http://localhost:8080
```

---

### 🐳 Executando com Docker

```bash
docker build -t project-01-ci-cd .
docker run -p 8080:8080 project-01-ci-cd
```

---

## 🤖 Como rodar via pipeline CI/CD

### 1️⃣ Configurar secrets no GitHub

No repositório, adicione os seguintes secrets:

* `DOCKER_USER` → usuário do Docker Hub
* `DOCKER_PASSWORD` → token ou senha do Docker Hub

### 2️⃣ Executar o pipeline

```bash
git push origin main
```

O pipeline será executado automaticamente, seguindo todas as etapas de CI/CD e segurança.

---

## 📁 Estrutura do Projeto

```bash
project-01-ci-cd/
├── app/
│   └── Código da aplicação Java
├── Dockerfile
├── .github/workflows/ci.yml
├── .env.example
└── README.md
```

---

## ✅ Critérios de Conclusão Atendidos

✔ Pipeline roda sem erro
✔ Imagem Docker publicada
✔ Scan de segurança com Trivy ativo
✔ Logs claros no pipeline
✔ README explica **o porquê**, não apenas o **como**

---

## 👨‍💻 Autor

**Daniel Viana**
GitHub: [https://github.com/danielviana2127](https://github.com/danielviana2127)

---

📌 *Este projeto faz parte de um plano de estudos focado em DevOps, CI/CD, segurança e boas práticas de engenharia de software.*

