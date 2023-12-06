#!/bin/bash

GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NOCOLOR='\033[0m'

protoc --go_out=../../infrastructure/rpc \
--go-grpc_out=../../infrastructure/rpc \
--validate_out="lang=go:../../infrastructure/rpc" \
ProtoFiles/*.proto

if [ $? -eq 0 ]; then
    echo -e "${GREEN}Successfuly generated!${NOCOLOR}"
    echo -e "${YELLOW}  - all files can be found in directory: '../../infrastructure/rpc/${NOCOLOR}'"
else
    echo -e "${RED}Cannot generate files!!!${NOCOLOR}"
fi

#--proto_path=../../infrastructure/rpc \

#../ProtoFiles/AuthenticationService.proto ../ProtoFiles/Common.proto ../ProtoFiles/DeviceService.proto ../ProtoFiles/DriverService.proto ../ProtoFiles/LocationService.proto ../ProtoFiles/OrderService.proto ../ProtoFiles/validate.proto
