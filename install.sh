#/bin/env sh

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     data=$HOME/.local/share;;
    Darwin*)    data=$HOME/Library/Application\ Support;;
    CYGWIN*)    data="%APPDATA%";;
    MINGW*)     data="%APPDATA%";;
    MSYS_NT*)   data="%APPDATA%";;
    *)          echo "unknown os" && exit 1;;
esac

data=$data/typst/packages/docs

bmstu_package="$data"/bmstu/0.1.0
mkdir -p "$bmstu_package"
cp -r "$(dirname "$0")"/bmstu/* "$bmstu_package"
