#! /bin/sh
package_string='';

input_string="${PACKAGES:1}"

IFS=',' read -ra ADDR <<< "${input_string}"
for i in "${ADDR[@]}"; do
  # process "$i"
  echo $i
  package_string+=\"$i\"\,
done

package_string=${package_string%","}

export PACKAGES="[${package_string}]"
echo "${PACKAGES}"

var1=\"${AMI_NAME}\"
export AMI_NAME=${var1}
echo "${AMI_NAME}"

generate_post_data()
{
  cat <<EOF
{
  "data":{
    "packages": ${PACKAGES},
    "ami_name": ${AMI_NAME}
  }
}
EOF
}

curl -X POST https://qefflik5hfpyhinjpar63vv5g40fpepo.lambda-url.ap-south-1.on.aws/ -H "Content-Type: application/json" -d "$(generate_post_data)"