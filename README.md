## gitlab-runner-meteor

This is a custom build of the original gitlab-runner Docker image from https://gitlab.com/gitlab-org/gitlab-ci-multi-runner. I've simply added some meteor tools i need to deploy my stuff.

Tested with Meteor 1.2.1

Toolchain:
* [NodeJS](https://nodejs.org)
* [NPM](https://www.npmjs.com/)
* [Meteor](https://www.meteor.com)
* [lftp](http://lftp.yar.ru/)

### .gitlab-ci.yml example

```yml
publish_live:
  only:
    - master
  script:
    - meteor build --directory meteor-app
    - cd meteor-app/bundle/
    - pushd programs/server/
    - npm install
    - popd
    - lftp -u $FTP_USER,$FTP_PASS -e 'mirror --only-newer --reverse --verbose --no-symlinks ./ ./' $FTP_HOST
  tags:
    - meteor
    - npm
    - node
```

> In Gitlab-CI project settings, i'm creating secret project variables for FTP_USER, FTP_PASS and FTP_HOST.

> If you are defining tags like i did in my example, you need to set those tags on your runner via Gitlab-CI settings too. If not, your build status will stay pending!

### Fix lftp certificate validation error
You need to perform the following actions as gitlab-runner user (`sudo su gitlab-runner`)
- create ~/.lftprc file with `set ssl:verify-certificate false` if certificate validation fails

### Usefull links
* [gitlab-runner config](https://gitlab.com/gitlab-org/gitlab-ci-multi-runner/blob/master/docs/configuration/advanced-configuration.md)
* [.gitlab-ci.yml](http://doc.gitlab.com/ci/yaml/README.html)
