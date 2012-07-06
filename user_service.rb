module user_service
  
  def self.user(id, display, email)
    # user hash:
    # :id = user id
    # :display = long form name
    # :email = email address
    { :id=> id, :display=> display, :email=> email }
  end

  def self.group(id, members)
    # group hash:
    # :id = name of group
    # :members = list of user hashes
    { :id=> id, :members=> members }
  end
end