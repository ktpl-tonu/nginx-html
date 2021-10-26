# Start the first process
./usr/sbin/php-fpm7.3 -D
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to PHP-FPM: $status"
  exit $status
fi

# Start the second process
.//usr/sbin/nginx -g "daemon off;"
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start Nginx: $status"
  exit $status
fi
