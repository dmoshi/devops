### INFRASTRUCTURE AS CODE USING TERRAFORM AND AWS LAMBDA

#### Overview

This project will build and deploy a serverless contact me application that allow website visitors to send SMS directly from my website __dmoshi.com__. Currently the website is configured for me to receive emails but I wrote and test this to show the power and flexibility of infrastructure as code. So the modified architecture will look like this : - 



#### Things you will need :- 

1. Terraform installed on your sandbox (whether local or let say build server like Jenkins) 
2. Maven installed, test by running ```mvn --version```
3. AWS Credentials with required permission to connect to your environment
4. Create a file named ```terraform.tfvars``` and add the following and replace the values with your own : 
   
 ```yaml  
AWS_ACCESS_KEY = "<<access key>>"
AWS_SECRET_KEY = "<<secret>>"
AWS_REGION = "<<region>>"
ENDPOINT_ADDRESS = "<<your-phone-number>>"
S3_BUCKET = "<<your-bucket>>"
SUBJECT = "<<sonject>>"
```

These values will be used during terraforming. Then,

* cd into  __/scripts__ folder
* Just run __./build_conctactme_app.sh__ 
* The above command will output the following :- 
  
 ```
Apply complete! Resources: 13 added, 0 changed, 0 destroyed.
Outputs:
base_url = https://xxxxxxxxxx.execute-api.us-east-1.amazonaws.com/prod
curl = curl -H 'Content-Type: application/json' -X POST -d '{"sendersEmail": "daniel.moshi@dmoshi.com","message": "Contact App deployed and working successfully"}' https://xxxxxxxxxx.execute-api.us-east-1.amazonaws.com/prod/contactme
```

* Invoking the API Gateway endpint above will send an SMS to a recipient defined in the variable ```ENDPOINT_ADDRESS``inside ```terraform.tfvars``` . 

* The curl output above can be linked to a script that will execute the command (maybe after a delay to allow AWS to complete creating all resources) to automatically test the deployment end to end. 

* I made a few adjustments from the [[original architecture]](https://github.com/dmoshi/serverless/tree/master/dmoshi.com.contactme.lambda) of contact me App, this one is building an __SMS subscription__ with AWS SNS instead of __Email__ as it's shown on the architecture diagram. This is because as of this writing __Terraform__ does not support creation of email subscriptions in SNS and I believe it's because it requires manual email verification. You will notice in the Terraform code I've changed SNS protocol to SMS and endpoint will obviously be a __phone number__. 

* To remove the entire infrstructure from AWS just run __./delete_conctactme_app.sh__ from inside __scripts__ folder

