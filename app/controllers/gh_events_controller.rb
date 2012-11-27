class GhEventsController < ApplicationController
  # GET /gh_events
  # GET /gh_events.json
  def index
    # TODO: Think about what GhEvent.all is doing
    # in terms of efficiency.

    # TODO: Is Sorter the best name for this class
    # and what class maybe should be responsible for
    # this functionality.
    @gh_events = Sorter.sort_by_published_at(GhEvent.all)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gh_events }
    end
  end

  # GET /gh_events/1
  # GET /gh_events/1.json
  def show
    @gh_event = GhEvent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gh_event }
    end
  end

  # GET /gh_events/new
  # GET /gh_events/new.json

  # TODO: Are these actions/routes required?
  # maybe go through the app and start removing
  # unused / illogical code?
  def new
    @gh_event = GhEvent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gh_event }
    end
  end

  # GET /gh_events/1/edit
  def edit
    @gh_event = GhEvent.find(params[:id])
  end

  # POST /gh_events
  # POST /gh_events.json
  def create
    @gh_event = GhEvent.new(params[:gh_event])

    respond_to do |format|
      if @gh_event.save
        format.html { redirect_to @gh_event, notice: 'Gh event was successfully created.' }
        format.json { render json: @gh_event, status: :created, location: @gh_event }
      else
        format.html { render action: "new" }
        format.json { render json: @gh_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gh_events/1
  # PUT /gh_events/1.json
  def update
    @gh_event = GhEvent.find(params[:id])

    respond_to do |format|
      if @gh_event.update_attributes(params[:gh_event])
        format.html { redirect_to @gh_event, notice: 'Gh event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gh_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gh_events/1
  # DELETE /gh_events/1.json
  def destroy
    @gh_event = GhEvent.find(params[:id])
    @gh_event.destroy

    respond_to do |format|
      format.html { redirect_to gh_events_url }
      format.json { head :no_content }
    end
  end
end
