if [ -d /usr/local/lib/pkgconfig ] ; then
        pathappend /usr/local/lib/pkgconfig PKG_CONFIG_PATH
fi
if [ -d /usr/local/bin ]; then
        pathprepend /usr/local/bin
fi
if [ -d /usr/local/sbin -a $EUID -eq 0 ]; then
        pathprepend /usr/local/sbin
fi
for directory in $(find /opt/*/lib/pkgconfig -type d 2>/dev/null); do
        pathappend $directory PKG_CONFIG_PATH
done
for directory in $(find /opt/*/bin -type d 2>/dev/null); do
        pathappend $directory
done
if [ -d ~/bin ]; then
        pathprepend ~/bin
fi
#if [ $EUID -gt 99 ]; then
#        pathappend .
#fi
