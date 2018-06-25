# Bonial Project
terraform configuration exercise
1. Download and Unzip terraform from official site.
2. Create AWS account.
3. Make configuration file named "exercise.tf" with AWS IAM and key pair and AMI information.
4. Run #terraform init for initialization.
5. Run #terraform apply for apply changes and terraform show for current state.
6. Now, AWS setup is completed with Debian Stretch EC2 instances and Elastic loadbalancer.
7. Install docker on EC2 instances with $sudo curl -sSL https://get.docker.com/ | sh
8. Get Nginx docker image with $sudo docker pull nginx
9. Start Nginx docker container with $sudo docker run --name docker-nginx -p 80:80 -d nginx and check with $sudo docker ps
10. Build a web page to serve on Nginx where ~/docker-nginx/html/index.html
11. Link the container to the local filesystem $sudo docker run --name docker-nginx -p 80:80 -d -v ~/docker-nginx/html:/usr/share/nginx/html nginx
12. All configuration is finished then for loadbalance testing, go to load balance tab and open web browser with domain name "rvg-inbox-test-1934048436.ap-northeast-2.elb.amazonaws.com"
