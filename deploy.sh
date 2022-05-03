
set -e
# build
npm run build

cd dist

git init
git add -A
git commit -m 'deploy'
git push -f git@github.com:Sof-97/vue-boolfix.git master:gh-pages
cd -