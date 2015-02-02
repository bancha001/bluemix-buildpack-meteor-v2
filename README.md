# Bluemix buildpack for Meteor

## Supported version

This buildpack is dedicated for use with Meteor 1.0+.

## Usage

* Create Meteor application

```
$ meteor create testmeteor
testmeteor: created.

To run your new app:
   cd testmeteor
   meteor
```
* Run and test the application in your local until all functions are stistisfied

* Stop the application then delete the .meteor/local from testmeteor folder. Otherwise unneccessary files will be uploaded when you deploy it to bluemix and it will take longer time to upload.

* Create Mongodb service in Bluemix dashboad. The service id will be use in the next step. 

* Create manifest.yml and put it under the testmeteor folder.
Here is the sample yml.
```
---
applications:
- memory: 1GB
  domain: mybluemix.net
  path: .
  buildpack: https://github.com/bancha001/bluemix-buildpack-meteor
  host: testmeteor
  name: testmeteor
  disk: 512M
  services:
    - MongoLab-4d
  instances: 1
```

* In testmeteor/.meteor folder, open the platforms file then remove the ios and android entries (if there exist)

* Run 
```
cf push testmeteor -b https://github.com/bancha001/bluemix-buildpack-meteor

```
