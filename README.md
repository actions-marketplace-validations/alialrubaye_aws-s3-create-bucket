# AWS S3 Create Bucket for Github Actions

A Github Action that let's you create a new AWS S3 bucket on demand during your workflows.

## Usage

This is a sample usage of this action that you can adapt / modify and copy to your workflow:

```yaml
- name: Create bucket and validate if it's laready existed
  uses: alialrubaye/aws-s3-create-bucket@v1.2.0
  with:
    bucket-name: 'my-unique-name-for-my-bucket'
    aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
    aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
    aws-region: 'us-east-2'

```

## Inputs

The following are the valid input arguments for this action:

|Name|Description|
|----|-----------|
|`bucket-name`|Name for the new bucket (make sure it's an unique name)|
|`aws-access-key-id`|AWS Secret Key ID, part of the credentials to be used during bucket creation. Please pass these through secret environment variables.
|`aws-secret-access-key`|AWS Secret Access Key, part of the credentials to be used during bucket creation. Please pass these through secret environment variables.
|`aws-region`|Region where the bucket will live. Default: `us-east-1`|

