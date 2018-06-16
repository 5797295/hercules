/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jukim <marvin@42.fr>                       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/03/03 15:55:57 by jukim             #+#    #+#             */
/*   Updated: 2018/03/03 19:36:26 by jukim            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <stdio.h>
#include <string.h>
#include <arpa/inet.h>
#include <unistd.h>

int main()
{
	int sockfd;
	char sendline[100];
	char recvline[100];
	struct sockaddr_in servaddr;

	sockfd=socket(AF_INET,SOCK_STREAM, 0);

	bzero(&servaddr, sizeof servaddr);

	servaddr.sin_family=AF_INET;
	servaddr.sin_port=htons(44444);

	inet_pton(AF_INET, "127.0.0.1", &(servaddr.sin_addr)); // localhost/loopback address.

	connect(sockfd,(struct sockaddr *)&servaddr, sizeof(servaddr));

	while(1)
	{
		bzero(sendline, 100);
		bzero(recvline, 100);
		fgets(sendline, 100, stdin);
		write(sockfd, sendline, sizeof(sendline));
		read(sockfd, recvline, 100);
		printf("%s%s", recvline, recvline);
		break ;
	}
}
