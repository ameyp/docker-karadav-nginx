# Docker image for using karadav with nginx

## About

This repository produces a docker image with [KaraDAV](https://github.com/kd2org/karadav) installed. It uses [linuxserver/docker-baseimage-alpine-nginx](https://github.com/linuxserver/docker-baseimage-alpine-nginx) as a base image, so all configuration supported by that image are also supported by this one.

Additionally, it supports the following environment variables for configuration:

- `KARADAV_WEB_URL`: The endpoint where KaraDAV will eventually be accessible. KaraDAV uses this for all redirects, so if you use this inside Kubernetes with an Ingress, set this to your Ingress endpoint. For example, `https://karadav.yourdomain.com`.

## License

This repository uses code adapted from [linuxserver/docker-nextcloud](https://github.com/linuxserver/docker-nextcloud), and hence is licensed under GPL-3.0 to match the code it is based on.
