#!/usr/bin/env bash
set -eo pipefail

PUSH="${PUSH:-false}"
REPO="${REPO:-docker.io/shinomineko}"
SCRIPT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"
JOBS="${JOBS:-2}"
ERRORS="$(pwd)/errors"
GIT_COMMIT_HASH="$(git rev-parse HEAD)"

build_and_push() {
    base=$1
    suite=$2
    build_dir=$3

    echo "building ${REPO}/${base}:${suite} for context ${build_dir}"
    docker build --rm \
        --label "org.opencontainers.image.title=${base}" \
        --label "org.opencontainers.image.url=https://github.com/shinomineko/dockerfiles" \
        --label "org.opencontainers.image.source=https://github.com/shinomineko/dockerfiles" \
        --label "org.opencontainers.image.created=$(date --iso-8601=seconds)" \
        --label "org.opencontainers.image.revision=${GIT_COMMIT_HASH}" \
        -t "${REPO}/${base}:${suite}" "${build_dir}" || return 1

    echo "===================================================================="
    echo "successfully built ${REPO}/${base}:${suite} for context ${build_dir}"
    echo "===================================================================="

    if [[ "$PUSH" == true ]]; then
        docker push "${REPO}/${base}:${suite}"
    fi
}

do_file() {
    f=$1
    image=${f%Dockerfile}
    base=${image%%\/*}
    build_dir=$(dirname "$f")
    suite=${build_dir##*\/}

    if [[ -z "$suite" ]] || [[ "$suite" == "$base" ]]; then
        suite=latest
    fi

    {
        build_and_push "${base}" "${suite}" "${build_dir}"
    } || {
        echo "${base}:${suite}" >>"$ERRORS"
    }
}

main() {
    IFS=$'\n'
    mapfile -t files < <(find -L . -iname '*Dockerfile' | sed 's|./||' | sort)
    unset IFS

    echo "running in parallel with ${JOBS} jobs"
    parallel --verbose --tag --ungroup -j"${JOBS}" "$SCRIPT" do_file "{1}" ::: "${files[@]}"

    if [[ ! -f "$ERRORS" ]]; then
        echo "[OK] no errors"
    else
        echo "[ERROR] some images did not build correctly, see below." >&2
        echo "[ERROR] these images failed: $(cat "$ERRORS")" >&2
        exit 1
    fi
}

run() {
    args=$*
    f=$1

    if [[ "$f" == "" ]]; then
        main "$args"
    else
        $args
    fi
}

run "$@"
