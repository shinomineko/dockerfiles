variable "LABELS" {
  default = {
    "org.opencontainers.image.url" = "https://github.com/shinomineko/dockerfiles"
    "org.opencontainers.image.created" = timestamp()
    "org.opencontainers.image.revision" = "main"
  }
}

variable "REGISTRY" {
  default = "docker.io/shinomineko"
}

group "default" {
  targets = [
    "aria2",
    "htpasswd",
    "httpie",
    "jenkins-agent",
    "k8s-toolbox",
    "mdbook",
    "nginx",
    "nmap",
    "render",
    "shellcheck",
    "skopeo",
    "squid",
    "toolbox-alpine",
    "toolbox-debian",
    "torproxy",
    "transmission",
  ]
}

group "jenkins-agent" {
  targets = [
    "jenkins-agent-jdk17",
    "jenkins-agent-jdk17-aws",
    "jenkins-agent-jdk17-jdk8",
    "jenkins-agent-jdk17-jdk11",
  ]
}

group "nginx" {
  targets = [
    "nginx-unprivileged-mainline",
    "nginx-unprivileged-mainline-alpine",
  ]
}

group "mdbook" {
  targets = [
    "mdbook-latest",
    "mdbook-04"
  ]
}

target "aria2" {
  context = "aria2/latest"
  platforms = [
    "linux/amd64"
  ]
  labels = merge("${LABELS}", { "org.opencontainers.image.title" = "aria2" })
  tags = [
    "${REGISTRY}/aria2:latest"
  ]
}

target "htpasswd" {
  context = "htpasswd/latest"
  platforms = [
    "linux/amd64"
  ]
  labels = merge("${LABELS}", { "org.opencontainers.image.title" = "htpasswd" })
  tags = [
    "${REGISTRY}/htpasswd:latest"
  ]
}

target "httpie" {
  context = "httpie/latest"
  platforms = [
    "linux/amd64"
  ]
  labels = merge("${LABELS}", { "org.opencontainers.image.title" = "httpie" })
  tags = [
    "${REGISTRY}/httpie:latest"
  ]
}

target "jenkins-agent-jdk17" {
  context = "jenkins-agent/3291.vb_131b_dc231fa_-1-jdk17"
  platforms = [
    "linux/amd64"
  ]
  labels = merge("${LABELS}", { "org.opencontainers.image.title" = "jenkins-agent" })
  tags = [
    "${REGISTRY}/jenkins-agent:3291.vb_131b_dc231fa_-1-jdk17"
  ]
}

target "jenkins-agent-jdk17-aws" {
  context = "jenkins-agent/3291.vb_131b_dc231fa_-1-jdk17-aws"
  platforms = [
    "linux/amd64"
  ]
  labels = merge("${LABELS}", { "org.opencontainers.image.title" = "jenkins-agent" })
  tags = [
    "${REGISTRY}/jenkins-agent:3291.vb_131b_dc231fa_-1-jdk17-aws"
  ]
}

target "jenkins-agent-jdk17-jdk8" {
  context = "jenkins-agent/3291.vb_131b_dc231fa_-1-jdk17-jdk8"
  platforms = [
    "linux/amd64"
  ]
  labels = merge("${LABELS}", { "org.opencontainers.image.title" = "jenkins-agent" })
  tags = [
    "${REGISTRY}/jenkins-agent:3291.vb_131b_dc231fa_-1-jdk17-jdk8"
  ]
}

target "jenkins-agent-jdk17-jdk11" {
  context = "jenkins-agent/3291.vb_131b_dc231fa_-1-jdk17-jdk11"
  platforms = [
    "linux/amd64"
  ]
  labels = merge("${LABELS}", { "org.opencontainers.image.title" = "jenkins-agent" })
  tags = [
    "${REGISTRY}/jenkins-agent:3291.vb_131b_dc231fa_-1-jdk17-jdk11"
  ]
}

