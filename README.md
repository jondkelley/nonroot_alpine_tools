# nonroot_alpine_tools

You shouldn't run things in your Docker containers as root.

This is a Docker image based on the [`alpine:3.15` base
image](https://registry.hub.docker.com/_/alpine/) that adds a
`nobody` user with UID 1000.

It is available on the Docker Hub as
[`jondkelley/nonroot_alpine_tools`](https://registry.hub.docker.com/u/jondkelley/nonroot_alpine_tools/).

You can apply this in kubernetes with:

`kubectl apply -f alpine-k8s.yaml`

You can use this in kubernetes with:

`kubectl exec -ti alpine-1000 -- sh`

