# car-thing-buildroot
This is a partial buildroot for the Spotify Car Thing.

It is not a full buildroot (e.g. it does not contain a kernel) so it cannot be deployed to the device. It's intended use is for cross compilation.

Run `make` to build it, the output will be in the `/output` directory. Additionally, you can run `make menuconfig` to customize it.
