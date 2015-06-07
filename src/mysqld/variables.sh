#!/usr/bin/env bash

if [ -z "${PASSWORD}" ]; then
  export PASSWORD="root"
fi

if [ -z "${GENERAL_LOG}" ]; then
  GENERAL_LOG="0"
fi

export FACTER_GENERAL_LOG="${GENERAL_LOG}"

if [ -z "${SLOW_QUERY_LOG}" ]; then
  SLOW_QUERY_LOG="0"
fi

export FACTER_SLOW_QUERY_LOG="${SLOW_QUERY_LOG}"

if [ -z "${LONG_QUERY_TIME}" ]; then
  LONG_QUERY_TIME="1"
fi

export FACTER_LONG_QUERY_TIME="${LONG_QUERY_TIME}"
