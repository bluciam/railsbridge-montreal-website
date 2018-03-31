require 'rails_helper'

RSpec.describe ChecksController do
  pending "add some examples to (or delete) #{__FILE__}"

  def encoded_credentials
    ActionController::HttpAuthentication::Basic.encode_credentials(
      "volunteer",
       ENV["ADMIN_PASSWORD"]
    )
  end
end
