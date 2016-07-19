# web role
class role::web inherits role::default {
  include profile::webserver
}
