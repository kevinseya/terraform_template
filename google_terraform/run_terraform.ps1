# --- Inicializar y aplicar Terraform ---
Write-Host "**Inicializando Terraform..."
cd terraform
terraform init
terraform apply -auto-approve
Write-Host "**Terraform aplicado con Exito."

# --- Obtener IP de la VM creada ---
$IP_VM = terraform output -raw instance_external_ip
Write-Host "La IP de la instancia es: $IP_VM"

# --- Obtener el SSH_KEY_PATH ---
$SSH_KEY_PATH = terraform output -raw ssh_key_path
Write-Host "El SSH_KEY_PATH es: $SSH_KEY_PATH"

# --- Obtener el usuario de la instancia ---
$SSH_USER = terraform output -raw ssh_user
Write-Host "El usuario de la instancia es: $IP_VM"
