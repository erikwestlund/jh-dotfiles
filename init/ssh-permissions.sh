mkdir -p $HOME/.ssh
chmod -f 700 $HOME/.ssh || :

FILE=$HOME/.ssh/authorized_keys 
if [ -f $FILE ]; then
   chmod -f 644 $FILE || exit 0
fi

FILE=$HOME/.ssh/known_hosts 
if [ -f $FILE ]; then
   chmod -f 644 $FILE || exit 0
fi

FILE=$HOME/.ssh/config 
if [ -f $FILE ]; then
   chmod -f 644 $FILE || exit 0
fi

FILE=$HOME/.ssh/id_rsa 
if [ -f $FILE ]; then
   chmod -f 600 $FILE || exit 0
fi

FILE=$HOME/.ssh/github_rsa 
if [ -f $FILE ]; then
   chmod -f 600 $FILE || exit 0
fi


FILE=$HOME/.ssh/letsrun.pem 
if [ -f $FILE ]; then
   chmod -f 644 $FILE || exit 0
fi
