# EC2
alias ec2ls="aws ec2 describe-instances --query 'Reservations[].Instances[]'"
alias ec2start="aws ec2 start-instances --instance-ids"
alias ec2stop="aws ec2 stop-instances --instance-ids"
alias ec2term="aws ec2 terminate-instances --instance-ids"

# S3
alias s3ls="aws s3 ls"
alias s3cp="aws s3 cp"
alias s3mv="aws s3 mv"
alias s3sync="aws s3 sync"

# Lambda
alias lambdals="aws lambda list-functions"
alias lambdaget="aws lambda get-function --function-name"
alias lambdainvoke="aws lambda invoke"

# DynamoDB
alias dynamodbls="aws dynamodb list-tables"
alias dynamodbget="aws dynamodb get-item --table-name"
alias dynamodbput="aws dynamodb put-item --table-name"
alias dynamodbquery="aws dynamodb query --table-name"

# ECS
alias ecslist="aws ecs list-services"
alias ecsdesc="aws ecs describe-services --service"
alias ecsrun="aws ecs run-task --launch-type"
alias ecslogs="aws logs get-log-events --log-group-name /ecs --log-stream-name"

# CloudFormation
alias cfnls="aws cloudformation list-stacks"
alias cfncreate="aws cloudformation create-stack --stack-name"
alias cfnupdate="aws cloudformation update-stack --stack-name"
alias cfndelete="aws cloudformation delete-stack --stack-name"

# IAM
alias iamls="aws iam list-users"
alias iamcreate="aws iam create-user --user-name"
alias iamdelete="aws iam delete-user --user-name"
alias iamattach="aws iam attach-user-policy --user-name"

# SNS
alias snslist="aws sns list-topics"
alias snscreate="aws sns create-topic --name"
alias snsdelete="aws sns delete-topic --topic-arn"
alias snsaddsub="aws sns subscribe --topic-arn"

# SQS
alias sqslist="aws sqs list-queues"
alias sqscreate="aws sqs create-queue --queue-name"
alias sqsdelete="aws sqs delete-queue --queue-url"
alias sqssend="aws sqs send-message --queue-url"

# CloudWatch
alias cw_groups="aws logs describe-log-groups"
alias cw_logs="aws logs tail --follow"
alias cwalarm="aws cloudwatch put-metric-alarm --alarm-name"
alias cwgetmetric="aws cloudwatch get-metric-statistics --metric-name"

# RDS
alias rdslist="aws rds describe-db-instances"
alias rdsstart="aws rds start-db-instance --db-instance-identifier"
alias rdsstop="aws rds stop-db-instance --db-instance-identifier"
alias rdsreboot="aws rds reboot-db-instance --db-instance-identifier"

# ECS Fargate
alias ecsfargatels="aws ecs list-clusters"
alias ecsfargatedesc="aws ecs describe-clusters --clusters"
alias ecsfargateupdate="aws ecs update-service --cluster"

# ECR
alias ecrlist="aws ecr describe-repositories"
alias ecrcreate="aws ecr create-repository --repository-name"
alias ecrdelete="aws ecr delete-repository --repository-name"
alias ecrlogin="aws ecr get-login-password --region"

# CloudFront
alias cflist="aws cloudfront list-distributions"
alias cfcreate="aws cloudfront create-distribution --distribution-config"
alias cfdelete="aws cloudfront delete-distribution --id"
