class GroupsController < ApplicationController

  def show
    @group=Group.find(params[:id])

  end

  private

  def group_params
    params.require(:group).permit(:name, :description, :category_id,:group_ids => [])
  end

end
