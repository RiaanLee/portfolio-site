# 🚀 Riaan's Portfolio Site

This is a simple Node.js + Express portfolio website to showcase my past projects.

---

## 🛠 Tech Stack

- Node.js  
- Express  
- HTML/CSS  

---

## 📁 Project Structure

- `/views` – HTML pages  
- `/public` – Static assets (CSS)  
- `/routes` – Routing logic  
- `app.js` – Main application file  

---

## 📈 SDLC Model

We are using the **Agile Kanban** model.  
All tasks are tracked on the GitHub Project board for transparency and iterative development.

---

## ✨ Features

- Static homepage with about section  
- Buttons linking to GitHub projects  
- Health check route for container readiness  

---

## 💻 Local Development

Run the following commands to start the app locally:

```bash
npm install
node app.js
Access the site via:

arduino
Copy
Edit
http://localhost:3000
🐳 Running with Docker
To containerize and run your app:

bash
Copy
Edit
docker build -t riaan-portfolio .
docker run -p 3000:3000 riaan-portfolio
⚙️ CI/CD Pipeline (Jenkins + Docker + Helm)
This project includes a CI/CD pipeline built with Jenkins that automates building, pushing, and deploying the application via Docker and Helm to a local Kubernetes cluster using Minikube.

📦 Pipeline Stages
Checkout from GitHub
Jenkins pulls code from the jenkins-ci branch.

Build Docker Image
Jenkins uses the Dockerfile to generate a container image.

Push to Docker Hub
The image is pushed to Docker Hub using secure credentials.

Deploy to Kubernetes (via Helm)
Jenkins uses Helm to deploy the app to Minikube.

🧰 Tools and Technologies
Tool	Purpose
🧪 Jenkins	Orchestrates the CI/CD pipeline
🐋 Docker	Containers the Node.js application
📦 Helm	Manages Kubernetes deployments
☸️ Minikube	Provides a local Kubernetes cluster
🐙 GitHub	Hosts code and Jenkins pipeline config

🔐 Credentials Management
Docker Hub
Stored in Jenkins as dockerhub-creds. Used for login during push.

GitHub
If private, credentials (PAT or username/password) should also be stored in Jenkins.

🧭 CI/CD Flow Diagram
text
Copy
Edit
[GitHub Repo] 
     │
     ▼
[Jenkins Pipeline]
     ├── Stage 1: Build Docker Image
     ├── Stage 2: Push to Docker Hub
     └── Stage 3: Deploy via Helm to Minikube
✅ Final Notes
This project is both a portfolio showcase and a full-stack DevOps demo.
It highlights core principles like containerization, CI/CD, and Git-based workflow using a simple but structured tech stack.

For any issues or suggestions, feel free to open a pull request or issue in the GitHub repo.