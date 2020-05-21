#!/bin/sh

cd `git rev-parse --show-toplevel`
mkdocs build -c -s
