#!/bin/sh

GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NOCOLOR='\033[0m'

# Remove old generated files that can case errors on new generation

rm -r ../../GeneratedFiles/*

echo -e "${YELLOW}Removing old files...${NOCOLOR}"

protoc --swift_out=Visibility=public,FileNaming=DropPath:../../GeneratedFiles \
--grpc-swift_opt=Visibility=Public,FileNaming=DropPath,TestClient=true,Client=true,Server=false \
--grpc-swift_out=../../GeneratedFiles \
ProtoFiles/*.proto

if [ $? -eq 0 ]; then
    echo -e "${GREEN}Successfuly generated swift files!${NOCOLOR}"
    echo -e "${YELLOW}  - all files can be found in directory: '../../GeneratedFiles/${NOCOLOR}'"
else
    echo -e "${RED}Cannot generate files!!!${NOCOLOR}"
fi