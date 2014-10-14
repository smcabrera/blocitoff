class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_from_token

  #necessary in all controllers that will respond with JSON
  respond_to :json

  private

  # Error responses and before_filter blocking work differently with Javascript requests.
  # Rather than using before_filters to authenticate actions, bloc suggests using
  # "guard cluases" like 'permission_denied_error unless condition'

  def authenticate_from_token
    authenticate_token ||  permission_denied_error
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      User.find_by(auth_token: token)
    end
  end

  def permission_denied_error
    error(403, 'Permission Denied!')
  end

  def error(status, message = 'Something went wrong')
    response = {
      response_type: "ERROR",
      message: message
    }
  end
end
