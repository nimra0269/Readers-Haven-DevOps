# Readers' Haven Public Library

A responsive, five-page static website for a fictional public library. Plain HTML and CSS provide the pages; Parcel builds them into `dist/`, and the multi-stage Dockerfile serves only those built files with Nginx.

## Pages

- Home: mission, location, hours, and site navigation
- Collections: four categories with three featured titles each
- Membership: three PKR-priced plans, loan limits, periods, and late-return policy
- Digital services: catalogue, e-books, study rooms, printing/scanning, and Wi-Fi
- Contact: contact details and a static feedback form

## Individual submission

This version is completed as one student's project: it includes all five assigned pages and the shared project files. Group rosters, member assignments, approvals, and other students' evidence are intentionally omitted.

## Build locally

Requires Node.js 22 and npm. Install from the committed lockfile and build all pages:

```sh
npm ci
npm run build
```

The generated pages are in `dist/`; this directory is intentionally ignored by Git.

## Run with Docker

Build and start the site from the repository root:

```sh
docker image build -t readers-haven-nimra:individual .
docker container run -d --name readers-haven-nimra-local -p 8080:80 readers-haven-nimra:individual
```

Open `http://localhost:8080`. Stop and remove the container when finished:

```sh
docker container stop readers-haven-nimra-local
docker container rm readers-haven-nimra-local
```

## Docker Hub publishing (optional)

Create a public Docker Hub repository, authenticate using a Docker Hub access token, then tag and push using your lowercase Docker Hub username:

```sh
docker login --username YOUR_DOCKERHUB_USERNAME
docker image build -t YOUR_DOCKERHUB_USERNAME/readers-haven-nimra:v1-individual .
docker image push YOUR_DOCKERHUB_USERNAME/readers-haven-nimra:v1-individual
```

Never put access tokens or passwords in this repository. GitHub branch protection, remote pull requests, registry publication, and screenshots require your own accounts and machine; no group members or evidence have been invented for this individual version.
