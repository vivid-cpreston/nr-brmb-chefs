oc start-build -n ec2c6e-$TARGET_ENV nr-brmb-chefs --follow
oc tag -n ec2c6e-$TARGET_ENV nr-brmb-chefs:latest nr-brmb-chefs:master