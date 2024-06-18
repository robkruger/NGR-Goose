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

echo_and_run cd "/home/rob/NGR-Goose/mirte_ws/src/generic_flexbe_states/flexbe_manipulation_states"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/rob/NGR-Goose/mirte_ws/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/rob/NGR-Goose/mirte_ws/install/lib/python3/dist-packages:/home/rob/NGR-Goose/mirte_ws/build/flexbe_manipulation_states/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/rob/NGR-Goose/mirte_ws/build/flexbe_manipulation_states" \
    "/usr/bin/python3" \
    "/home/rob/NGR-Goose/mirte_ws/src/generic_flexbe_states/flexbe_manipulation_states/setup.py" \
     \
    build --build-base "/home/rob/NGR-Goose/mirte_ws/build/flexbe_manipulation_states" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/rob/NGR-Goose/mirte_ws/install" --install-scripts="/home/rob/NGR-Goose/mirte_ws/install/bin"
