#!/usr/bin/env bash

echo "Uninstalling template..."
dotnet new uninstall ./

echo "Installing template..."
dotnet new install ./
