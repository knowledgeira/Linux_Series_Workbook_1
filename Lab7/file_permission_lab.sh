declare -A users
users=( ["manoj"]="password1" ["ganesh"]="password2" ["shubh"]="password3" ["deepika"]="password4" ["priyanka"]="password5" )

for user in "${!users[@]}"; do
    sudo useradd $user
    echo "$user:${users[$user]}" | sudo chpasswd

done


# Create groups
sudo groupadd devops
sudo groupadd developers

# Add users to groups
sudo usermod -aG devops manoj
sudo usermod -aG devops ganesh
sudo usermod -aG developers shubh
sudo usermod -aG developers deepika
sudo usermod -aG devops,developers priyanka

# Create sample files
touch /tmp/file_devops
touch /tmp/file_developers
touch /tmp/file_collaborative

# Set group ownership
sudo chown :devops /tmp/file_devops
sudo chown :developers /tmp/file_developers
sudo chown :devops /tmp/file_collaborative
sudo chgrp developers /tmp/file_collaborative

# Set permissions
sudo chmod 770 /tmp/file_devops
sudo chmod 770 /tmp/file_developers
sudo chmod 770 /tmp/file_collaborative
