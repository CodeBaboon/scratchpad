import { ExecuteStatementCommand } from "@aws-sdk/client-dynamodb";
import { ScanCommand } from "@aws-sdk/lib-dynamodb";
import { ddbDocClient } from "./libs/ddbDocClient.js";

export const TABLE_NAME = "event-scheduler-prod-ExecutingEvents";

export const updateItem = async (_key, ttl) => {
    const params = {
        Statement: `UPDATE "` + TABLE_NAME + `" SET ttl=? WHERE eventId=?`,
        Parameters: [{ N: ttl.toString() }, { S: _key }]
    };
    try {
        await ddbDocClient.send(new ExecuteStatementCommand(params));
        console.log("Success. Item updated: ", _key);
        return;
    } catch (err) {
        console.error(err);
    }
};

export const run = async (_key) => {
    const params = {
        TableName: TABLE_NAME,
        Limit: 1000,
        ExclusiveStartKey: _key
    };

  try {
    console.log("Scanning with key: ", _key);
    const data = await ddbDocClient.send(new ScanCommand(params));

    const twoYearsFomNow = Math.floor((Date.now() / 1000)) + (2 * 365 * 24 * 60 * 60);

    for (const item of data.Items) {
        if (item.ttl == 0) {
            console.log('ttl is 0, setting ttl to now + 2 yrs in seconds: ', twoYearsFomNow);
            await updateItem(item.eventId, twoYearsFomNow);
        } else {
            if (item.ttl > 9999999999) {
                console.log('ttl is getting trimmed to seconds: ', Math.floor(item.ttl / 1000));
                await updateItem(item.eventId, Math.floor(item.ttl / 1000));
            } else {
                console.log('ttl is already in seconds: ', item.ttl);
            }
        }
    }

    return data.LastEvaluatedKey;
  } catch (err) {
    console.log("Error occurred while processing incoming key: ", _key);
    console.log("Error", err);
  }
};

let key;
let i = 0;
do {
    key = await run(key);
    i++;
}
while (typeof key != "undefined" && i < 500);
console.log('ran this many loops: ', i);

// do {
//     key = await run(key);
//     console.log('LastEvaluatedKey: ', key);
//     i++;
// }
// while (i < 1);


