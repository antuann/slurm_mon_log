#!/bin/sh
token=$(/usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s kibana)
/usr/share/kibana/bin/kibana-setup --enrollment-token $token


