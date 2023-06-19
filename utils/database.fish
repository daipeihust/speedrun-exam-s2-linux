#!/usr/bin/env bash
# -*- coding: utf-8 -*-

function create_database
    argparse n/name -- $argv
    or return 1

    if set -ql _flag_name
        set -f name $argv[1]
    else
        return 1
    end

    echo "
        CREATE USER '"{$name}"'@'localhost' IDENTIFIED BY '"{$name}"';
        CREATE DATABASE '"{$name}"';
        GRANT ALL ON '"{$name}"'.* TO '"{$name}"'@'localhost';
        FLUSH PRIVILEGES;
    " | sudo mysql -u root
end
