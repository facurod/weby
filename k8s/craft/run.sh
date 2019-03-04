#!/bin/bash

set -e

source /scripts/copy.sh
source /scripts/helpers.sh
source /scripts/database.sh
source /scripts/composer.sh
source /scripts/plugins.sh

copy_files &&
  check_database &&
	update_dependencies &&
	activate_plugins

wait

h2 "✅  Visit http://localhost or http://<docker-machine-ip> to start using Craft CMS."

# Start php-fpm
exec "$@"