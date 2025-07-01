# README

A basic project conversation app that allows users to comment on a given project, change its status and have the history shown.

## Setup

[Development completed using Docker]

From the repo root, run:

```
docker compose build
docker compose up -d
docker compose exec app rails db:migrate db:seed
```

## Access

From within a browser, http://localhost:3000/
