git clone <your-repo>
cd <your-repo>
(optional: check your current list of remote url with `git remote -v` before and after the following command)
git remote add quartz https://github.com/jackyzha0/quartz.git
git fetch quartz
git checkout -b <name-of-your-branch-for-quartz-migration>
git push origin <name-of-your-branch-for-quartz-migration>

Remember to run
git fetch quartz
every now and then.


git clone git@github.com:princomp/princomp.github.io.git
cd princomp.github.io/
git remote add csci-1301 git@github.com:csci-1301/csci-1301.github.io.git
git fetch csci-1301
git checkout -b csci-1301-import
git push origin csci-1301-import

git pull
git branch -M main
git push -u origin main
