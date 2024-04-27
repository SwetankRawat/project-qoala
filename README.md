# project-qoala


terraform --->

1. here I have made three different terraform files for three tasks.
2. Although there can be diff approach if it can be done as a project.
3. There would be var.tf and separately components.tf for provisiong and managing infra.
4. after running terraform init, terraform plan and terraform apply we can acheive our desired infra.


deployment --->

1. I have picked deplyment template from documentation.
2. container image can be private by pushing on ecr. (public as of now)
3. I have defined deployment strategy type i.e rolling update in which how much pod will restart at a time and how much pod will be avaiable defined there.
4. I have defined container resource limits and requests , they are equal as of now but can be changed so that it cannot take extra resource and node burden our node.
5. I have put nodeSelector for scheduling the nginx pod on desired worker node.


Deployment-pipeline --->

1. I have created a jenkinsfile for deploying our application.
2. for now , some values are static  in Jenkinsfile and some are imaginary variables (/var/lib/jenkins/workspace/service-process-workspace/$service/$env) in this path, this will be on jenkisn server and will read the varibale values from jenkinsjob while triggering .
3. It will checkout to our repository and after building the application (in our case there is no need to build) , it will deploy the application through deployment.yaml which i have made in previous task.
4. There is a lot of scope of improvemnts which i can improve but for limited resources this approach would be good in my opinion.


Automation -->

1. I have written a python script using libraries for taking backup of s3.
2. This can be done using cron also.
3. for autoscaling ec2-instance based on cpu utilisation -->
   a. We can monitor cpu usage  of instance using cloudwatch metrics.
   b. If cpu usage is above threshold then 
   c. an event will trigger  lambda function which in turn triggers autoscaling  group to increase instances count.
   