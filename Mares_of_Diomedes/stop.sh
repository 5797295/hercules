#!/bin/bash
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    stop.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jukim <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/04/14 20:21:07 by jukim             #+#    #+#              #
#    Updated: 2018/04/14 20:21:07 by jukim            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

./manger &

echo "manger on"

pkill -4 podargos
pkill -5 lampon
pkill -10 xanthos
pkill -11 deinos
pkill -5 ruins
pkill -5 *.poo

echo "manger dead"

rm -rf *.poo
