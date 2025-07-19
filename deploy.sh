#!/bin/bash

# Script para construir y desplegar la aplicación Onboardia Chat

# Colores para mensajes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== Construyendo la aplicación Next.js ===${NC}"
cd chat-agent

# Instalar dependencias
echo -e "${BLUE}Instalando dependencias...${NC}"
npm install

# Construir la aplicación para producción
echo -e "${BLUE}Construyendo la aplicación...${NC}"
npm run build

# Exportar la aplicación estática
echo -e "${BLUE}Exportando la aplicación estática...${NC}"
npx next export

cd ../infrastructure

# Instalar dependencias de CDK
echo -e "${BLUE}Instalando dependencias de CDK...${NC}"
npm install

# Desplegar la infraestructura
echo -e "${BLUE}Desplegando infraestructura con CDK...${NC}"
npm run deploy -- --require-approval never

echo -e "${GREEN}¡Despliegue completado!${NC}"
echo -e "${GREEN}La URL de la aplicación está disponible en los outputs del stack de CloudFormation.${NC}"