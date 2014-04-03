#!/bin/bash
echo 'Updates are only obtained from the certified main server, site for security purposes.'
echo 'Getting updates package...'
wget www.owlg.org/taq/update/update.zip
echo 'Updates package retrieved.'
echo 'Expanding update package...'
unzip update.zip
mv -r update /var/www/html/tamain/
echo 'done.'
