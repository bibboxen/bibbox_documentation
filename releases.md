# Release process (draft)

* git check master
* git merge --no-ff development
* git push
* git tag v1.x.x

* update.sh or install.sh
* tar -zcf v1.x.x.tar.gz .
* Upload to tag on github
