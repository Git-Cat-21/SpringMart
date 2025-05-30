# SpringMart 

SpringMart is a basic Spring Boot application designed to simulate an e-commerce management system. 
This project is built using `Java`, `Spring Boot`, and `Maven`, and follows a `MVC` architecture with clear separation of concerns (Controller, Service, Repository layers).

# Usage 
```bash 
git clone git@github.com:Git-Cat-21/SpringMart.git
cd SpringMart
```
### Build and run with Maven
```bash
./mvnw clean install 
./mvnw spring-boot:run
```

### Build and run with Docker image
```bash
docker build . -t springmart 
docker run -it --rm -p 8080:8080 springmart
```

### Kubernetes Setup
### Create a namespace for the app and  Deploy application and service 
```bash
kubectl create ns example-app
kubectl apply -n example-app -f ./deployment
```

### Check pod status and Get the service info 
```bash
kubectl -n example-app get pods
kubectl -n example-app get svc
```

### Forward port 80 of the service to local port 8080
```bash
kubectl port-forward svc/example-service 8080:80 -n example-app
```

## Database Structure
![Database Structure](src/main/resources/templates/dbstructure.png "Database structre")


## Workflow Structure
![Workflow Structure](src/main/resources/templates/workflow.png "Workflow structre title")

