class EventsController < ApplicationController

  before_action :authenticate_user!, :except => [:index]

  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index

    @events = Event.page(params[:page]).per(5)
    # @events = Event.all

    if params[:order]
      sort_by = (params[:order] == 'name') ? 'name' : 'id'
      @events = @events.order(sort_by)
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    @event.user = current_user

    if @event.save
      flash[:notice] = "event was successfully created"
      redirect_to events_url
    else
      render :action => :new
    end

  end

  def show 
    @page_title=@event.name
  end

  def edit
  end

  def update
    if  @event.update(event_params)
      flash[:notice] = "event was successfully updated"
      redirect_to event_url(@event)
    else
      render :action => :edit
    end
  end

  def destroy
    flash[:alert] = "event was successfully deleted"
    @event.destroy

    redirect_to events_url
  end

  private

  def set_event
    @event=Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :category_id)
  end


end

