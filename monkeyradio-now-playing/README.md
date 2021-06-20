# monkeyradio-now-playing

 'Now Playing' is a simple service that uses `mpc` to get the current track
 playing on the specified mpd server.  This info is published a http api.  See
 below for more details

## Installation and Usage

 Now playing is meant to be used in a docker container as part of the "monkeyradio reborn".

The Dockerfile will build an exe and run it in a minimal container.

The only configuration option is the `MPD_SERVER` environment variable.
