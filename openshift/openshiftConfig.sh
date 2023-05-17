

export NAMESPACE=ec2c6e-$TARGET_ENV
export APP_NAME=nr-brmb-chefs
export PUBLIC_KEY=empty
export REPO_NAME=common-hosted-form-service
# parameters for Fluent-bit container
export FLUENTD=
export AWS_DEFAULT_REGION=ca-central-1
export AWS_KINESIS_STREAM=
export AWS_ROLE_ARN=

oc create -n $NAMESPACE configmap $APP_NAME-frontend-config \
  --from-literal=FRONTEND_APIPATH=api/v1 \
  --from-literal=VUE_APP_FRONTEND_BASEPATH=/app \
  --from-literal=FRONTEND_ENV=dev \
  --from-literal=FRONTEND_KC_REALM=cp1qly2d \
  --from-literal=FRONTEND_KC_SERVERURL=https://dev.oidc.gov.bc.ca/auth

oc create -n $NAMESPACE configmap $APP_NAME-sc-config \
  --from-literal=SC_CS_CHES_ENDPOINT=https://ches-dev.api.gov.bc.ca/api \
  --from-literal=SC_CS_CDOGS_ENDPOINT=https://cdogs-dev.api.gov.bc.ca/api \
  --from-literal=SC_CS_CHES_TOKEN_ENDPOINT=https://dev.loginproxy.gov.bc.ca/auth/realms/comsvcauth/protocol/openid-connect/token
  --from-literal=SC_CS_CDOGS_TOKEN_ENDPOINT=https://dev.loginproxy.gov.bc.ca/auth/realms/comsvcauth/protocol/openid-connect/token

oc create -n $NAMESPACE configmap $APP_NAME-server-config \
  --from-literal=SERVER_APIPATH=/api/v1 \
  --from-literal=SERVER_BASEPATH=/app \
  --from-literal=SERVER_BODYLIMIT=30mb \
  --from-literal=SERVER_KC_PUBLICKEY=$PUBLIC_KEY \
  --from-literal=SERVER_KC_REALM=cp1qly2d \
  --from-literal=SERVER_KC_SERVERURL=https://dev.oidc.gov.bc.ca/auth \
  --from-literal=SERVER_LOGLEVEL=http \
  --from-literal=SERVER_PORT=8080

oc create -n $NAMESPACE configmap $APP_NAME-files-config \
  --from-literal=FILES_UPLOADS_DIR= \
  --from-literal=FILES_UPLOADS_ENABLED=true \
  --from-literal=FILES_UPLOADS_FILECOUNT=1 \
  --from-literal=FILES_UPLOADS_FILEKEY=files \
  --from-literal=FILES_UPLOADS_FILEMAXSIZE=25MB \
  --from-literal=FILES_UPLOADS_FILEMINSIZE=0KB \
  --from-literal=FILES_UPLOADS_PATH=files \
  --from-literal=FILES_PERMANENT=objectStorage \
  --from-literal=FILES_LOCALSTORAGE_PATH= \
  --from-literal=FILES_OBJECTSTORAGE_BUCKET=egejyy \
  --from-literal=FILES_OBJECTSTORAGE_ENDPOINT=https://nrs.objectstore.gov.bc.ca \
  --from-literal=FILES_OBJECTSTORAGE_KEY=chefs/dev/ \