#!/bin/bash
set -eo pipefail

REPO="${REPO:-docker.io/shinomineko}"
ERRORS=()

build_and_push() {
	base=$1
	build_dir=$2

	echo "building ${REPO}/${base}:latest for context ${build_dir}"
	docker build --rm -t "${REPO}/${base}:latest" "${build_dir}" || return 1

	echo "========================================================"
	echo "successfully built ${REPO}/${base}:latest for context ${build_dir}"
	echo "========================================================"

	docker push "${REPO}/${base}:latest"
}

do_file() {
	f=$1
	image=${f%Dockerfile}
	base=${image%%\/*}
	build_dir=$(dirname "$f")

	{
		build_and_push "${base}" "${build_dir}"
	} || {
		ERRORS+=("$base")
	}
}

main() {
	IFS=$'\n'
	mapfile -t files < <(find -L . -iname '*Dockerfile' | sed 's|./||' | sort)
	unset IFS

	for f in ${files[@]}; do
		do_file $f
	done

	if [[ ${#ERRORS[@]} -eq 0 ]]; then
		echo "no errors"
	else
		echo "some images did not build correctly, see below." >&2
		echo "these images failed: ${ERRORS[*]}" >&2
		exit 1
	fi
}

main "$@"
