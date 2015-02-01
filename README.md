# Heroku buildpack for Meteor

## Supported version

This buildpack is dedicated for use with Meteor 1.0+.

## Usage

You can watch [video](http://youtu.be/boeTv3527E0) showing how to use buildpack.

First you have to create Meteor application

```
$ meteor create helloworld
helloworld: created.

To run your new app:
   cd helloworld
   meteor
```

Create manifest.yml and put it under the application root folder.
Here is the sample yml.
```
---
applications:
- memory: 1GB
  domain: mybluemix.net
  path: .
  buildpack: https://github.com/bancha001/bluemix-buildpack-meteor1
  host: lbv4
  name: lbv4
  disk: 512M
  services:
    - MongoLab-4d
  instances: 1
```

In .meteor folder, open the platforms file then remove the ios and android entries
