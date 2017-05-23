#!/bin/bash

VROAPI=$VROENDPOINT"/d9ad2397-ac07-444d-978e-5f86c07f09d5/executions"
echo "Starting clone workflow at "$VROAPI" with user "$VROUSER

TOKEN=$(curl -s -D - -u $VROUSER:$VROPASS -k -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{  "parameters": [{}] }' $VROAPI | grep Location: | cut -d' ' -f2 )
echo "Status token: "$TOKEN

# eliminate CR from result.
TEST=""
for data in $TOKEN ;
do
    data=$(echo "$data" | tr -d '\r')
    TEST+="$data"
done

QUERY=$TEST"state"
echo "Querying execution state at: "$QUERY
STATE="running"
while [ "$STATE" == "running" ]; do
   STATE=$(curl -u $VROUSER:$VROPASS -sS -k -X GET --header 'Content-Type: application/json' --header 'Accept: application/json' $QUERY | cut -d':' -f2 | cut -d"\"" -f2)
   echo The state is: $STATE 
   sleep 5s
done

if [ "$STATE" == "completed" ]
then
echo Clone ready.
echo "Querying details for IP."
IP=$(curl -u $VROUSER:$VROPASS -sS -k -X GET --header 'Content-Type: application/json' --header 'Accept: application/json' $TEST | jq -r '.["output-parameters"][0].value.string.value')
echo $IP
echo $IP > cloneip/ip-1.txt

exit 0
fi

echo Clone failed.
exit 1
