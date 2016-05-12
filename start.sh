#!/usr/bin/env bash

envtpl /etc/diamond/diamond.conf.tpl

/usr/local/bin/diamond -f --skip-pidfile -l -c /etc/diamond/diamond.conf
