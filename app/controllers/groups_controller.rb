class GroupsController < ApplicationController
    include GroupIconOptions

    def index
      @groups = Group.includes(:author).where(author_id: current_user.id)
    end
end
