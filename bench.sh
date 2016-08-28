#!/bin/bash -eu

TEAM_NAME="xxxxx"        # チーム名
TARGET_IP="xx.xx.xx.xx"  # 競技用インスタンスのIPアドレス

BENCHMARKER="/opt/go/bin/benchmarker"
USERDATA_DIR="/opt/go/src/github.com/catatsuy/private-isu/benchmarker/userdata"

PORTAL_HOST="isuconga.waka.ru.com"
PORTAL_DB="isucon"

RESULT=`${BENCHMARKER} -t http://${TARGET_IP}/ -u ${USERDATA_DIR}`

echo ${RESULT} | jq '.'

PASS=`echo ${RESULT} | jq '.pass'`
[ ${PASS} != 'true' ] && exit

SCORE=`echo ${RESULT} | jq '.score'`

POST_URL="http://${PORTAL_HOST}:8086/write?db=${PORTAL_DB}"
POST_DATA="score,team=${TEAM_NAME} value=${SCORE}"
curl -sS -XPOST "${POST_URL}" --data-binary "${POST_DATA}"
