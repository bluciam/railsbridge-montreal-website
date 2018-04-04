class MembersController < ApplicationController
  skip_before_action :set_registration

  def index
    @members = Member.all
  end

  def new
  end

  def create
  end
end
