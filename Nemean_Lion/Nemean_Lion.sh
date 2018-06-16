#!/bin/bash

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Nemean_Lion.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jukim <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/02/23 19:44:13 by jukim             #+#    #+#              #
#    Updated: 2018/02/23 22:45:12 by jukim            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# At VirtualBox 'Global Tools' :
# 'Host Network Manager' -> create
# 'Settings' -> 'Network' -> 'Adapter 2' -> 'Attached to:' Host-only Apdapter

# At /etc/network/interfaces :
# input "auto <address name>"
# input "iface <address name> inet static"
# input "address <inet address>"
# input "netmask <netmask address>"

apt-get install openssh-server

sed -i -e 's/Port 22/Port 59959/' /etc/ssh/sshd_config

service sshd restart
