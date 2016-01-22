# Dev proxy for Haskell backend & Elm reactor

Listens on port 9000. `/api` is proxied to port 3000. Everything else is proxied to port 8000.

## Compiling

    stack setup
    stack build

## TODO

* Configuration (port numbers 3000, 8000 and 9000 are hard-coded)
* Logging (currently it says nothing)