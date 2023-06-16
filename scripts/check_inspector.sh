#!/bin/bash

if [ -z ${1} ]; then
  echo "usage : $0 <service-name> <region>" >2
  exit 1
fi

region_name=$1

# AWS Config (Reporting)
endpoint_count=`aws inspector list-assessment-templates --region ${region_name} --query 'length(assessmentTemplateArns)' --output text`

# If the value is greater than 0, that means Inspector is enabled in the region
if [ ${endpoint_count} -gt 0 ]; then
  result='true'
  printf '{"endpoint_exists": "%s"}\n' "$result"
else
  result='false'
  printf '{"endpoint_exists": "%s"}\n' "$result"
fi
