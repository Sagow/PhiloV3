SRCS =			error_messages.c	\
				forks.c				\
				observing.c			\
				parsing.c			\
				philosophers.c		\
				printing.c			\
				transitions.c		\
				utils_process.c		\
				utils_time.c		\
				utils.c

OBJS =			${SRCS:.c=.o}

INCLUDES =		-Iincludes

FLAGS =			-Wall -Werror -Wextra ${INCLUDES}

CFLAGS =		$(INCLUDES)

ifeq ($(DEBUG), 1)
	CFLAGS += -fsanitize=address
endif
ifeq ($(DEBUG), 2)
	CFLAGS += -fsanitize=thread
endif

CC =			gcc

NAME =			philo

RM =			rm -f

.c.o:
				${CC} -c $< -o ${<:.c=.o} ${FLAGS} -g

${NAME}:		${OBJS}
				${CC} ${OBJS} -g -o ${NAME} -pthread ${CFLAGS}

all:			${NAME}

clean :
				${RM} ${OBJS}

fclean :		clean
				${RM} ${NAME}

re :			fclean all