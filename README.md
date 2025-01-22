# **APLICACIÓN DUMMY - HELLO WORLD (PHP - Laravel)**

# Descripción del proyecto

Este proyecto dummy consiste en una aplicación Backend contenerizada desarrollada con php Laravel.

## Objetivo

El objetivo principal de este proyecto es proporcionar un entorno de prueba para el equipo DevOps. Se utiliza para realizar pruebas de los templates desarrollados en el repositorio ‘devops-pipeline-cicd’. Estas pruebas incluyen:

- Compilación de código.
- Ejecución de pruebas unitarias.
- Despliegue de imágenes a un container registry.
- Despliegue de la aplicación en OpenShift.

Este proyecto sirve como un sandbox donde el equipo DevOps puede experimentar y validar el funcionamiento de los flujos de trabajo y plantillas de CI/CD desarrollados para implementaciones más complejas.

# Implementación en local de aplicación Dummy
Con el objetivo de desplegar localmente la aplicación Dummy se requieren las siguientes tecnologías.

## Tecnologías necesarias
- git
- DockerDesktop

## Pasos de instalación en local
1. Abrir DockerDesktop.
2. Clonar el repositorio.
3. Ingresar a la carpeta raíz del proyecto en una terminal.
4. Ejecutar el comando docker build -t dummy-laravel-back:latest . para realizar la cosntrucción de la imagen.
5. Ejecutar el comando docker run -p 8007:8007 dummy-laravel-back:latest para la construcción del contenedor en base a la imagen generada anteriormente.
6. Ingresar por el navegador a la URL http://localhost:8008/mensaje  para ver el proyecto ejecutarse en local.
---
