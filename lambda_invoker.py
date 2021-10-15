import json
import boto3

BUCKET_NAME = 'imagenet-sample'

s3 = boto3.resource('s3')
batchsize = 32

def lambda_handler(event, context):
    bucket = s3.Bucket(BUCKET_NAME)
    filenames = [file.key for file in bucket.objects.all() if len(file.key.split('/')[1]) > 1]

    return {
        'file_list': filenames,
        'batchsize': batchsize
    }
