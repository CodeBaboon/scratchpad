import { SQSClient, SendMessageCommand  } from "@aws-sdk/client-sqs";
import { fromIni } from "@aws-sdk/credential-providers";

export const handler = async (event, context) => {
    console.log('hello world');
    const sqsClient = new SQSClient({ region: 'us-east-1', credentials: fromIni({ profile: 'cobras' }) });
    
    const activityRecord = {
        tenantId: '02c607ab-e1b3-436c-a74a-4f5fac581fc2',
        Id: 1470,
        activityInstanceId: 1470,
        inheritsDateFromInstance: true,
        '_v':3,
        dueDate:1670444580000,
        ttl: 1670475599,
        updatedAt:'2022-12-07T20:20:40.192Z'
    };

    console.log('activityRecord: ', activityRecord);

    const autoZeroEvent = {
        TenantId: '02c607ab-e1b3-436c-a74a-4f5fac581fc2',
        ActivityId: 1470,
        ActivityType: 'ActivityInstance'
    };

    console.log('autoZeroEvent: ', autoZeroEvent);

    const eventPayload = {
        eventName: {
            DataType: 'String',
            StringValue: 'MODIFY'
        },
        activityType: {
            DataType: 'String',
            StringValue: 'si_'
        },
        activityRecord: {
            DataType: 'String',
            StringValue: JSON.stringify(activityRecord)
        },
        tenantId: {
            DataType: 'String',
            StringValue: activityRecord.tenantId
        },
        eventContext: {
            DataType: 'String',
            StringValue: 'automatic-zero:instance:due-date'
        },
        id: {
            DataType: 'String',
            StringValue: `${activityRecord.Id}:${activityRecord.Id}`
        },
        dueDate: {
            DataType: 'Number',
            StringValue: `${activityRecord.dueDate}`
        },
        autoZeroEvent: {
            DataType: 'String',
            StringValue: JSON.stringify(autoZeroEvent)
        },
        _v: {
            DataType: 'Number',
            StringValue: `${activityRecord._v}`
        }
      };

    console.log('eventPayload: ', eventPayload);

    const params = {
        MessageAttributes: eventPayload,
        MessageBody: JSON.stringify(eventPayload),
        QueueUrl: 'https://sqs.us-east-1.amazonaws.com/135368810535/dev-event-scheduler-events-queue'
    }

    console.log('params: ', params);

    const command = new SendMessageCommand(params);

    try {
        const data = await sqsClient.send(command);
        console.log('success, data: ', data);
    } catch (err) {
        console.log('error: ', err);
    }
}

handler();