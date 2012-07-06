class UserService::Base
  
  def oauth_details
    Hash.new
  end

  def current_user(token)
    UserService.user('','','')
  end

  def groups(token)
    # list of group hashes:
    # :id = name of group
    # :members = list of user hashes
    [UserService.group('', [UserService.user('','','')])]
  end

  def contacts(token)
    # list of user hashes
    [UserService.user('','','')]
  end
end