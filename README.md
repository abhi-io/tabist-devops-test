# tabist-devops-test


```
docker build -t tf-test .
docker run -it --rm -e AWS_ACCESS_KEY_ID="aaaaa" -e AWS_SECRET_ACCESS_KEY="bbbbb" -e AWS_REGION="ap-south-1" -v $(pwd):/app tf-test bash


```

testing
```
terraform state show module.ec2.module.ec2_cluster.aws_instance.this[0]
```