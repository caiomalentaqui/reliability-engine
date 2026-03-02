#!/bin/bash

ACTION=$1

if [ "$ACTION" == "start" ]; then
    echo "🚀 Iniciando laboratório"
    #kind create cluster --name pay
    echo "⚙️ Aplicando configurações do Terraform..."
    terraform init && terraform apply -auto-approve
    echo "✅ Ambiente pronto! Use 'kubectl get nodes' para verificar."

elif [ "$ACTION" == "stop" ]; then
    echo "🧹 Deletando cluster e limpando tudo..."
    #kind delete cluster --name pay
    # Opcional: limpa o estado do terraform local para começar do zero
    rm -rf .terraform* terraform.tfstate* echo "✨ Tudo limpo!"

else
    echo "Uso: ./manage_lab.sh [start|stop]"
fi

