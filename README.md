# Heroku buildpack for Meteor

## Supported version

This buildpack is dedicated for use with Meteor 1.0+.

## Usage

* Create Meteor application

```
$ meteor create testmeteor
helloworld: created.

To run your new app:
   cd testmeteor
   meteor
```
* Run and test the functions in your local until all functions are stistisfied

* Delete the .meteor/local from testmeteor folder. Otherwise unneccessary files will be upload when you deploy it to bluemix and it will take time to upload.

* Create manifest.yml and put it under the testmeteor folder.
Here is the sample yml.
```
---
applications:
- memory: 1GB
  domain: mybluemix.net
  path: .
  buildpack: https://github.com/bancha001/bluemix-buildpack-meteor1
  host: testmeteor
  name: testmeteor
  disk: 512M
  services:
    - MongoLab-4d
  instances: 1
```

* In .meteor folder, open the platforms file then remove the ios and android entries (if there exist)
Run 
```
cf push testmeteor -b https://github.com/bancha001/bluemix-buildpack-meteor1

```
