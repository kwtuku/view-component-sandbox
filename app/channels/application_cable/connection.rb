module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private

    def find_verified_user
      # https://github.com/heartcombo/devise/issues/4466#issuecomment-572948661
      # https://stackoverflow.com/questions/49866041/actioncable-authentication-with-multiple-devise-models/49884788
      verified_user = env["warden"].user(:user)
      verified_user || reject_unauthorized_connection
    end
  end
end
