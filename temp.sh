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
