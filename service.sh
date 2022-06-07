#!bin/sh

wait_boot_complete()
{
	while [ "`getprop sys.boot_completed | tr -d '\r' `" != "1" ]
	do
		sleep 1
	done
}

wait_boot_complete

if [ -x "\$(command -v setenforce)" ]
then
	setenforce 1
else
	echo -n 1 > /sys/fs/selinux/enforce
fi

EOF
