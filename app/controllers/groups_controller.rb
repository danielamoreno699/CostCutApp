class GroupsController < ApplicationController
    include GroupIconOptions

    def index

      @groups = Group.includes(:author).where(author_id: current_user.id)
      @current_user = current_user
    end
    
    def show
        @group = Group.includes(:operations).find(params[:id])
        @current_user = current_user
      end


    def destroy
        @group = Group.find(params[:id])
        @group.group_operations.destroy_all
        @group.destroy
        redirect_to user_groups_path(current_user)
      end


    def new
        @current_user = current_user
        @group = Group.new
      end
    
      def create
        @current_user = current_user
        @group = Group.new(group_params)
        @group.author_id = @current_user.id
    
        if @group.save
          flash[:success] = 'Category was successfully created.'
          redirect_to user_groups_path(current_user), notice: 'Group was successfully created.'
        else
          flash.now[:alert] = 'Error: Category could not be created.'
          render 'new'
        end
      end
    
      private 
    
      def group_params
        params.require(:group).permit(:name, :icon)
      end
end
