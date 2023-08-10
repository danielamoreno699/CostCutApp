class OperationsController < ApplicationController

  def destroy
    @group =  Group.find(params[:group_id]) 
      @operation = @group.operations.find(params[:id])  
     @operation.group_operations.destroy_all
      @operation.destroy
      redirect_to user_group_path(current_user, @group_id)
     
    end

    def new
        @group = Group.find(params[:group_id])
        @operation = Operation.new
      end
    
      def create
        @group = Group.find(params[:group_id])
        @operation = Operation.new(operation_params)
        @operation.author_id = current_user.id
    
        if @operation.save
            selected_group = Group.find(params[:operation][:group_id])
            selected_group.operations << @operation
    
          flash[:success] = 'Operation was successfully created.'
          redirect_to user_group_path(current_user, selected_group.id)
        else
          flash.now[:alert] = 'Error: Operation could not be created.'
          render 'new'
        end
      end
    
      private
    
      def operation_params
        params.require(:operation).permit(:name, :amount)
      end
end
