#!/bin/bash

mvn clean install

mv -f target/lesson1.war /opt/apache-tomcat-7.0.59/webapps/

