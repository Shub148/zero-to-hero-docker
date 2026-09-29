# 🐳 Docker Task Manager

A simple Python Flask REST API created to practice **Docker containerization**, Docker images, containers, and publishing images to **Docker Hub**.

This project demonstrates the basic Docker workflow from creating a `Dockerfile` to building, running, tagging, pushing, pulling, and running a Docker image from Docker Hub.

---

## 📌 Project Structure

```text
docker-task-manager/
│
├── app.py
├── requirements.txt
├── Dockerfile
└── README.md
```

---

## 🛠️ Technologies Used

* Python
* Flask
* Docker
* Docker Hub
* Git & GitHub

---

# 🐍 Step 1: Create the Application

The application is a Python Flask API.

Run the application locally:

```bash
python app.py
```

The application runs on:

```text
http://localhost:8000
```

---

# 🐳 Step 2: Create a Dockerfile

Create a file named:

```text
Dockerfile
```

Example:

```dockerfile
FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["python", "app.py"]
```

### Dockerfile explanation

| Instruction | Purpose                                             |
| ----------- | --------------------------------------------------- |
| `FROM`      | Specifies the base image                            |
| `WORKDIR`   | Sets the working directory inside the container     |
| `COPY`      | Copies files into the image                         |
| `RUN`       | Executes commands while building the image          |
| `EXPOSE`    | Documents the port used by the application          |
| `CMD`       | Specifies the command used to start the application |

---

# 🏗️ Step 3: Build the Docker Image

Build the image using:

```bash
docker build -t docker-image .
```

### What does `.` mean?

The dot means:

```text
Current directory
```

Docker looks for the `Dockerfile` and application files in the current directory.

The structure is:

```text
docker build -t <image-name> <build-context>
```

Example:

```bash
docker build -t docker-image .
```

---

# 🔍 Step 4: Check Docker Images

To see the images available on your computer:

```bash
docker images
```

Example:

```text
REPOSITORY     TAG       IMAGE ID
docker-image   latest    xxxxxxx
```

---

# 🚀 Step 5: Run the Docker Container

Run the image as a container:

```bash
docker run -d -p 8000:8000 --name task-manager docker-image
```

### Command explanation

```text
docker run
```

Creates and starts a container.

```text
-d
```

Runs the container in detached/background mode.

```text
-p 8000:8000
```

Maps:

```text
Host port : Container port
```

So:

```text
8000 → 8000
```

```text
--name task-manager
```

Gives the container the name `task-manager`.

```text
docker-image
```

Specifies the Docker image used to create the container.

---

# 🔎 Step 6: Check Running Containers

```bash
docker ps
```

You should see something similar to:

```text
CONTAINER ID   IMAGE          PORTS
xxxxxxxx       docker-image   0.0.0.0:8000->8000/tcp
```

Now open:

```text
http://localhost:8000
```

---

# 🐳 Step 7: Login to Docker Hub

First, log in to Docker Hub:

```bash
docker login
```

Enter your Docker Hub username and password/token.

If authentication is successful:

```text
Login Succeeded
```

---

# 🏷️ Step 8: Tag the Docker Image

Docker Hub expects images to follow this format:

```text
USERNAME/REPOSITORY:TAG
```

For example:

```text
shubham123/docker-task-manager:latest
```

Tag the existing image:

```bash
docker tag docker-image:latest YOUR_USERNAME/docker-task-manager:latest
```

Example:

```bash
docker tag docker-image:latest shubham123/docker-task-manager:latest
```

Check your images:

```bash
docker images
```

You should now see:

```text
REPOSITORY                          TAG
docker-image                       latest
shubham123/docker-task-manager     latest
```

---

# 📤 Step 9: Push the Image to Docker Hub

Push the tagged image:

```bash
docker push YOUR_USERNAME/docker-task-manager:latest
```

Example:

```bash
docker push shubham123/docker-task-manager:latest
```

Docker will upload the image layers to Docker Hub.

After a successful upload, you will see a digest similar to:

```text
latest: digest: sha256:xxxxxxxx...
```

The Docker image is now available on Docker Hub.

---

# 📥 Step 10: Pull the Image from Docker Hub

To download the image:

```bash
docker pull YOUR_USERNAME/docker-task-manager:latest
```

Example:

```bash
docker pull shubham123/docker-task-manager:latest
```

---

# ▶️ Step 11: Run the Docker Hub Image

After pulling the image:

```bash
docker run -d -p 8000:8000 --name task-manager YOUR_USERNAME/docker-task-manager:latest
```

Example:

```bash
docker run -d -p 8000:8000 --name task-manager shubham123/docker-task-manager:latest
```

Open:

```text
http://localhost:8000
```

If the application works, the image has successfully been:

```text
Built → Tagged → Pushed → Pulled → Run
```

---

# 🔄 Complete Docker Workflow

```text
              Dockerfile
                  │
                  ▼
          docker build -t
                  │
                  ▼
            Docker Image
                  │
                  ▼
            docker run
                  │
                  ▼
           Docker Container
                  │
                  │
                  ▼
            docker tag
                  │
                  ▼
             Docker Hub
                  │
             docker push
                  │
                  ▼
          Docker Hub Image
                  │
             docker pull
                  │
                  ▼
          Docker Container
```

---

# 🧠 Important Docker Commands

### Build image

```bash
docker build -t image-name .
```

### List images

```bash
docker images
```

### Run container

```bash
docker run -d -p 8000:8000 --name container-name image-name
```

### List running containers

```bash
docker ps
```

### List all containers

```bash
docker ps -a
```

### View container logs

```bash
docker logs container-name
```

### Stop container

```bash
docker stop container-name
```

### Remove container

```bash
docker rm container-name
```

### Login to Docker Hub

```bash
docker login
```

### Tag image

```bash
docker tag image-name USERNAME/REPOSITORY:TAG
```

### Push image

```bash
docker push USERNAME/REPOSITORY:TAG
```

### Pull image

```bash
docker pull USERNAME/REPOSITORY:TAG
```

---

# 🎯 Learning Objectives

This project was created to understand:

* How to create a Dockerfile
* How to choose a base image
* How Docker builds an image
* Difference between Docker image and container
* Port mapping
* Docker image tagging
* Docker Hub authentication
* Pushing images to Docker Hub
* Pulling images from Docker Hub
* Running a Docker Hub image

---

## 👨‍💻 Author

**Shubham Yadav**

B.Tech Computer Science Engineering Student

---

## ⭐ Next Steps

Possible improvements for this project:

* Add PostgreSQL
* Use Docker Compose
* Add environment variables
* Add Docker volumes
* Add `.dockerignore`
* Add GitHub Actions CI/CD
* Automatically build and push the Docker image to Docker Hub
* Deploy the application on AWS EC2
