#!/bin/bash
set -e

if [[ $TRAVIS_OS_NAME = linux ]]; then
    mkdir -p My\ Projects/Torque3D/buildFiles/ubuntu
    pushd My\ Projects/Torque3D/buildFiles/ubuntu
    cmake ../../../.. -DTORQUE_APP_NAME=Torque3D $ADDITIONAL_CMAKE_ARGS
    make
    make install || true
    pushd ../../game
    ./Torque3D runTests.cs || true
    popd
    popd

elif
    [[ $TRAVIS_OS_NAME = osx ]]; then
    mkdir -p My\ Projects/Torque3D/
    pushd My\ Projects/Torque3D/
    cmake ../../ -DTORQUE_APP_NAME=Torque3D $ADDITIONAL_CMAKE_ARGS
    cmake --build . --target install
    pushd game
    ./Torque3D runTests.cs || true
    popd
    popd
fi
