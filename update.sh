#!/bin/bash
echo 'Version 0.0.2 release'
echo 'Updates are only obtained from the certified main server and site for security purposes.'
echo 'For your repository to be accepted, you must file a repo to our servers. Users will be warned of dangerous repo added to their computer.'
echo 'If your update contains important fixes and good features updates for our current files, feel free to send us your package with a description of the new update and what has been changed.'
echo 'Creating new package folder'
mkdir packages
cd packages
echo 'Getting updates list from trusted remote server...'
echo 'Caching and downloading all updates lists...'
wget http://taq.owlg.org/taqu/repo/main.txt -o listnew.txt
echo 'Downloading packages and updates that are only new, compared with local list...'
echo 'Comparing old list of updates and new list of updates...'
echo 'Generating new update list for this server...'
sdiff listnew.txt currlist.txt >> listupdate.txt
echo 'Downloading only new packages...'
wget --user=demo --password=demouser1 -r -np -l 1 -A zip listupdate.txt
echo 'Changing file names for future updates...'
mv listnew.txt currlist.txt
echo 'Removing all generated update lists, and cached lists...'
rm listupdate.txt
echo 'cleaned'
echo 'done'

echo 'Downloading packages and updates in lists...'
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
