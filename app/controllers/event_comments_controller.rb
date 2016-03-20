class EventCommentsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @comment = @event.comments.create(params[:comment].permit(:name, :body))

    redirect_to event_path(@event)
  end
end
