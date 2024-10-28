#!/usr/bin/env bash

echo "Cleaning repo..."
git clean -fdx

echo "Uninstalling template..."
dotnet new uninstall ./

echo "Installing template..."
dotnet new install ./
