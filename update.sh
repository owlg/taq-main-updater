#!/bin/bash
echo 'Updates are only obtained from the certified main server, site for security purposes.'
echo 'Creating new package folder'
mkdir packages
cd packages
echo 'Getting updates list...'
wget --user=demo --password=demouser1 -r -np -l 1 -A zip http://taq.owlg.org/taqu/list.txt
echo 'Updates package retrieved.'
echo 'Expanding update package...'
unzip *.zip
echo 'Packages expanded.'
echo 'Cleaning up and removing all compressed packages...'
rm *.zip
echo 'Cleaned.'
echo 'Moving, applying and installing all expanded packages.'
mv -r * /var/www/html/tamain/
echo 'done.'
