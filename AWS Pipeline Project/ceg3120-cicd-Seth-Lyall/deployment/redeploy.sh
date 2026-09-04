#! /usr/bin/bash
# redeploy lyalls2004/the-website:latest to lb-server1, 2, and 3
# using ssh `bash -s` and docker pull, stop, rm, and run commands
# ssh into each server via their private ips and run the following commands:

sleep 60
for server in 192.168.1.10 192.168.1.20 192.168.1.30; do
  ssh -o "StrictHostKeyChecking=no" -i /home/ubuntu/Keys/ceg3120-vockey.pem ubuntu@$server "bash -s" <<'EOF'
    sudo docker pull lyalls2004/the-website:latest
    sudo docker stop the-website
    sudo docker rm the-website
    sudo docker run -d --restart always -p 80:80 --name the-website lyalls2004/the-website:latest
EOF
done