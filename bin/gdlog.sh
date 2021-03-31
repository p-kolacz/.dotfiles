#!/bin/bash

tee ~/tmp/gdlog/in | nc $1 $2 | tee ~/tmp/gdlog/out
