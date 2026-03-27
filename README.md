# 🧩 Desafio DevOps #01 — Provisionamento de EC2 com Terraform

Este repositório contém a solução do **Desafio DevOps #01**, que consiste em criar uma **instância EC2 com webserver** na AWS utilizando **Terraform**.

O objetivo é praticar **Infraestrutura como Código (IaC)**, configuração de Security Groups e execução de scripts automáticos com **User Data**.

---

## 🎯 Objetivo do Desafio

1. Criar uma instância EC2 (`t2.micro`) com **Amazon Linux 2023**.
2. Criar um **Security Group** com:

   * Porta **22/tcp** liberada (SSH)
   * Porta **80/tcp** liberada (HTTP)
3. Configurar **User Data** para instalar automaticamente um webserver Apache.
4. Expor o **IP público** da instância como **output do Terraform**.
5. Adicionar **tags de identificação** nos recursos.

---

## 📁 Estrutura do Repositório

```text
/desafio
├── main.tf            ← Arquivo principal do Terraform
├── variables.tf       ← Variáveis opcionais do Terraform
├── outputs.tf         ← Outputs recomendados (IP público, DNS)
├── user_data.sh       ← Script bash para instalar webserver
└── README.md          ← Este arquivo
```

---

## ⚙️ Arquivos Terraform

### **main.tf**

Define:

* Provider AWS
* EC2 instance
* Security Group
* Associação do User Data
* Tags e IP público

### **variables.tf** (opcional)

Define variáveis:

* `ami_id` → AMI da instância
* `instance_type` → Tipo da instância
* `key_name` → Chave SSH
* `tags` → Tags da EC2

### **outputs.tf**

Define outputs:

* `public_ip` → IP público da EC2
* `public_dns` → DNS público (opcional)

---

## 📝 User Data Script

Arquivo **user_data.sh**:

```bash
#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "Desafio mentoria Bruno Feliano" > /var/www/html/index.html
```

> Pode ser referenciado no `main.tf` via:

```hcl
user_data = file("user_data.sh")
```

---

## 🚀 Como Executar

1. Entre na pasta do desafio:

```bash
cd desafio
```

2. Inicialize o Terraform:

```bash
terraform init
```

3. Valide a configuração:

```bash
terraform validate
terraform fmt
```

4. Execute o plano e aplique a infraestrutura:

```bash
terraform plan
terraform apply
```

5. Acesse o **IP público** exibido no `terraform output` para conferir o webserver rodando.

6. Para destruir a infraestrutura:

```bash
terraform destroy
```

---

## 💡 Dicas Importantes

* Use **t2.micro** para evitar custos no Free Tier da AWS.
* Escolha a **AMI correta** para sua região (ex: `Amazon Linux 2023`).
* Sempre teste em pequenas partes (Security Group, EC2) antes de aplicar tudo.
* Use **User Data** para automatizar instalação e configuração do webserver.

---

## 🔗 Referências

* [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
* [AWS EC2 Documentation](https://docs.aws.amazon.com/ec2/index.html)

---

Se você quiser, eu posso **já montar o README final completo** com Markdown pronto para colar no seu repo, incluindo **links, destaque de código e outputs**, pronto para enviar.

Quer que eu faça isso?
