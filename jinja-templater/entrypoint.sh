#!/bin/bash
set -eo pipefail

TEMPLATE_SRC="$1"
TEMPLATE_DEST="$2"
EXTRA_VARS_FILE="$3"

do_tmpuser() {
	id
	echo "tmpuser:x:$(id -u):$(id -g):,,,:${HOME}:/bin/bash" >> /etc/passwd
	echo "tmpuser:x:$(id -G | cut -d' ' -f2)" >> /etc/group
}

do_template() {
	echo "======================================"
	echo "template src: ${TEMPLATE_SRC}"
	echo "template dest: ${TEMPLATE_DEST}"
	echo "extra vars file: ${EXTRA_VARS_FILE}"
	echo "======================================"

	ansible localhost -m template \
	-a "src=${TEMPLATE_SRC} dest=${TEMPLATE_DEST}" \
	-e @"${EXTRA_VARS_FILE}"
}

main() {
	if [[ "$#" -ne 3 ]]; then
		usage
		exit 1
	fi

	do_tmpuser
	do_template
}

usage() {
	echo -e "usage example:\n\tdocker run --rm -v \"\$(pwd):/src\" -u \"\$(id -u)\" jinja-templater <src.j2> <dest> <extra-vars-file>"
}

main "$@"
