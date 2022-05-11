ROLE_ARN=$1
INPUT_PROFILE=$2
OUTPUT_PROFILE=$3

echo "Assuming role $ROLE_ARN"
sts=$(aws sts assume-role \
  --profile "$INPUT_PROFILE" \
  --role-arn "$ROLE_ARN" \
  --role-session-name "$OUTPUT_PROFILE" \
  --query 'Credentials.[AccessKeyId,SecretAccessKey,SessionToken]' \
  --output text)
echo "Converting sts to array"
sts=($sts)
echo "AWS_ACCESS_KEY_ID is ${sts[0]}"

# Uncomment below lines only when you want to configure your AWS CLI 
aws configure set aws_access_key_id ${sts[0]} --profile $OUTPUT_PROFILE
aws configure set aws_secret_access_key ${sts[1]} --profile $OUTPUT_PROFILE
aws configure set aws_session_token ${sts[2]} --profile $OUTPUT_PROFILE
echo "credentials stored in the profile named $OUTPUT_PROFILE"