class GithubsController < ApplicationController
  # GET /githubs
  # GET /githubs.json
  def index
    @githubs = Github.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @githubs }
    end
  end

  # GET /githubs/1
  # GET /githubs/1.json
  def show
    @github = Github.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @github }
    end
  end

  # GET /githubs/new
  # GET /githubs/new.json
  def new
    @github = Github.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @github }
    end
  end

  # GET /githubs/1/edit
  def edit
    @github = Github.find(params[:id])
  end

  # POST /githubs
  # POST /githubs.json
  def create
    @github = Github.new(params[:github])

    respond_to do |format|
      if @github.save
        format.html { redirect_to @github, notice: 'Github was successfully created.' }
        format.json { render json: @github, status: :created, location: @github }
      else
        format.html { render action: "new" }
        format.json { render json: @github.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /githubs/1
  # PUT /githubs/1.json
  def update
    @github = Github.find(params[:id])

    respond_to do |format|
      if @github.update_attributes(params[:github])
        format.html { redirect_to @github, notice: 'Github was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @github.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /githubs/1
  # DELETE /githubs/1.json
  def destroy
    @github = Github.find(params[:id])
    @github.destroy

    respond_to do |format|
      format.html { redirect_to githubs_url }
      format.json { head :no_content }
    end
  end
end
