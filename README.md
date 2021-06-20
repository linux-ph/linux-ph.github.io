---
layout: page
title: README
---

Contributing
------------

Fork <https://github.com/linux-ph/linux-ph.github.io>, make your changes, then make a pull request.

You can use your own [Jekyll](https://jekyllrb.com/) install but to make testing with a consistent environment easier,
a container image is available. If you use `docker`, `alias podman="docker"`.

Assuming that the repository has been cloned into `~/linux-ph`, run the Jekyll container with
`podman run --rm --publish 4000:4000/tcp --publish 35729:35729/tcp --volume ~/linux-ph:/var/www ghcr.io/linux-ph/jekyll:latest` and
go to <http://localhost:4000/>.

The container runs `jekyll server --host 0.0.0.0 --livereload` by default. You can override this by supplying different parameters.
To build the site manually for example, you can execute
`podman run --rm --volume ~/linux-ph:/var/www ghcr.io/linux-ph/jekyll:latest build`

If you are using a system with SELinux enabled, mount the host directory with `:Z` e.g. `--volume ~/linux-ph:/var/www:Z` to
relabel it. Alternatively, you can disable label confinement with `--security-opt "label=disable"`.

Building the Jekyll container
-----------------------------

```sh
$ podman build --file Containerfile.build --tag localhost/jekyll-build:latest ${PWD}
$ podman run --rm localhost/jekyll-build:latest > ruby-3.0.1-jekyll.tar.gz
$ podman build --tag ghcr.io/linux-ph/jekyll:latest ${PWD}
```
