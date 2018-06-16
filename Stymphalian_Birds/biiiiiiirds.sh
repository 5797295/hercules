#!/bin/bash
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    biiiiiiirds.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jukim <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/03/30 18:29:28 by jukim             #+#    #+#              #
#    Updated: 2018/03/30 18:29:28 by jukim            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

GITIGNORE()
{
	touch ./.gitignore
	echo "# Prerequisites
*.d

# Object files
*.o
*.ko
*.obj
*.elf

# Linker output
*.ilk
*.map
*.exp

# Precompiled Headers
*.gch
*.pch

# Libraries
*.lib
*.a
*.la
*.lo

# Shared objects (inc. Windows DLLs)
*.dll
*.so
*.so.*
*.dylib

# Executables
*.exe
*.out
/nfs/2018/j/jukim *.app
*.i*86
*.x86_64
*.hex

# Debug files
*.dSYM/
*.su
*.idb
*.pdb

# Kernel Module Compile Results
*.mod*
*.cmd
.tmp_versions/
modules.order
Module.symvers
Mkfile.old
dkms.conf

# Gitignore
.gitignore"  >> ./.gitignore
}

MAKEFILE()
{
	touch ./Makefile
	echo "NAME = 
FILES = 
SRC = \$(addprefix src/, \$(FILES))
CFLAGS = -I. -Wall -Wextra -Werror
LFLAGS = -L. ./src/libft/ -lft
OBJ = \$(FILES:.c=.o)

all = \$(NAME)

\$(NAME): lib
	@gcc \$(CFLAGS) -c \$(SRC)
	@gcc \$(CFLAGS) \$(LFLAGS) \$(OBJ) -o \$(NAME)

clean:
	@/bin/rm -f *.o *~ */*.o */*~

fclean: clean
	@make fclean -C ./src/libft
	@/bin/rm -f \$(NAME)

re: fclean all

lib:
	@make -C ./src/libft
	@make clean -C ./src/libft" >> ./Makefile
}

LIBFT()
{
	mkdir ./src
	mkdir ./src/libft
	cp ~/Life_is_42/lv0/libft/* ./src/libft
}

AUTHOR()
{
	touch ./author
	echo "jukim" >> ./author
}

if [[ $1 = "-all" ]]; then
	GITIGNORE
	MAKEFILE
	LIBFT
	AUTHOR
	exit
fi

if  [[ $1 = "-h" || $1 = "--help" ]]; then
	echo "usage:  biiiiiiirds.sh [options]
Help: biiiiiiirds.sh creates .gitignore, Makefile template,
      author file for user, jukim, and Libft within src directory.
[OPTIONS]
	-h, --help			Prints this help
	-g, --gitignore			Create .gitignore
	-m, --makefile			Create Makefile Template
	-l, --libft			Create Libft in src directory
	-a, --author			Create author file
	-all				Create all of the above"
	exit
fi

if  [[ $1 = "-g" || $1 = "--gitignore" ]]; then
	GITIGNORE
	exit
fi

if  [[ $1 = "-l" || $1 = "--libft" ]]; then
	LIBFT
	exit
fi

if  [[ $1 = "-a" || $1 = "--author" ]]; then
	AUTHOR
	exit
fi

if  [[ $1 = "-m" || $1 = "--makefile" ]]; then
	MAKEFILE
	exit
fi

if [[ $1 != "" && $1 != "-m" && $1 != "--makefile" && $1 != "-h" && $1 != "--help" && $1 != "-l" && $1 != "--libft" && $1 != "-a" && $1 != "--author" && $1 != "-g" && $1 != "--gitignore" && $1 != "-all" ]]; then
	echo "invalid option: $1"
	exit
fi

while true; do
	read -p "Do you wish to install this program? (yes/no) (enter x to exit)
" yn 
	case $yn in
		yes ) read -p "Select your choice of programming language for gitignore. (enter x to exit)
" yn
			case $yn in
				C) ;;
				c) ;;
				x ) exit;;
				* ) echo "Anything other than C is not currently supported."; break;;
			esac;
			read -p "Do you wish to make gitignore for C? (yes/no) (enter x to exit)
" yn
			case $yn in
				yes ) GITIGNORE;;
				no ) ;;
				x ) exit;;
				* ) echo "Please answer yes or no.";;
			esac;
			read -p "Do you wish to make Makefile? (yes/no) (enter x to exit)
" yn
			case $yn in
				yes ) MAKEFILE;;
				no ) ;;
				x ) exit;;
				* ) echo "Please answer yes or no.";;
			esac;
			read -p "Do you wish to make libft at src/libft? (yes/no) (enter x to exit)
" yn
			case $yn in
				yes ) LIBFT;;
				no ) ;;
				x ) exit;;
				* ) echo "Please answer yes or no.";;
			esac;
			read -p "Do you with to make author file? (yes/no) (enter x to exit)
" yn
			case $yn in
				yes ) AUTHOR; exit;;
				no ) exit;;
				x ) exit;;
				* ) echo "Please answer yes or no.";;
			esac;;
		no ) exit;;
		x ) exit;;
		ang ) echo "기모찌!"; exit;;
		* ) echo "Please answer yes or no.";;
	esac
done
