### Terraform


> * Just run __./build_conctactme_app.sh__ inside __/scripts__ folder


#### Things you will need :- 

1. Terraform installed on your sandbox (whether local or let say build server like Jenkins) 
2. Maven installed, test by running ```mvn --version```
3. AWS Credentials with required permission to connect to your environment
4. Create a file named terraform.tfvars and add the following and replace the values with your own : 
   
 ```yaml  
AWS_ACCESS_KEY = "<<access key>>"
AWS_SECRET_KEY = "<<secret>>"
AWS_REGION = "<<region>>"
ENDPOINT_ADDRESS = "<<your-phone-number>>"
S3_BUCKET = "<<your-bucket>>"
S3_LAMBDA_KEY = "DMoshiContactMe.zip"
```

These values will be used during terraforming. Then,

> * Just run __./build_conctactme_app.sh__ inside __/scripts__ folder

