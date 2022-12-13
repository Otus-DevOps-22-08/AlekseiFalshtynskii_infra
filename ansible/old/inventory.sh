#!/bin/bash
app_ip=$(yc compute instance get reddit-app --format=json | jq -r '.network_interfaces[0].primary_v4_address.one_to_one_nat.address')
db_ip=$(yc compute instance get reddit-db --format=json | jq -r '.network_interfaces[0].primary_v4_address.one_to_one_nat.address')
echo '{
    "app": {
        "hosts": [
            "'$app_ip'"
        ]
    },
    "db": {
        "hosts": [
            "'$db_ip'"
        ]
    }
}'
