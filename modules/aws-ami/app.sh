  #! /bin/bash
  
  # System Update
  yum update -y
  
  # Install Apache Package and service start and enable.
  yum install -y httpd
  systemctl enable --now httpd
  
  # Create a directory and move to these directory.
  mkdir /code
  cd /code
  
  # Web Application Code installed in the machine and configured.
  wget https://www.free-css.com/assets/files/free-css-templates/download/page296/carvilla.zip
  unzip *.zip
  rm -rvf *.zip
  cd *
  cp -rvf . /var/www/html
  rm -rvf *
  
  # Restart Apache Service
  systemctl restart httpd
