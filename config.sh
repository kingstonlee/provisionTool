CURRENTRESOLVCONF='/etc/resolv.conf'
GITRESOLVCONF='/opt/provisionTool/resolvconf/resolv.conf'

# Reset Firewall
echo "Clearing Firewall Changes"
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -F

# Are there changes to Apache Hello World file?
if ! [ -f ${CURRENTRESOLVCONF} ]; then
  echo "No Resolv.conf, default copied!"
  cp $GITRESOLVCONF $CURRENTRESOLVCONF
elif cmp ${CURRENTRESOLVCONF} ${GITRESOLVCONF}; then
  echo "Resolv.conf updated!"
else
  echo "Make sure default resolv.conf is copied!"
  cp $GITRESOLVCONF $CURRENTRESOLVCONF
fi
