# Infraestructura como Código para Onboardia Chat

Este directorio contiene la definición de infraestructura como código (IaC) utilizando AWS CDK para desplegar la aplicación Onboardia Chat en AWS.

## Arquitectura

La infraestructura despliega:
- Un bucket S3 para alojar los archivos estáticos de la aplicación Next.js
- Una distribución CloudFront para servir la aplicación con baja latencia globalmente
- Configuración de redirección para SPA (Single Page Application)

## Requisitos previos

1. Node.js 18.x o superior
2. AWS CLI configurado con credenciales válidas
3. AWS CDK instalado globalmente (`npm install -g aws-cdk`)

## Configuración

1. Edita el archivo `.env` con tus configuraciones:
   ```
   CDK_DEFAULT_REGION=us-east-1
   NEXT_PUBLIC_N8N_API_URL=https://tu-url-n8n-en-gcp/webhook/chat
   ```

2. Inicializa CDK en tu cuenta AWS (solo la primera vez):
   ```
   cdk bootstrap
   ```

## Despliegue

### Opción 1: Usando el script de despliegue

Desde la raíz del proyecto:
```
chmod +x deploy.sh
./deploy.sh
```

### Opción 2: Despliegue manual

1. Construye la aplicación Next.js:
   ```
   cd ../chat-agent
   npm run build
   npx next export
   ```

2. Despliega la infraestructura:
   ```
   cd ../infrastructure
   npm run deploy
   ```

## Eliminar la infraestructura

Para eliminar todos los recursos creados:
```
npm run destroy
```

## Estructura de archivos

```
infrastructure/
├── bin/
│   └── app.ts              # Punto de entrada de la aplicación CDK
├── lib/
│   └── onboardia-chat-stack.ts  # Definición del stack principal
├── .env                    # Variables de entorno
├── cdk.json                # Configuración de CDK
├── package.json            # Dependencias
└── tsconfig.json           # Configuración de TypeScript
```