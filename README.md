# EE-Demo-App

A very quick demonstration app to use as part of CI/CD Demos

This app has 2 microservices:

- Frontend - Flask Web App
- Backend - Redis

Frontend shows a picture of Moby or Molly Whale, and counts the number of
Clicks. Each click of the whale, increments a value in a redis database.

The table below the whale, shows how many clicks we have recieved in previous
interactions.

This repo includes a buildspec.yml for AWS CodeBuild.
