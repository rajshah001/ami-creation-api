#!/bin/bash

curl -X POST https://qefflik5hfpyhinjpar63vv5g40fpepo.lambda-url.ap-south-1.on.aws/ -H "Content-Type: application/json" --data-binary @- <<DATA
{
  "required": [
      "nginx-playbook.yml",
      "php-playbook.yml"
    ] 
}
DATA