#!/bin/sh
echo $BASIC_AUTH_PASSWORD >> /tmp/password_arn
export file_content=$(cat /tmp/password_arn)
export PASSWORD=$(aws secretsmanager get-secret-value --secret-id $file_content | /usr/bin/jq .SecretString -r)

exec /app/main $@
