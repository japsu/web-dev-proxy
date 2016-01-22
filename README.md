# Dev proxy for Haskell backend & Elm reactor

Listens on port 9000. Everything under `/api` is proxied to port 3000. Everything else is proxied to port 8000.

## Getting started

`haskell-stack` is required.

    git clone git@github.com:leonidas/web-dev-proxy
    cd web-dev-proxy
    stack setup
    stack build
    stack exec web-dev-proxy
    open http://localhost:9000

## TODO

* Configuration (port numbers 3000, 8000 and 9000 are hard-coded)
* Logging (currently it says nothing)