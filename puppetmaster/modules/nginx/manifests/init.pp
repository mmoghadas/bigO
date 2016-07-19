# == Class: nginx
#
# Full description of class nginx here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'nginx':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class nginx inherits nginx::params {

  package { 'nginx':
    ensure => latest,
  }

  file { 'nginx_conf':
    ensure  => present,
    path    => '/etc/nginx/nginx.conf',
    group   => root,
    owner   => root,
    mode    => '0644',
    content => template('nginx/nginx.conf.erb'),
    require => Package['nginx'],
  }

  file { 'nginx_conf_d':
    ensure  => directory,
    path    => '/etc/nginx/conf.d/',
    owner   => root,
    mode    => '0755',
    require => Package['nginx'],
  }

  file { 'nginx_conf_default':
    ensure  => present,
    path    => '/etc/nginx/conf.d/default.conf',
    group   => root,
    owner   => root,
    mode    => '0644',
    content => template('nginx/default.conf.erb'),
    require => File['nginx_conf_d'],
  }

  service { 'nginx':
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => File['nginx_conf']
  }

}
