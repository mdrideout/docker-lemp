#!/bin/bash

# Start PHP-fpm
echo "Starting PHP-fpm "
service php7.3-fpm start
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start PHP-fpm: $status"
  exit $status
fi

# Start nginx
echo "Starting nginx .... "
nginx -g "daemon off;"
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start nginx: $status"
  exit $status
fi

# # Keep Running
# tail -f /dev/null