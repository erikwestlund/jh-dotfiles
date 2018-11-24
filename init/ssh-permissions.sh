mkdir -p ~/.ssh
chmod -f 700 ~/.ssh || :

FILE=~/.ssh/authorized_keys 
if [ -f $FILE ]; then
   chmod -f 644 $FILE || exit 0
fi

FILE=~/.ssh/known_hosts 
if [ -f $FILE ]; then
   chmod -f 644 $FILE || exit 0
fi

FILE=~/.ssh/config 
if [ -f $FILE ]; then
   chmod -f 644 $FILE || exit 0
fi

FILE=~/.ssh/id_rsa 
if [ -f $FILE ]; then
   chmod -f 600 $FILE || exit 0
fi

FILE=~/.ssh/github_rsa 
if [ -f $FILE ]; then
   chmod -f 600 $FILE || exit 0
fi

FILE=~/.ssh/*.pub 
if [ -f $FILE ]; then
   chmod -f 644 $FILE || exit 0
fi

FILE=~/.ssh/*.pem 
if [ -f $FILE ]; then
   chmod -f 644 $FILE || exit 0
fi
