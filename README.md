# Project Enthusiast

The Enthusiast project is supposed to be a simple application for Barcamp organization.

At the same time it serves as a learning project for Dart language and polymer.dart.
 
## How-To Install & Run
The following instructions presume you have [Dart SDK](https://www.dartlang.org/downloads/) installed on your ```PATH```.
Also you need a running MongoDb instance.

1. Clone the repository and download dependencies:

        git clone git@github.com:danekja/enthusiast.git
        cd enthusiast
        pub get
2. Modify ```bin/enthusiast.dart``` with your MongoDb connection information.
3. Start the server ```dart bin/enthusiast.dar```
4. Go to the [browser](http://localhost:8080/)

See the following section for list of implemented functionality and its URLs.

## URL List
This section contains brief overview of the application's routing.

### Server routes
Web service API overview.

* /login - user sign-in
* /logout - sign-out
* /users - User entity endpoint.
    * GET for listing all users
    * POST for new user registration
    * PUT /:id for user update

## Licensing

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">This project</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="http://www.danekja.org" property="cc:attributionName" rel="cc:attributionURL">Jakub Danek</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.

Full text of the license may be found in the attached LICENSE file.
