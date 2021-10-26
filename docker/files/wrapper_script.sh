# Start the first process
#php-fpm -D
#status=$?
#if [ $status -ne 0 ]; then
#  echo "Failed to start PHP-FPM: $status"
#  exit $status
#fi

# Start the second process
./usr/sbin/nginx -g "daemon off;"
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start Nginx: $status"
  exit $status
fi

while /bin/true; do
  ps aux |grep php7.3-fpm |grep -q -v grep
  PROCESS_1_STATUS=$?
  ps aux |grep nginx |grep -q -v grep
  PROCESS_2_STATUS=$?
  # If the greps above find anything, they will exit with 0 status
  # If they are not both 0, then something is wrong
  if [ $PROCESS_1_STATUS -ne 0 -o $PROCESS_2_STATUS -ne 0 ]; then
    echo "One of the processes has already exited."
    exit -1
  fi
  sleep 60
done
