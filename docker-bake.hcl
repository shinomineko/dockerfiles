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

target "default" {
  matrix = {
    item = [
      { title = "aria2", ctx = "aria2/latest" },
      { title = "htpasswd", ctx = "htpasswd/latest" },
      { title = "httpie", ctx = "httpie/latest" },
      { title = "jenkins-agent", ctx = "jenkins-agent/3291.vb_131b_dc231fa_-1-jdk17" },
      { title = "jenkins-agent", ctx = "jenkins-agent/3291.vb_131b_dc231fa_-1-jdk17-aws" },
      { title = "jenkins-agent", ctx = "jenkins-agent/3291.vb_131b_dc231fa_-1-jdk17-jdk8" },
      { title = "jenkins-agent", ctx = "jenkins-agent/3291.vb_131b_dc231fa_-1-jdk17-jdk11" },
      { title = "k8s-toolbox", ctx = "k8s-toolbox/main" },
      { title = "mdbook", ctx = "mdbook/latest" },
      { title = "nginx-unprivileged", ctx = "nginx-unprivileged/mainline" },
      { title = "nginx-unprivileged", ctx = "nginx-unprivileged/mainline-alpine" },
      { title = "nmap", ctx = "nmap/latest" },
      { title = "render", ctx = "render/latest" },
      { title = "shellcheck", ctx = "shellcheck/latest" },
      { title = "skopeo", ctx = "skopeo/latest" },
      { title = "squid", ctx = "squid/latest" },
      { title = "toolbox", ctx = "toolbox/alpine" },
      { title = "toolbox", ctx = "toolbox/ubuntu" },
      { title = "toolbox", ctx = "toolbox/ubuntu-no-nc" },
      { title = "torproxy", ctx = "torproxy/latest" },
      { title = "transmission", ctx = "transmission/latest" },
    ]
  }

  name = replace(replace(item.ctx, "/", "-"), ".", "-")
  context = item.ctx
  platforms = [ "linux/amd64" ]
  labels = merge("${LABELS}", { "org.opencontainers.image.title" = item.title })
  tags = [
    "${REGISTRY}/${_replace_slash(item.ctx)}"
  ]
}
