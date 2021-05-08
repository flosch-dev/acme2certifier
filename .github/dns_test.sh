#!/usr/bin/env sh

dns_test_add() {
  fulldomain=$1
  txtvalue=$2
  _info "adding dns record: ${fulldomain}: ${txtvalue}"
  echo "txt-record=${fulldomain},\"${txtvalue}\"" >> /dnsmasq.conf
  killall dnsmasq
  dnsmasq -c /dnsmasq.conf
}

#Usage: fulldomain txtvalue
#Remove the txt record after validation.
dns_test_rm() {
  fulldomain=$1
  txtvalue=$2
  _info "removing dns record"
  _debug fulldomain "$fulldomain"
  _debug txtvalue "$txtvalue"
  grep -v "txt-record=${fulldomain},\"${txtvalue}\"" /dnsmasq.conf > /dnsmasq.conf
  killall dnsmasq
  dnsmasq -c /dnsmasq.conf
}

####################  Private functions below ##################################