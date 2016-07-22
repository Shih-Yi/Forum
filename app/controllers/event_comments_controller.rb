class EventCommentsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @comment = @event.comments.create(params[:comment].permit(:name, :body))

    @comment.user = current_user
    @comment.save
    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find(params[:event_id] )
    @comment = @event.comments.find( params[:id] )
    @comment.destroy

    redirect_to event_url(@event)
  end
end
