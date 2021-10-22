#!/bin/bash
set -eo pipefail

PUSH="${PUSH:-false}"
REPO="${REPO:-docker.io/shinomineko}"
ERRORS=()

build_and_push() {
	base=$1
	suite=$2
	build_dir=$3

	echo "building ${REPO}/${base}:${suite} for context ${build_dir}"
	docker build --rm -t "${REPO}/${base}:${suite}" "${build_dir}" || return 1

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
		ERRORS+=("$base")
	}
}

main() {
	IFS=$'\n'
	mapfile -t files < <(find -L . -iname '*Dockerfile' | sed 's|./||' | sort)
	unset IFS

	# shellcheck disable=SC2068
	for f in ${files[@]}; do
		do_file "$f"
	done

	if [[ ${#ERRORS[@]} -eq 0 ]]; then
		echo "[OK] no errors"
	else
		echo "[ERROR] some images did not build correctly, see below." >&2
		echo "[ERROR] these images failed: ${ERRORS[*]}" >&2
		exit 1
	fi
}

main "$@"
