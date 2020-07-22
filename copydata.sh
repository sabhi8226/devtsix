if ls /root/ | grep task6data
then
cp -rvf * /root/task6data
else
mkdir /root/task6data
cp -rvf * /root/task6data
fi