target "k8s-toolbox" {
  context = "k8s-toolbox/main"
  platforms = [
    "linux/amd64"
  ]
  labels = merge("${LABELS}", { "org.opencontainers.image.title" = "k8s-toolbox" })
  tags = [
    "${REGISTRY}/k8s-toolbox:main"
  ]
}

target "mdbook-latest" {
  context = "mdbook/latest"
  platforms = [
    "linux/amd64"
  ]
  labels = merge("${LABELS}", { "org.opencontainers.image.title" = "mdbook" })
  tags = [
    "${REGISTRY}/mdbook:latest"
  ]
}

target "mdbook-04" {
  context = "mdbook/0.4.52"
  platforms = [
    "linux/amd64"
  ]
  labels = merge("${LABELS}", { "org.opencontainers.image.title" = "mdbook" })
  tags = [
    "${REGISTRY}/mdbook:0.4.52"
  ]
}

target "nginx-unprivileged-mainline" {
  context = "nginx-unprivileged/mainline"
  platforms = [
    "linux/amd64"
  ]
  labels = merge("${LABELS}", { "org.opencontainers.image.title" = "nginx-unprivileged" })
  tags = [
    "${REGISTRY}/nginx-unprivileged:mainline"
  ]
}

target "nginx-unprivileged-mainline-alpine" {
  context = "nginx-unprivileged/mainline-alpine"
  platforms = [
    "linux/amd64"
  ]
  labels = merge("${LABELS}", { "org.opencontainers.image.title" = "nginx-unprivileged" })
  tags = [
    "${REGISTRY}/nginx-unprivileged:mainline-alpine"
  ]
}

target "nmap" {
  context = "nmap/latest"
  platforms = [
    "linux/amd64"
  ]
  labels = merge("${LABELS}", { "org.opencontainers.image.title" = "nmap" })
  tags = [
    "${REGISTRY}/nmap:latest"
  ]
}

target "render" {
  context = "render/latest"
  platforms = [
    "linux/amd64"
  ]
  labels = merge("${LABELS}", { "org.opencontainers.image.title" = "render" })
  tags = [
    "${REGISTRY}/render:latest"
  ]
}

target "shellcheck" {
  context = "shellcheck/latest"
  platforms = [
    "linux/amd64"
  ]
  labels = merge("${LABELS}", { "org.opencontainers.image.title" = "shellcheck" })
  tags = [
    "${REGISTRY}/shellcheck:latest"
  ]
}

target "skopeo" {
  context = "skopeo/latest"
  platforms = [
    "linux/amd64"
  ]
  labels = merge("${LABELS}", { "org.opencontainers.image.title" = "skopeo" })
  tags = [
    "${REGISTRY}/skopeo:latest"
  ]
}

target "squid" {
  context = "squid/latest"
  platforms = [
    "linux/amd64"
  ]
  labels = merge("${LABELS}", { "org.opencontainers.image.title" = "squid" })
  tags = [
    "${REGISTRY}/squid:latest"
  ]
}

target "toolbox-alpine" {
  context = "toolbox/alpine"
  platforms = [
    "linux/amd64"
  ]
  labels = merge("${LABELS}", { "org.opencontainers.image.title" = "toolbox" })
  tags = [
    "${REGISTRY}/toolbox:alpine"
  ]
}

target "toolbox-debian" {
  context = "toolbox/debian"
  platforms = [
    "linux/amd64"
  ]
  labels = merge("${LABELS}", { "org.opencontainers.image.title" = "toolbox" })
  tags = [
    "${REGISTRY}/toolbox:debian"
  ]
}

target "torproxy" {
  context = "torproxy/latest"
  platforms = [
    "linux/amd64"
  ]
  labels = merge("${LABELS}", { "org.opencontainers.image.title" = "torproxy" })
  tags = [
    "${REGISTRY}/torproxy:latest"
  ]
}

target "transmission" {
  context = "transmission/latest"
  platforms = [
    "linux/amd64"
  ]
  labels = merge("${LABELS}", { "org.opencontainers.image.title" = "transmission" })
  tags = [
    "${REGISTRY}/transmission:latest"
  ]
}
