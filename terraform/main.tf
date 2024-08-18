resource "aws_instance" "store_app_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_pair
  associate_public_ip_address = true
  
  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install -y nginx nodejs npm
              sudo apt nginx start

              # Install and setup store app
              mkdir -p /var/www/store-app
              cd /var/www/store-app
              curl -O https://raw.githubusercontent.com/Ashishm96/Deploy-StoreApp/main/store-app/app.js
              
              npm init -y
              npm install express --save
              nohup node /var/www/store-app/app.js &

              # Nginx configuration
              sudo rm /etc/nginx/sites-enabled/default
              sudo bash -c 'cat <<EOT > /etc/nginx/sites-available/store_app
              server {
                  listen 80;
                  server_name _;
                  location / {
                      proxy_pass http://localhost:3000;
                      proxy_http_version 1.1;
                      proxy_set_header Upgrade \$http_upgrade;
                      proxy_set_header Connection "upgrade";
                      proxy_set_header Host \$host;
                      proxy_cache_bypass \$http_upgrade;
                  }
              }
              EOT'

              sudo ln -s /etc/nginx/sites-available/store_app /etc/nginx/sites-enabled/
              sudo systemctl restart nginx
              sudo systemctl enable nginx
  EOF

  tags = {
    Name = "StoreAppInstance"
  }
}
