# pccontrol
Pc remote control via firebase API

It currently utilizes an unsafe way to communicate through the internet using a firebase realtime database, which is public and can be edited through simple http requests.

This current version is not meant to be executed on any computer since it can give access to malicious people, allowing them to control your computer through the predefined CLI commands (until you restart your pc atleast).

You can create your own private firebase database and utilize for personal use as long as you don't share with anyone the code and the API url, just replace my test url with yours, and edit it through any way you like using HTTP post/put requests.
