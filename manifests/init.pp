# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#include puppet_practice_m
class puppet_practice_m {
  notify { 'applying hello world to the message of the day': }
  include puppet_practice_m::motd
}
