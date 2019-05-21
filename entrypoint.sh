#!/bin/sh

for i in `printenv | grep ^MMS_`
do
  KEY=$(echo $i| cut -d'_' -f 2 | cut -d'=' -f 1)
  VAL=$(echo $i| cut -d'=' -f 2)
  echo "Setting $KEY to $VAL"
  echo "$KEY=$VAL" >> local.config
done

./mongodb-mms-automation-agent --config=local.config