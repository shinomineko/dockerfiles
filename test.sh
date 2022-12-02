#!/usr/bin/env bash
set -eo pipefail

VALIDATE_REPO="https://github.com/shinomineko/dockerfiles.git"
VALIDATE_BRANCH="main"
VALIDATE_HEAD="$(git rev-parse --verify HEAD)"

git fetch -q "$VALIDATE_REPO" "refs/heads/${VALIDATE_BRANCH}"
VALIDATE_UPSTREAM="$(git rev-parse --verify FETCH_HEAD)"
VALIDATE_COMMIT_DIFF="${VALIDATE_UPSTREAM}...${VALIDATE_HEAD}"

validate_diff() {
	if [[ "$VALIDATE_UPSTREAM" != "$VALIDATE_HEAD" ]]; then
		git diff "$VALIDATE_COMMIT_DIFF" "$@"
	else
		git diff HEAD~ "$@"
	fi
}

IFS=$'\n'
# shellcheck disable=SC2207
changed_files=( $(validate_diff --name-only -- '*Dockerfile') )
unset IFS

# shellcheck disable=SC2068
for f in ${changed_files[@]}; do
	if ! [[ -e "$f" ]]; then
		continue
	fi

	build_dir=$(dirname "$f")
	base="${build_dir%%\/*}"
	suite=${build_dir##*\/}

	if [[ -z "$suite" ]] || [[ "$suite" == "$base" ]]; then
		suite=latest
	fi

	(
	set -x
	docker build -t "${base}:${suite}" "${build_dir}"
	)

	echo "============================================================"
	echo "successfully built ${base}:${suite} for context ${build_dir}"
	echo "============================================================"
done
