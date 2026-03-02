#!/bin/bash

ACTION=$1

if [ "$ACTION" == "start" ]; then
    echo "🚀 Iniciando laboratório: reliability-engine"
    echo "⚙️ Preparando Terraform..."
    terraform init
    terraform apply -auto-approve
    echo "✅ Infraestrutura provisionada com sucesso!"

elif [ "$ACTION" == "stop" ]; then
    echo "🧹 Iniciando destruição da infraestrutura na AWS..."
    # O destroy precisa do .tfstate para saber o que apagar!
    terraform destroy -auto-approve
    
    echo "✨ Limpeza concluída. Recursos removidos da AWS."
    echo "💡 Dica: O arquivo .tfstate foi mantido (vazio) por segurança."

else
    echo "Uso: ./manage_lab.sh [start|stop]"
fi