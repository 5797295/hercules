# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    hippop.py                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jukim <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/04/20 15:11:01 by jukim             #+#    #+#              #
#    Updated: 2018/04/20 17:40:35 by jukim            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

from email.MIMEMultipart import MIMEMultipart

from email.MIMEText import MIMEText

from email.header import Header

from email.utils import formataddr

import getpass

import smtplib

fromEmail = raw_input('User Email: ')
fromEmailPW = getpass.getpass('Password: ')
toEmail = raw_input('To: ')
emailSubject = raw_input('Subject: ')
emailtext = raw_input('Content: ')

msg = MIMEMultipart('alternative')

msg['To'] = toEmail

msg['Subject'] = emailSubject

msg['From'] = formataddr((str(Header('JUUUUUUNHOOOOOO', 'utf-8')), fromEmail))

part1 = MIMEText(emailtext, 'plain')

msg.attach(part1)

server = smtplib.SMTP('smtp.gmail.com', 587)

server.starttls()

server.login(fromEmail, fromEmailPW)

server.sendmail(fromEmail, toEmail, msg.as_string())

server.quit()

print 'Email Sent!'
