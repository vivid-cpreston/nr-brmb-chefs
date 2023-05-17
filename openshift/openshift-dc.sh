

export NAMESPACE=ec2c6e-$TARGET_ENV
export APP_NAME=nr-brmb-chefs

oc process -n $NAMESPACE -f ../openshift/app.dc.yaml -p REPO_NAME=nr-brmb-chefs -p JOB_NAME=master -p NAMESPACE=$NAMESPACE -p APP_NAME=$APP_NAME -p ROUTE_HOST=$NAMESPACE.apps.silver.devops.gov.bc.ca -p ROUTE_HOST=$APP_NAME-dev.apps.silver.devops.gov.bc.ca -p ROUTE_PATH=master -o yaml | oc apply -n $NAMESPACE -f -
oc process -n $NAMESPACE -f ../openshift/patroni.dc.yaml -p REPO_NAME=nr-brmb-chefs -p JOB_NAME=master -p NAMESPACE=$NAMESPACE -p APP_NAME=$APP_NAME -p ROUTE_HOST=$NAMESPACE.apps.silver.devops.gov.bc.ca -p ROUTE_HOST=$APP_NAME-dev.apps.silver.devops.gov.bc.ca -p ROUTE_PATH=master -o yaml | oc apply -n $NAMESPACE -f -
oc rollout -n $NAMESPACE latest dc/$APP_NAME-master
