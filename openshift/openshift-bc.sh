export NAMESPACE=ec2c6e-$TARGET_ENV

oc process -n $NAMESPACE -f app.bc.yaml -p REPO_NAME=nr-brmb-chefs -p JOB_NAME=master -p SOURCE_REPO_URL=https://github.com/vivid-cpreston/nr-brmb-chefs.git -p SOURCE_REPO_REF=master -p ROUTE_PATH=vue -o yaml | oc apply -n $NAMESPACE -f -

oc start-build -n ec2c6e-$TARGET_ENV nr-brmb-chefs --follow
oc tag -n ec2c6e-$TARGET_ENV nr-brmb-chefs:latest nr-brmb-chefs:master