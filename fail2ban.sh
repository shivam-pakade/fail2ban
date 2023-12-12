#!/bin/bash
echo "[root@localhost ~]# sudo systemctl start firewalld"
sudo systemctl start firewalld
echo "[root@localhost ~]# sudo systemctl enable firewalld"
sudo systemctl enable firewalld
echo "[root@localhost ~]# sudo systemctl status firewalld"
sudo systemctl status firewalld
echo "[root@localhost ~]# sudo firewall-cmd --list-all"
sudo firewall-cmd --list-all
echo "[root@localhost ~]# sudo dnf install epel-release"
sudo dnf install epel-release
echo "[root@localhost ~]# sudo dnf install fail2ban fail2ban-firewalld"
sudo dnf install fail2ban fail2ban-firewalld
echo "[root@localhost ~]# sudo systemctl start fail2ban"
sudo systemctl start fail2ban
echo "[root@localhost ~]# sudo systemctl enable fail2ban"
sudo systemctl enable fail2ban
echo "[root@localhost ~]# sudo systemctl status fail2ban"
sudo systemctl status fail2ban
echo "[root@localhost ~]# sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local"
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
echo "[root@localhost ~]# sudo vim /etc/fail2ban/jail.local"
sudo vim /etc/fail2ban/jail.local
echo "[root@localhost ~]# sudo mv /etc/fail2ban/jail.d/00-firewalld.conf /etc/fail2ban/jail.d/00-firewalld.local"
sudo mv /etc/fail2ban/jail.d/00-firewalld.conf /etc/fail2ban/jail.d/00-firewalld.local
echo "[root@localhost ~]# sudo systemctl restart fail2ban"
sudo systemctl restart fail2ban
sudo bash -c "cat > /etc/fail2ban/jail.d/sshd.local<<EOF
[sshd]
enabled = true

# Override the default global configuration
# for specific jail sshd
bantime = 1m
maxretry = 3
EOF"
echo "[root@localhost ~]# sudo vim /etc/fail2ban/jail.d/sshd.local"
sudo vim /etc/fail2ban/jail.d/sshd.local
echo "[root@localhost ~]# sudo systemctl restart fail2ban"
sudo systemctl restart fail2ban
echo "[root@localhost ~]# sudo fail2ban-client status"
sudo fail2ban-client status
echo "[root@localhost ~]# sudo fail2ban-client get sshd maxretry"
sudo fail2ban-client get sshd maxretry
echo "[root@localhost ~]# sudo fail2ban-client status sshd"
sudo fail2ban-client status sshd
read -p "enter client ip " clientip
sudo fail2ban-client unban $clientip
echo "[root@localhost ~]# sudo fail2ban-client status sshd"
sudo fail2ban-client status sshd
