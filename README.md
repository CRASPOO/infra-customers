# infra-customers

Infra da aplicação de clientes - Customer Management Application Infrastructure

## Overview

This is a Java-based Spring Boot application for managing customer data with complete infrastructure setup including Docker containerization, Kubernetes deployment, and CI/CD pipeline.

## Tech Stack

- **Java 17**
- **Spring Boot 3.2.0**
- **Spring Data JPA**
- **PostgreSQL**
- **Maven**
- **Docker & Docker Compose**
- **Kubernetes**

## Features

- RESTful API for customer management (CRUD operations)
- PostgreSQL database integration
- Health checks and metrics via Spring Boot Actuator
- Docker containerization
- Kubernetes deployment configurations
- CI/CD pipeline with GitHub Actions

## Prerequisites

- Java 17 or higher
- Maven 3.6+
- Docker and Docker Compose (for containerized deployment)
- Kubernetes cluster (for K8s deployment)

## Getting Started

### Local Development

1. **Clone the repository**
   ```bash
   git clone https://github.com/CRASPOO/infra-customers.git
   cd infra-customers
   ```

2. **Build the project**
   ```bash
   mvn clean install
   ```

3. **Run the application**
   ```bash
   mvn spring-boot:run
   ```

   The application will be available at `http://localhost:8080`

### Using Docker Compose

1. **Start the application with database**
   ```bash
   docker-compose up -d
   ```

2. **Stop the application**
   ```bash
   docker-compose down
   ```

### Building Docker Image

```bash
docker build -t craspoo/infra-customers:latest .
```

## API Endpoints

- `GET /api/customers` - Get all customers
- `GET /api/customers/{id}` - Get customer by ID
- `POST /api/customers` - Create new customer
- `PUT /api/customers/{id}` - Update customer
- `DELETE /api/customers/{id}` - Delete customer

### Health Check
- `GET /actuator/health` - Application health status

## Kubernetes Deployment

1. **Apply Kubernetes configurations**
   ```bash
   kubectl apply -f k8s/postgres-deployment.yml
   kubectl apply -f k8s/secret.yml
   kubectl apply -f k8s/deployment.yml
   kubectl apply -f k8s/service.yml
   ```

2. **Check deployment status**
   ```bash
   kubectl get pods
   kubectl get services
   ```

## Configuration

Application configuration can be modified in `src/main/resources/application.yml`

### Environment Variables

- `DATABASE_URL` - Database connection URL (default: jdbc:postgresql://localhost:5432/customers)
- `DATABASE_USER` - Database username (default: postgres)
- `DATABASE_PASSWORD` - Database password (default: postgres)
- `SERVER_PORT` - Server port (default: 8080)

## Testing

Run tests using Maven:
```bash
mvn test
```

## CI/CD

The project includes a GitHub Actions workflow that:
- Builds the application
- Runs tests
- Creates Docker image
- Pushes to Docker Hub (on main branch)

## Project Structure

```
infra-customers/
├── src/
│   ├── main/
│   │   ├── java/com/craspoo/customers/
│   │   │   ├── controller/
│   │   │   ├── model/
│   │   │   ├── repository/
│   │   │   ├── service/
│   │   │   └── CustomersApplication.java
│   │   └── resources/
│   │       └── application.yml
│   └── test/
├── k8s/
│   ├── deployment.yml
│   ├── service.yml
│   ├── secret.yml
│   └── postgres-deployment.yml
├── .github/
│   └── workflows/
│       └── ci.yml
├── Dockerfile
├── docker-compose.yml
└── pom.xml
```

## License

This project is part of CRASPOO infrastructure.
