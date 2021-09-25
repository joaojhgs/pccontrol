# pccontrol
Pc remote control via firebase API

It currently utilizes an unsafe way to communicate through the internet using a firebase realtime database, which is public and can be edited through simple http requests.

This current version is not meant to be executed on any computer since it can give access to malicious people, allowing them to control your computer through the predefined CLI commands (until you restart your pc atleast).
