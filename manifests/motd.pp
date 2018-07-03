# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include puppet_practice_m::motd
class puppet_practice_m::motd {
   
  file { '/etc/motd':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => "hello, world!\n",
  }
  file { '/tmp/hiera_test.txt':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => hiera('address'),
  }
  file {'/tmp/facter_test.txt':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => $custom_fact12,
  }
}
