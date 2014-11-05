
#!/bin/bash

BASE_DIR=`dirname $0`
ROOT_DIR=$BASE_DIR/..

mkdir -p $ROOT_DIR/target
rm -rf $ROOT_DIR/target/lokbiradari_config.zip

cd $ROOT_DIR && zip -r target/lokbiradari_config.zip openmrs/* openelis/*
