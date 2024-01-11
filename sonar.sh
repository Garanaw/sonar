#!/bin/bash

WORKING_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#source <(sed -E -n 's/[^#]+/export &/ p' .env)
source .env

export PATH="${PATH}":"${WORKING_DIR}"/sonar-scanner/bin/

COMMAND=$1
shift

case "$COMMAND" in
	config)
		echo "This commands have to be run with sudo"
		echo "sysctl -w vm.max_map_count=262144"
		echo "sysctl -w fs.file-max=65536"
		echo "ulimit -n 65536"
		echo "ulimit -u 4096"
		;;
	up)
		docker-compose up
		;;
	daemon)
		docker-compose up -d
		;;
	down)
		docker-compose down
		;;
	howto)
		echo "sonar-scanner -Dsonar.projectKey={project_key} -Dsonar.host.url=http://localhost:9000 -Dsonar.login={project_token}"
		;;
esac
