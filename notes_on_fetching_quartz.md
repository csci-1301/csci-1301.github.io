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
