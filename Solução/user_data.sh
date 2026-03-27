#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "Desafio DevOps #1 — Deploy realizado com sucesso!" > /var/www/html/index.html
