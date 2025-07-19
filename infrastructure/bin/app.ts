#!/usr/bin/env node
import 'source-map-support/register';
import * as cdk from 'aws-cdk-lib';
import { OnboardiaChatStack } from '../lib/onboardia-chat-stack';
import * as dotenv from 'dotenv';

// Cargar variables de entorno
dotenv.config();

const app = new cdk.App();

// Crear stack principal
new OnboardiaChatStack(app, 'OnboardiaChatStack', {
  env: { 
    account: process.env.CDK_DEFAULT_ACCOUNT, 
    region: process.env.CDK_DEFAULT_REGION || 'us-east-1' 
  },
  description: 'Onboardia Chat Application Infrastructure',
});

app.synth();