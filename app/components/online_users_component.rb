class OnlineUsersComponent < ViewComponent::Base
  def initialize(online_users:)
    @online_users = online_users
  end
end
