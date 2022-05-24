#! /bin/sh

# Data PreProcessing and JSON conversion 

# Example:
# Input: [apache-playbook,php-playbook
# Output: ["apache-playbook","php-playbook"]

final_package_string='';

# remove '[' (opening square bracket from input)
input_package_string="${PACKAGES:1}"

# loop over all the packages
IFS=',' read -ra ADDR <<< "${input_package_string}"
for i in "${ADDR[@]}"; do
  # add quotes to the individual strings and comma after the string
  final_package_string+=\"$i\"\,
done

# remove redundant comma ',' at end
final_package_string=${final_package_string%","}

export PACKAGES="[${final_package_string}]"
echo "${PACKAGES}"

# add quotes to AMI_NAME env variable
ami_name=\"${AMI_NAME}\"
export AMI_NAME=${ami_name}
echo "${AMI_NAME}"

# add quotes to PROVIDER env variable
provider_name=\"${PROVIDER}\"
export PROVIDER=${provider_name}
echo "${PROVIDER}"

# Create JSON object to make request
generate_post_data()
{
cat <<EOF
{
  "data":{
    "packages": ${PACKAGES},
    "ami_name": ${AMI_NAME},
    "provider": ${PROVIDER}
  }
}
EOF
}

# curl command with data attached
curl -X POST https://qefflik5hfpyhinjpar63vv5g40fpepo.lambda-url.ap-south-1.on.aws/ -H "Content-Type: application/json" -d "$(generate_post_data)"