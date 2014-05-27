# HANDYMIC HUB SERVER

Handymic hub (voip) server to be run on handymic-hub (eg. raspberry-pi). This
is the hub service that all clients will eventually discover & connect to.


## Running

To setup & run:

    $ make run

To redo setup & run:

    $ make run/clean

In order for the run to be successful, pls ensure the `$PATH` contains:
* `openssl`
* `umurmurd`


## TODO

The tweaking of `tpls/umurmur.conf` is work in progress, the idea is to
eventually simplify it to bare minimal to meet just the requirements of
handymic.


## License

See LICENSE

