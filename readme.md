# Riaan's Portfolio Site

This is a simple Node.js + Express portfolio website to showcase my past projects.

## 🛠 Tech Stack
- Node.js
- Express
- HTML/CSS

## 📌 Project Structure
- `/views`: HTML pages
- `/public`: Static files (CSS)
- `/routes`: Routing logic
- `app.js`: Main app file

## 📈 SDLC Model
We are using **Agile Kanban**. Tasks are tracked in the GitHub Project board.

## 🧪 Features (WIP)
- Static homepage
- Project links
- Health check route

## 💻 Local Development

```bash
npm install
node app.js
## 🐳 Running with Docker

### Build the image:
```bash
docker build -t riaan-portfolio .

## 🚀 CI/CD Pipeline (Automated Deployment via Jenkins)

This project uses a Jenkins-based CI/CD pipeline to automatically build, publish, and deploy the Node.js portfolio application using Docker and Helm.

### 📦 Pipeline Stages

1. **Build**  
   Jenkins uses the `Dockerfile` to build a production-ready image of the portfolio app.

2. **Push to Docker Hub**  
   The Docker image is pushed to Docker Hub using secure credentials.

3. **Deploy via Helm on Minikube**  
   Jenkins uses Helm to deploy the Docker image into a local Kubernetes cluster (Minikube).

---

### 🛠️ Tools & Technologies

| Tool        | Purpose                             |
|-------------|-------------------------------------|
| **Jenkins** | CI/CD orchestration                 |
| **Docker**  | Containerization of the Node.js app |
| **Helm**    | Kubernetes deployment templating    |
| **Minikube**| Local Kubernetes cluster            |
| **GitHub**  | Source code and Jenkinsfile repo    |

---

### 🔐 Credentials Management

- **Docker Hub Login**  
  Managed using a Jenkins credential with ID: `dockerhub-creds`  
  (Stored securely via Jenkins Credential Manager)

- **GitHub Access**  
  If the repo is private, GitHub credentials can also be stored in Jenkins under a global credential and referenced during job setup.

---

### 🧭 CI/CD Flow Diagram (Text Version)

```text
[GitHub Repo] 
     │
     ▼
[Jenkins Pipeline]
     ├── Stage 1: Build Docker Image
     ├── Stage 2: Push to Docker Hub
     └── Stage 3: Deploy via Helm to Minikube
