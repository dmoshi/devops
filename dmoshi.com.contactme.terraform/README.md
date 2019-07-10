### Terraform

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
SUBJECT = "<<sonject>>"
```

These values will be used during terraforming. Then,

> * cd into  __/scripts__ folder
> * Just run __./build_conctactme_app.sh__ 
> * To remove the entire infrstructure from AWS just run __./delete_conctactme_app.sh__

