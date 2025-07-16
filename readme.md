# 🚀 Riaan's Portfolio Site

This is a simple Node.js + Express portfolio website to showcase my projects, built with full DevSecOps principles including CI/CD, containerization, and Kubernetes deployment.

---

## 🛠 Tech Stack

* **Node.js**
* **Express.js**
* **HTML/CSS** (static assets)
* **Docker**
* **GitHub Actions**
* **Helm + Kubernetes (Minikube)**

---

## 📁 Project Structure

```
/portfolio-site
|-- app.js            # Express server
|-- /routes           # Route definitions
|-- /views            # HTML views
|-- /public           # Static CSS/JS assets
|-- Dockerfile        # Image build file
|-- .github/workflows # GitHub Actions CI config
|-- Helm Chart        # Kubernetes deployment via Helm
```

---

## 📈 SDLC Model

We are using the **Agile Kanban** model. Tasks are managed via GitHub Projects with iterative feedback loops.

---

## ✨ Features

* Homepage with about section
* Button links to GitHub projects
* Health check route for container readiness
* Dockerized app
* CI/CD with GitHub Actions
* Deployable to Minikube via Helm
* Static + dynamic security scans (Trivy & OWASP DC)

---

## 💻 Local Development

```bash
npm install
node app.js
```

Then access via:

```
http://localhost:3000
```

---

## 🐃 Running with Docker

```bash
docker build -t riaan-portfolio .
docker run -p 3000:3000 riaan-portfolio
```

---

## ⚙️ CI/CD Pipeline (GitHub Actions + Docker + Helm)

### CI/CD Steps:

1. **Checkout** from GitHub
2. **Install dependencies**
3. **Run Trivy FS scan** (static)
4. **Run OWASP Dependency Check** (node modules)
5. **Build Docker Image**
6. **Push to Docker Hub**
7. **Run Trivy Image scan** (dynamic)
8. **Deploy to Minikube via Helm** (if configured)

### Notes on Unsuccessful Attempts:

| Attempt                            | Status   | Notes                                                             |
| ---------------------------------- | -------- | ----------------------------------------------------------------- |
| Jenkins CI/CD pipeline             | ❌ Failed | Docker-in-Docker setup in Jenkins container caused runtime issues |
| SonarQube analysis (local + cloud) | ❌ Failed | API token integration issues persisted across Jenkins and GitHub  |
| Kubeconfig credentials in Jenkins  | ❌ Failed | Kubeconfig kind not appearing even after plugin installation      |

---

## 🛠 Tools & Technologies

| Tool           | Purpose                                 |
| -------------- | --------------------------------------- |
| GitHub Actions | CI/CD pipeline                          |
| Docker         | Build and run app as container          |
| OWASP DC       | Static security analysis                |
| Trivy          | Image & file system vulnerability scans |
| Helm           | Kubernetes deployment templating        |
| Minikube       | Local Kubernetes cluster for deployment |

---

## 🔐 Secrets & Credentials

| Credential           | Location              | Description                       |
| -------------------- | --------------------- | --------------------------------- |
| `DOCKERHUB_USERNAME` | GitHub Actions Secret | Docker Hub username               |
| `DOCKERHUB_TOKEN`    | GitHub Actions Secret | Docker Hub access token           |
| `KUBECONFIG_CONTENT` | GitHub Actions Secret | Kubeconfig base64 from Minikube   |
| `SONAR_TOKEN`        | Not working           | SonarQube token failed to connect |

---

## 📊 GitHub Actions Flow Diagram

```
[GitHub Push]
     └──> [GitHub Actions Workflow]
                 ├──> Install Node & Dependencies
                 ├──> Run Trivy & OWASP DC
                 ├──> Docker Build & Push
                 └──> Helm Deploy to Minikube (optional)
```

---

## ✅ Final Notes

This project highlights DevSecOps principles using a minimal Node.js app. It incorporates:

* CI/CD automation via GitHub Actions
* Static & dynamic security scanning
* Docker containerization
* Helm-based Kubernetes deployment

Jenkins and SonarQube steps were attempted but later skipped due to time and environment limitations.
