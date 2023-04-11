group "default" {
  targets = [
    "aria2",
    "htpasswd",
    "httpie",
    "jenkins_agent_4_11_jdk11",
    "jenkins_agent_4_13_jdk8",
    "jenkins_agent_4_13_jdk11",
    "jenkins_agent_4_13_jdk8_aws",
    "jenkins_agent_4_13_jdk11_aws",
    "k8s_toolbox",
    "mdbook",
    "nginx_unprivileged",
    "nginx_unprivileged_alpine",
    "nmap",
    "render",
    "shellcheck",
    "skopeo",
    "squid",
    "toolbox_alpine",
    "toolbox_ubuntu",
    "toolbox_ubuntu_no_nc",
    "torproxy",
    "transmission"
  ]
}

variable "LABELS" {
  default = {
    "org.opencontainers.image.url" = "https://github.com/shinomineko/dockerfiles"
    "org.opencontainers.image.source" = "https://github.com/shinomineko/dockerfiles"
    "org.opencontainers.image.created" = timestamp()
    "org.opencontainers.image.revision" = "main"
  }
}

variable "REGISTRY" {
  default = "docker.io"
}

target "aria2" {
  context = "aria2"
  labels = merge("${LABELS}", {"org.opencontainers.image.title" = "aria2"})
  platforms = ["linux/amd64"]
  tags = [
    "${REGISTRY}/shinomineko/aria2:latest"
  ]
}

target "htpasswd" {
  context = "htpasswd"
  labels = merge("${LABELS}", {"org.opencontainers.image.title" = "htpasswd"})
  platforms = ["linux/amd64"]
  tags = [
    "${REGISTRY}/shinomineko/htpasswd:latest"
  ]
}

target "httpie" {
  context = "httpie"
  labels = merge("${LABELS}", {"org.opencontainers.image.title" = "httpie"})
  platforms = ["linux/amd64"]
  tags = [
    "${REGISTRY}/shinomineko/httpie:latest"
  ]
}

target "jenkins_agent_4_11_jdk11" {
  context = "jenkins-agent/4.11.2-4-jdk11"
  labels = merge("${LABELS}", {"org.opencontainers.image.title" = "jenkins-agent"})
  platforms = ["linux/amd64"]
  tags = [
    "${REGISTRY}/shinomineko/jenkins-agent:4.11.2-4-jdk11"
  ]
}

target "jenkins_agent_4_13_jdk8" {
  context = "jenkins-agent/4.13-jdk8"
  labels = merge("${LABELS}", {"org.opencontainers.image.title" = "jenkins-agent"})
  platforms = ["linux/amd64"]
  tags = [
    "${REGISTRY}/shinomineko/jenkins-agent:4.13-jdk8"
  ]
}
target "jenkins_agent_4_13_jdk11" {
  context = "jenkins-agent/4.13-jdk11"
  labels = merge("${LABELS}", {"org.opencontainers.image.title" = "jenkins-agent"})
  platforms = ["linux/amd64"]
  tags = [
    "${REGISTRY}/shinomineko/jenkins-agent:4.13-jdk11"
  ]
}

target "jenkins_agent_4_13_jdk8_aws" {
  context = "jenkins-agent/4.13-jdk8-aws"
  labels = merge("${LABELS}", {"org.opencontainers.image.title" = "jenkins-agent"})
  platforms = ["linux/amd64"]
  tags = [
    "${REGISTRY}/shinomineko/jenkins-agent:4.13-jdk8-aws"
  ]
}

target "jenkins_agent_4_13_jdk11_aws" {
  context = "jenkins-agent/4.13-jdk11-aws"
  labels = merge("${LABELS}", {"org.opencontainers.image.title" = "jenkins-agent"})
  platforms = ["linux/amd64"]
  tags = [
    "${REGISTRY}/shinomineko/jenkins-agent:4.13-jdk11-aws"
  ]
}

