class GovtController < ApplicationController
  def search
    member_search = params[:search]

    @found_member = GovtFacade.find_member_by_name(member_search)
  end
end
