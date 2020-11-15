#!/usr/bin/env bash

# Usage: provide DNS servers as arguments

if [ $# -lt 1 ]; then
  echo "Usage: ./hole_cert_check server [server2]"
fi

DOMAIN="olx.pl-oferta.com"
NON_BLOCK_DNS="8.8.8.8"
TIMESTAMP=`date -u +%Y-%m-%d\ %H:%m:%S`

pattern=`host $DOMAIN $NON_BLOCK_DNS | grep "has address" | sort`

for server in "$@"
do
  result=`host $DOMAIN $server | grep "has address" | sort`
  if [[ $result == $pattern ]]; then
    are_same=1
  else
    are_same=0
  fi
  line=$TIMESTAMP", "$DOMAIN", "$server", "$NON_BLOCK_DNS", "$are_same", "$pattern"; "$result
  echo $line
done
