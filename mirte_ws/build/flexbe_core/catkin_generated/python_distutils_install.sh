#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/mirte/NGR-Goose/mirte_ws/src/flexbe_behavior_engine/flexbe_core"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/mirte/NGR-Goose/mirte_ws/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/mirte/NGR-Goose/mirte_ws/install/lib/python3/dist-packages:/home/mirte/NGR-Goose/mirte_ws/build/flexbe_core/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/mirte/NGR-Goose/mirte_ws/build/flexbe_core" \
    "/usr/bin/python3" \
    "/home/mirte/NGR-Goose/mirte_ws/src/flexbe_behavior_engine/flexbe_core/setup.py" \
    egg_info --egg-base /home/mirte/NGR-Goose/mirte_ws/build/flexbe_core \
    build --build-base "/home/mirte/NGR-Goose/mirte_ws/build/flexbe_core" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/mirte/NGR-Goose/mirte_ws/install" --install-scripts="/home/mirte/NGR-Goose/mirte_ws/install/bin"
