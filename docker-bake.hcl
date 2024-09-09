variable "LABELS" {
  default = {
    "org.opencontainers.image.url" = "https://github.com/shinomineko/dockerfiles"
    "org.opencontainers.image.source" = "https://github.com/shinomineko/dockerfiles"
    "org.opencontainers.image.created" = timestamp()
    "org.opencontainers.image.revision" = "main"
  }
}

variable "REGISTRY" {
  default = "docker.io/shinomineko"
}

function "_replace_slash" {
  params = [str]
  result = replace(str, "/", ":")
}

function "make_tags" {
  params = [ctx]
  result = contains([ctx], "/") ? [ "${REGISTRY}/${_replace_slash(ctx)}" ] : [ "${REGISTRY}/${ctx}:latest" ]
}

target "default" {
  matrix = {
    item = [
      { title = "aria2", ctx = "aria2" },
      { title = "htpasswd", ctx = "htpasswd" },
      { title = "httpie", ctx = "httpie" },
      { title = "jenkins-agent", ctx = "jenkins-agent/4.13-jdk11" },
      { title = "jenkins-agent", ctx = "jenkins-agent/4.13-jdk11-aws" },
      { title = "jenkins-agent", ctx = "jenkins-agent/4.13-jdk8" },
      { title = "jenkins-agent", ctx = "jenkins-agent/4.13-jdk8-aws" },
      { title = "k8s-toolbox", ctx = "k8s-toolbox/main" },
      { title = "mdbook", ctx = "mdbook" },
      { title = "nginx-unprivileged", ctx = "nginx-unprivileged/mainline" },
      { title = "nginx-unprivileged", ctx = "nginx-unprivileged/mainline-alpine" },
      { title = "nmap", ctx = "nmap" },
      { title = "render", ctx = "render" },
      { title = "shellcheck", ctx = "shellcheck" },
      { title = "skopeo", ctx = "skopeo" },
      { title = "squid", ctx = "squid" },
      { title = "toolbox", ctx = "toolbox/alpine" },
      { title = "toolbox", ctx = "toolbox/ubuntu" },
      { title = "toolbox", ctx = "toolbox/ubuntu-no-nc" },
      { title = "torproxy", ctx = "torproxy" },
      { title = "transmission", ctx = "transmission" },
    ]
  }

  name = replace(replace(item.ctx, "/", "-"), ".", "-")
  context = item.ctx
  platform = [ "linux/amd64" ]
  labels = merge("${LABELS}", { "org.opencontainers.image.title" = item.title })
  tags = make_tags(item.ctx)
}
