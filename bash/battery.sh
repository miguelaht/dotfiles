#!/bin/bash
pmset -g batt | egrep '([0-9])+\%.*' -o | cut -f1 -d';'
