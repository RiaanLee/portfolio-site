Riaan's Portfolio Site
This is a personal portfolio website built using Node.js and Express. It showcases a selection of my past projects and is designed to support both local development and automated deployment using modern DevOps tools.

Tech Stack
Node.js – Backend runtime

Express.js – Web framework

HTML/CSS – Frontend content and styling

Project Structure
/views – HTML pages rendered by Express

/public – Static assets like CSS

/routes – Routing logic

app.js – Main application file

SDLC Model
This project follows the Agile Kanban approach:

Tasks are tracked using the GitHub Project board

Features are implemented in small, iterative updates

CI/CD automates testing and deployment

Features
Static homepage with welcome message and about section

Project buttons linking to GitHub repositories

Health-check route for readiness probes (e.g., /healthz)

Local Development
To run locally:

bash
Copy
Edit
npm install
node app.js
Open your browser and go to http://localhost:3000.

Docker Instructions
To build and run the app using Docker:

bash
Copy
Edit
docker build -t riaan-portfolio .
docker run -p 3000:3000 riaan-portfolio
CI/CD Pipeline Overview
The application uses a Jenkins pipeline with the following stages:

Checkout from GitHub

Build Docker Image

Push to Docker Hub

Deploy using Helm on Minikube

Tools & Technologies Used
Tool	Purpose
Jenkins	CI/CD automation
Docker	Containerization
Helm	Kubernetes deployment
Minikube	Local Kubernetes cluster
GitHub	Source code and Jenkinsfile repository

Credentials Management
Docker Hub Login: Managed securely in Jenkins under dockerhub-creds

GitHub Access: If the repo is private, credentials are also stored in Jenkins securely

Deployment Workflow Summary
text
Copy
Edit
GitHub (push) 
   │
   ▼
Jenkins Pipeline
   ├── Build Docker image
   ├── Push to Docker Hub
   └── Deploy with Helm to Minikube
Final Notes
This project is both a technical showcase and a live example of a full DevOps workflow. It demonstrates:

Clean code separation (routes, views, assets)

Automated builds and deployments

Kubernetes-based container orchestration with Helm

