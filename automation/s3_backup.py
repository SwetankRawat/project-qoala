import boto3
import os
import datetime

def backup_s3_bucket(bucket_name, backup_folder):
    s3 = boto3.client('s3')
    objects = s3.list_objects_v2(Bucket=bucket_name)['Contents']
    if not os.path.exists(backup_folder):
        os.makedirs(backup_folder)

    for obj in objects:
        key = obj['Key']
        backup_file = os.path.join(backup_folder, key.replace('/', '_') + '_' + datetime.datetime.now().strftime("%Y%m%d_%H%M%S"))

        s3.download_file(bucket_name, key, backup_file)
        print(f"Backup of {key} completed. File saved as {backup_file}")

if __name__ == "__main__":
    bucket_name = 'your_bucket_name' 
    backup_folder = 'backup'
    backup_s3_bucket(bucket_name, backup_folder)
