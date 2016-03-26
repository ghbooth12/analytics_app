class RegisteredApplicationsController < ApplicationController
  before_action :set_registered_application, only: [:show, :edit, :update, :destroy]

  # GET /registered_applications
  def index
    @registered_applications = current_user.registered_applications.all
  end

  # GET /registered_applications/1
  def show
  end

  # GET /registered_applications/new
  def new
    @registered_application = RegisteredApplication.new
  end

  # GET /registered_applications/1/edit
  def edit
  end

  # POST /registered_applications
  def create
    @registered_application = current_user.registered_applications.build(app_params)

    if @registered_application.save
      redirect_to [current_user, @registered_application], notice: 'Registered application was successfully created.'
    else
      render :new
    end
  end

  def create_multiple

  end

  # PATCH/PUT /registered_applications/1
  def update
    if @registered_application.update(app_params)
      redirect_to [current_user, @registered_application], notice: 'Registered application was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /registered_applications/1
  def destroy
    @registered_application.destroy
    redirect_to user_registered_applications_url, notice: 'Registered application was successfully destroyed.'
  end

  def add_form
    @registered_application = RegisteredApplication.new
    respond_to  do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registered_application
      @registered_application = current_user.registered_applications.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def app_params
      params.require(:registered_application).permit(:name, :url)
    end
end
