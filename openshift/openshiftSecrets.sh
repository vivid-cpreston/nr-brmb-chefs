
#!/bin/bash

#Must set following vars:
#  $TARGET_ENV

#After execution, fill secret values in OpenShift



export NAMESPACE=ec2c6e-$TARGET_ENV
export APP_NAME=nr-brmb-chefs

export username=keycloak-username
export password=keycloak-password

oc create -n $NAMESPACE secret generic $APP_NAME-keycloak-secret \
  --type=kubernetes.io/basic-auth \
  --from-literal=username=$username \
  --from-literal=password=$password

export ches_client_id=ches_client_id
export ches_client_secret=ches_client_secret
export cdogs_client_id=cdogs_client_id
export cdogs_client_secret=cdogs_client_secret

oc create -n $NAMESPACE secret generic $APP_NAME-sc-cs-secret \
  --type=Opaque \
  --from-literal=ches_client_id=$ches_client_id \
  --from-literal=ches_client_secret=$ches_client_secret \
  --from-literal=cdogs_client_id=$cdogs_client_id \
  --from-literal=cdogs_client_secret=$cdogs_client_secret

export username=bucket-username
export password=bucket-password

oc create -n $NAMESPACE secret generic $APP_NAME-objectstorage-secret \
  --type=kubernetes.io/basic-auth \
  --from-literal=username=$username \
  --from-literal=password=$password