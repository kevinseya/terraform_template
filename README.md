# Infraestructura en la Nube con Terraform
<div style="text-align: center;">
  <img src="https://opensenselabs.com/sites/default/files/inline-images/terraform.png" width="200" />
</div>
Este repositorio contiene configuraciones de Terraform para aprovisionar infraestructura en tres proveedores de la nube diferentes: AWS, Google Cloud y Oracle Cloud. A continuación, se describen las configuraciones necesarias para cada proveedor.

## Estructura del Repositorio

``` bash
Expo_InfraestructuraNube/
├── .gitignore
├── aws_terraform/
│ ├── main.tf
│ ├── outputs.tf
│ ├── provider.tf
│ ├── terraform.tfvars
│ ├── variables.tf
│ ├── terraform.tfstate
│ ├── terraform.tfstate.backup
│ ├── keyfile.pem
│ ├── keyfile.pem.pub
├── google_terraform/
│ ├── main.tf
│ ├── output.tf
│ ├── provider.tf
│ ├── terraform.tfvars
│ ├── variables.tf
│ ├── terraform.tfstate
│ ├── terraform.tfstate.backup
│ ├── infraestructuranube-0786211b14bb.json
│ ├── run_terraform.ps1
├── oracle_terraform/
│ ├── main.tf
│ ├── provider.tf
│ ├── terraform.tfvars
│ ├── variables.tf
│ ├── terraform.tfstate
│ ├── terraform.tfstate.backup
│ ├── oci.pem
```

## Configuración de Variables en `terraform.tfvars`

El archivo `terraform.tfvars` contiene las variables específicas de cada proveedor que necesitarás configurar antes de aplicar las configuraciones de Terraform. Asegúrate de editar este archivo con los valores correctos para cada entorno.

### Ejemplo de configuración para AWS (`aws_terraform/terraform.tfvars`):

```hcl
access_key = "tu_access_key_aqui"
secret_key = "tu_secret_key_aqui"
region     = "us-east-1"
key_name   = "nombre_de_tu_llave_aws"
instance_type = "t2.micro"
```

### Ejemplo de configuración para Google Cloud (`google_terraform/terraform.tfvars`):

```hcl
project_id = "tu_project_id_aqui"
region     = "us-central1"
zone       = "us-central1-a"
credentials_file = "ruta/al/archivo/infraestructuranube-0786211b14bb.json"
```

### Ejemplo de configuración para Oracle Cloud (`oracle_terraform/terraform.tfvars`):
```hcl
region         = "us-phoenix-1"
compartment_id = "tu_compartment_id_aqui"
availability_domain = "AD-1"
key_file       = "ruta/a/tu/oci.pem"
instance_shape = "VM.Standard2.1"
```
Asegúrate de configurar estos valores antes de ejecutar cualquier comando de Terraform. Las claves y otros detalles específicos de tu infraestructura deben ser correctos para que Terraform pueda acceder a los recursos de tu proveedor de la nube.

## AWS - Terraform
<div style="text-align: center;">
  <img src="https://static-00.iconduck.com/assets.00/aws-icon-1024x612-hvye7lur.png" width="140" />
</div>

Para comenzar a trabajar con AWS, sigue estos pasos:

1. Proveedor: AWS

2. Archivos de configuración:

    - main.tf: Define los recursos que serán provisionados en AWS.

    - provider.tf: Configura el proveedor de AWS.

    - terraform.tfvars: Variables de configuración para AWS.

    - variables.tf: Variables utilizadas en la configuración.

3. Generar claves:

    - Asegúrate de tener tus claves privadas y públicas en los archivos keyfile.pem y keyfile.pem.pub.

4. Inicializar Terraform:
```bash
cd aws_terraform
terraform init
```
5. Verificar la configuración:
```bash
terraform plan
```
5. Aplicar cambios:
```bash
terraform apply
```

## Google Cloud - Terraform
<div style="text-align: center;">
  <img src="https://logos-world.net/wp-content/uploads/2021/02/Google-Cloud-Symbol.png" width="200" />
</div>
Para comenzar a trabajar con Google Cloud, sigue estos pasos:

1. Proveedor: Google Cloud

2. Archivos de configuración:

    - main.tf: Define los recursos que serán provisionados en Google Cloud.

    - provider.tf: Configura el proveedor de Google Cloud.

    - terraform.tfvars: Variables de configuración para Google Cloud.

    - variables.tf: Variables utilizadas en la configuración.

3. JSON de autenticación:

    - Descarga el archivo de autenticación JSON de tu cuenta de Google Cloud y colócalo en el archivo `infraestructuranube-0786211b14bb.json.`

4. Inicializar Terraform:
```bash
cd google_terraform
terraform init
```
5. Verificar la configuración:
```bash
terraform plan
```
5. Aplicar cambios:
```bash
terraform apply
```

## Oracle Cloud - Terraform
<div style="text-align: center;">
  <img src="https://1000logos.net/wp-content/uploads/2024/08/Oracle-Cloud-Logo-768x432.png" width="200" />
</div>

Para comenzar a trabajar con Oracle Cloud, sigue estos pasos:

1. Proveedor: Oracle Cloud

2. Archivos de configuración:

    - main.tf: Define los recursos que serán provisionados en Oracle Cloud.

    - provider.tf: Configura el proveedor de Oracle Cloud.

    - terraform.tfvars: Variables de configuración para Oracle Cloud.

    - variables.tf: Variables utilizadas en la configuración.

3. Claves:

    - Asegúrate de tener tu archivo `oci.pem` para la autenticación con Oracle Cloud.

4. Inicializar Terraform:
```bash
cd oracle_terraform
terraform init
```
5. Verificar la configuración:
```bash
terraform plan
```
5. Aplicar cambios:
```bash
terraform apply
```

`Nota: Asegúrate de tener las credenciales correctas configuradas para cada uno de los proveedores y de no incluir ningún archivo sensible en el repositorio.`
