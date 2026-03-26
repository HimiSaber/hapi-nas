# hapi-nas

Minimal wrapper repository for building a Synology/NAS-friendly HAPI hub image via GitHub Actions and publishing it to GHCR.

## What this repo does

- Builds a multi-arch image for `linux/amd64` and `linux/arm64`
- Downloads the official HAPI release binary instead of cloning/building the upstream source on NAS
- Pushes the image to `ghcr.io/himisaber/hapi`
- Provides a simple `compose.yaml` for Synology Container Manager

## How to update HAPI

1. Open **Actions** in this repo
2. Run **build-and-push-hapi**
3. Fill `hapi_version`, e.g. `v0.16.4`
4. Wait for GHCR image to finish publishing
5. Update the NAS compose tag if needed, then redeploy

## First deployment

- Create `/volume1/docker/hapi/data` on NAS
- Copy `compose.yaml` into Synology Container Manager
- Replace `CLI_API_TOKEN`
- Deploy

## Image

- `ghcr.io/himisaber/hapi:v0.16.4`
- `ghcr.io/himisaber/hapi:latest`
