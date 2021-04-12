#! /bin/bash
set -e

if [ "$ERLANG_COOKIE" ]; then
    cookieFile='/var/lib/rabbitmq/.erlang.cookie'
    if [ -e "$cookieFile" ]; then
        if [ "$(cat "$cookieFile" 2>/dev/null)" != "$ERLANG_COOKIE" ]; then
            echo >&2
            echo >&2 "warning: $cookieFile contents do not match ERLANG_COOKIE"
            echo >&2
        fi
    else
        echo "$ERLANG_COOKIE" > "$cookieFile"
        chmod 600 "$cookieFile"
        chown rabbitmq "$cookieFile"
    fi
fi
echo $ERLANG_COOKIE
exec gosu rabbitmq docker-entrypoint.sh "$@"
