/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jukim <marvin@42.fr>                       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/03/03 15:55:09 by jukim             #+#    #+#             */
/*   Updated: 2018/03/03 19:28:12 by jukim            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

int main()
{
	char str[100];
	int listen_fd, comm_fd;
	struct sockaddr_in servaddr;

	listen_fd = socket(AF_INET, SOCK_STREAM, 0);

	bzero( &servaddr, sizeof(servaddr));

	servaddr.sin_family = AF_INET;
	servaddr.sin_addr.s_addr = htons(INADDR_ANY);
	servaddr.sin_port = htons(44444);

	bind(listen_fd, (struct sockaddr *) &servaddr, sizeof(servaddr));

	listen(listen_fd, 15);

	comm_fd = accept(listen_fd, (struct sockaddr*) NULL, NULL);

	while(1)
	{
		bzero(str, 100);
		read(comm_fd, str, 100);
		write(comm_fd, str, sizeof(str));
		printf("%s", str);
		write(comm_fd, str, sizeof(str));
		break ;
	}
}
