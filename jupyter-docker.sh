#!/bin/bash

image=continuumio/scipy-notebook
image=gnatecheng/scipy-notebook
name=$(basename $image)

usage ()
{
	echo $"Usage: $0 {start|stop|status|restart|logs|install|status|shell|exec}" 1>&2
	RETVAL=2
}

# start
start()
{
		# -v $HOME/.jupyter:/home/$USER/.jupyter \
	docker run \
        --name $name \
        -e NB_USER=$USER -e NB_UID=$UID \
        -v $PWD:/home/$USER \
        -d \
		-it -p 8888:8888 \
		$image
}

# install
install()
{
	docker pull $image
}

# logs
logs()
{
	docker logs -f $name
}

# stop
stop ()
{
	docker rm -f $name
}

sh ()
{
	docker exec -it $name bash
}

exec ()
{
	docker exec $name $*
}

status ()
{
	docker ps -f "name=$name"
}

restart ()
{
	stop
	start
}

case "$1" in
    install) install ;;
    start) start ;;
    rm|delete|stop) stop ;;
    ps|status) status ;;
    restart|reload|force-reload) restart ;;
    logs|log) logs ;;
    sh|shell|bash) sh ;;
    exec) shift; exec $* ;;
    *) usage ;;
esac

exit $RETVAL
