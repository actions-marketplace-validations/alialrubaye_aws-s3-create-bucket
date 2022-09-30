#!/bin/sh

export BUCKET_NAME=$1
export AWS_ACCESS_KEY_ID=$2
export AWS_SECRET_ACCESS_KEY=$3
export AWS_REGION=$4


if [ -z "${BUCKET_NAME}" ] || [ -z "${AWS_ACCESS_KEY_ID}" ] || [ -z "${AWS_SECRET_ACCESS_KEY}" ] || [ -z "${AWS_REGION}" ] 
then
    echo "Insufficient or improperly configured input for this Github Action"
    exit 1
else
  
  
    bucketstatus=$(aws s3api head-bucket --bucket ${BUCKET_NAME} 2>&1)
    if echo "${bucketstatus}" | grep 'Not Found';
    then
      echo "bucket doesn't exist..........................";
      aws s3api create-bucket \
        --bucket $BUCKET_NAME \
        --region $AWS_REGION \
        --create-bucket-configuration LocationConstraint=$AWS_REGION 
      echo "bucket bucket created successfully..............";  
    elif echo "${bucketstatus}" | grep 'Forbidden';
    then
      echo "Bucket exists but not owned"
    elif echo "${bucketstatus}" | grep 'Bad Request';
    then
      echo "Bucket name specified is less than 3 or greater than 63 characters"
    else
      echo "Bucket owned and exists";
    fi

fi
