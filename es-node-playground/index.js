import AWS from 'aws-sdk';
import { EventSchedulerServiceClient, LAMBDA_REGIONS, STAGE } from '@d2l/event-scheduler-client-node';

export const handler = async (event, context) => {
    console.log('hello world');
    AWS.config.credentials = new AWS.SharedIniFileCredentials({ profile: 'cobras' });
    const eventClient = new EventSchedulerServiceClient(STAGE.STABLE, "us-east-1");
    try {
        let result = await eventClient.upsertEvent({
            tenantId: "ca564097-d8dc-49a2-bc4b-6750c114bb97",
            context: "automatic-zero:assigned:due-date",
            // ID must be a compound of the two IDs, since there could be collisions
            id: "12760:12760",
            target: "arn:aws:sns:us-east-1:135368810535:automatic-grading-adjustments-service-dev-event-transformer-queue-topic",
            // we know dueDate exists, because it's in our scheduled table
            scheduledDate: 1669841280000,
            payload: {
                "TenantId": "ca564097-d8dc-49a2-bc4b-6750c114bb97",
                "ActivityId": "12760",
                "ActivityType": "ActivityInstance"
            },
            _v: 0,
          });
        // let result = await eventClient.updateEvent({
        //     tenantId: "ca564097-d8dc-49a2-bc4b-6750c114bb97",
        //     context: "automatic-zero:assigned:due-date",
        //     // ID must be a compound of the two IDs, since there could be collisions
        //     id: "12760:12760",
        //     target: "arn:aws:sns:us-east-1:135368810535:automatic-grading-adjustments-service-dev-event-transformer-queue-topic",
        //     // we know dueDate exists, because it's in our scheduled table
        //     scheduledDate: 1669841280000,
        //     payload: {
        //         "TenantId": "ca564097-d8dc-49a2-bc4b-6750c114bb97",
        //         "ActivityId": "12760",
        //         "ActivityType": "ActivityInstance"
        //     },
        //     expectedVersion: 1
        //     });
          console.log('not an error');
          console.log(result);
    } catch(err) {
        console.log("IAMGROOT");
        console.log(err);
    }
}

handler();