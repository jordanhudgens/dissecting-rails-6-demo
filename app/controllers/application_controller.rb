class ApplicationController < ActionController::Base
  include DeviseWhitelistConcern
end
