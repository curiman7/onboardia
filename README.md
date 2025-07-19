# Onboardia Chat

Aplicación de chat para comunicarse con un agente de onboarding implementado en n8n.

## Estructura del proyecto

```
/
├── chat-agent/            # Aplicación Next.js
│   ├── public/            # Archivos estáticos
│   ├── src/               # Código fuente
│   └── ...                # Archivos de configuración
├── infrastructure/        # Infraestructura como Código (IaC)
│   ├── bin/               # Punto de entrada de CDK
│   ├── lib/               # Definición de stacks
│   └── ...                # Archivos de configuración
└── deploy.sh              # Script de despliegue
```

## Desarrollo local

Para ejecutar la aplicación localmente:

```bash
cd chat-agent
npm install
npm run dev
```

La aplicación estará disponible en [http://localhost:3000](http://localhost:3000).

## Despliegue en AWS

Este proyecto utiliza AWS CDK para definir y desplegar la infraestructura como código.

### Requisitos previos

1. AWS CLI instalado y configurado
2. Node.js 18.x o superior
3. AWS CDK instalado globalmente: `npm install -g aws-cdk`

### Pasos para desplegar

1. Configura las variables de entorno en `infrastructure/.env`
2. Ejecuta el script de despliegue:

```bash
chmod +x deploy.sh
./deploy.sh
```

Este script:
- Construye la aplicación Next.js
- Exporta los archivos estáticos
- Despliega la infraestructura en AWS usando CDK

### Arquitectura en AWS

La aplicación se despliega con:
- **Amazon S3**: Almacenamiento de archivos estáticos
- **Amazon CloudFront**: CDN para distribución global con baja latencia

## Conexión con n8n

La aplicación se conecta a un agente n8n alojado en GCP. La URL del webhook se configura en:
- Desarrollo local: `chat-agent/.env.local`
- Producción: `infrastructure/.env`