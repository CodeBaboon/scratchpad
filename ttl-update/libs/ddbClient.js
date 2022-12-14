// Create service client module using ES6 syntax.
import { fromIni } from "@aws-sdk/credential-providers";
import { DynamoDBClient } from "@aws-sdk/client-dynamodb";
// Set the AWS Region.
const REGION = "us-east-1"; //e.g. "us-east-1"
// Create an Amazon DynamoDB service client object.
const ddbClient = new DynamoDBClient({ region: REGION, credentials: fromIni({ profile: 'cobras' }) });
export { ddbClient };