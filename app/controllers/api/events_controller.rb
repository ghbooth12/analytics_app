class API::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!

  # before_filter :set_access_control_headers
  #
  # def set_access_control_headers
  #   headers['Access-Control-Allow-Origin'] = '*'
  #   headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
  #   headers['Access-Control-Allow-Headers'] = 'Content-Type'
  # end

  # def preflight
  #   head 200
  # end

  def create
    # To use 'unless statement', 'and return' can end the calling. Otherwise, the codes after the render will be executed.
    unless registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])
      render(json: "!!Unregistered application", status: :unprocessable_entity) and return
    end

    @event = registered_application.events.build(event_params)
    if @event.save
      render json: @event, status: :created
    else
      render json: { errors: @event.errors }, status: :unprocessable_entity
    end
  end

  # If 'and return' is not used, the code has to be like below.
  # def create
  #   if registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])
  #     @event = registered_application.events.build(event_params)
  #     if @event.save
  #       render json: @event, status: :created
  #     else
  #       render json: { errors: @event.errors }, status: :unprocessable_entity
  #     end
  #   else
  #     render json: "Unregistered application", status: :unprocessable_entity
  #   end
  # end

  private
  def event_params
    params.require(:event).permit(:name)
  end
end
