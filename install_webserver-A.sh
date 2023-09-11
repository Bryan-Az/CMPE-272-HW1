#!/bin/bash

# Update package lists
sudo yum update -y

# Install Apache web server
sudo yum install httpd -y

# Start Apache service and enable autostart
sudo systemctl start httpd
sudo systemctl enable httpd

# Create HTML content with server name (Server A or B)
if hostname | grep -q "server-a"; then
    echo '<!DOCTYPE html>' | sudo tee /var/www/html/index.html
    echo '<html>' | sudo tee -a /var/www/html/index.html
    echo '<body>' | sudo tee -a /var/www/html/index.html
    echo '<h1>Server A</h1>' | sudo tee -a /var/www/html/index.html
    echo '</body>' | sudo tee -a /var/www/html/index.html
    echo '</html>' | sudo tee -a /var/www/html/index.html
else
    echo '<!DOCTYPE html>' | sudo tee /var/www/html/index.html
    echo '<html>' | sudo tee -a /var/www/html/index.html
    echo '<body>' | sudo tee -a /var/www/html/index.html
    echo '<h1>Server B</h1>' | sudo tee -a /var/www/html/index.html
    echo '</body>' | sudo tee -a /var/www/html/index.html
    echo '</html>' | sudo tee -a /var/www/html/index.html
fi

# Restart Apache to apply changes
sudo systemctl restart httpd

echo "Web server setup complete."