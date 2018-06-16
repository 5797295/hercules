#!/bin/bash

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    apple.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jukim <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/05/04 11:14:20 by jukim             #+#    #+#              #
#    Updated: 2018/05/04 11:14:20 by jukim            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

if [ "$#" -ne 3 ] ; then
	echo -e "\033[0;31mPlease Enter:\033[0m \033[1;35m\033[1m./apple.sh\033[0m \033[1;32m\033[1m\033[4m<Hostname>\033[0m \033[1;33m\033[1m\033[4m<ServerIP>\033[0m \033[1;34m\033[1m\033[4m<PortNumber>"
	exit 1
fi

HOST_NAME=$1
SERVER_IP=$2
PORT_NUMBER=$3

ssh-keygen -t rsa

ssh-copy-id $HOST_NAME@$SERVER_IP -p $PORT_NUMBER

cat ~/.ssh/id_rsa.pub | ssh $HOST_NAME@$SERVER_IP -p $PORT_NUMBER "mkdir -p ~/.ssh && chmod 700 ~/.ssh && cat >>  ~/.ssh/authorized_keys"
