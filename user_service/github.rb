require_relative '../user_service'
require_relative 'base'

class UserService::Github < UserService::Base

  def oath_details
    {}
  end

  def current_user(token)
    UserService.user('','','')
  end

  def groups(token)
    # list of group hashes:
    # :id = name of group
    # :members = list of user hashes
    [UserService.group('foo', [UserService.user('barf','bar fly','barfly@gmail.com')])]
  end

  def contacts(token)
    # list of user hashes
    [UserService.user('','','')]
  end
end