target "k8s_toolbox" {
  context = "k8s-toolbox/main"
  labels = merge("${LABELS}", {"org.opencontainers.image.title" = "k8s-toolbox"})
  platforms = ["linux/amd64"]
  tags = [
    "${REGISTRY}/shinomineko/k8s-toolbox:main"
  ]
}

target "mdbook" {
  context = "mdbook"
  labels = merge("${LABELS}", {"org.opencontainers.image.title" = "mdbook"})
  platforms = ["linux/amd64"]
  tags = [
    "${REGISTRY}/shinomineko/mdbook:latest"
  ]
}

target "nginx_unprivileged" {
  context = "nginx-unprivileged/mainline"
  labels = merge("${LABELS}", {"org.opencontainers.image.title" = "nginx-unprivileged"})
  platforms = ["linux/amd64"]
  tags = [
    "${REGISTRY}/shinomineko/nginx-unprivileged:mainline"
  ]
}

target "nginx_unprivileged_alpine" {
  context = "nginx-unprivileged/mainline-alpine"
  labels = merge("${LABELS}", {"org.opencontainers.image.title" = "nginx-unprivileged"})
  platforms = ["linux/amd64"]
  tags = [
    "${REGISTRY}/shinomineko/nginx-unprivileged:mainline-alpine"
  ]
}

target "nmap" {
  context = "nmap"
  labels = merge("${LABELS}", {"org.opencontainers.image.title" = "nmap"})
  platforms = ["linux/amd64"]
  tags = [
    "${REGISTRY}/shinomineko/nmap:latest"
  ]
}

target "render" {
  context = "render"
  labels = merge("${LABELS}", {"org.opencontainers.image.title" = "render"})
  platforms = ["linux/amd64"]
  tags = [
    "${REGISTRY}/shinomineko/render:latest"
  ]
}

target "shellcheck" {
  context = "shellcheck"
  labels = merge("${LABELS}", {"org.opencontainers.image.title" = "shellcheck"})
  platforms = ["linux/amd64"]
  tags = [
    "${REGISTRY}/shinomineko/shellcheck:latest"
  ]
}

target "skopeo" {
  context = "skopeo"
  labels = merge("${LABELS}", {"org.opencontainers.image.title" = "skopeo"})
  platforms = ["linux/amd64"]
  tags = [
    "${REGISTRY}/shinomineko/skopeo:latest"
  ]
}

target "squid" {
  context = "squid"
  labels = merge("${LABELS}", {"org.opencontainers.image.title" = "squid"})
  platforms = ["linux/amd64"]
  tags = [
    "${REGISTRY}/shinomineko/squid:latest"
  ]
}

target "toolbox_alpine" {
  context = "toolbox/alpine"
  labels = merge("${LABELS}", {"org.opencontainers.image.title" = "toolbox"})
  platforms = ["linux/amd64"]
  tags = [
    "${REGISTRY}/shinomineko/toolbox:alpine"
  ]
}

target "toolbox_ubuntu" {
  context = "toolbox/ubuntu"
  labels = merge("${LABELS}", {"org.opencontainers.image.title" = "toolbox"})
  platforms = ["linux/amd64"]
  tags = [
    "${REGISTRY}/shinomineko/toolbox:ubuntu"
  ]
}

target "toolbox_ubuntu_no_nc" {
  context = "toolbox/ubuntu-no-nc"
  labels = merge("${LABELS}", {"org.opencontainers.image.title" = "toolbox"})
  platforms = ["linux/amd64"]
  tags = [
    "${REGISTRY}/shinomineko/toolbox:ubuntu-no-nc"
  ]
}

target "torproxy" {
  context = "torproxy"
  labels = merge("${LABELS}", {"org.opencontainers.image.title" = "torproxy"})
  platforms = ["linux/amd64"]
  tags = [
    "${REGISTRY}/shinomineko/torproxy:latest"
  ]
}

target "transmission" {
  context = "transmission"
  labels = merge("${LABELS}", {"org.opencontainers.image.title" = "transmission"})
  platforms = ["linux/amd64"]
  tags = [
    "${REGISTRY}/shinomineko/transmission:latest"
  ]
}
