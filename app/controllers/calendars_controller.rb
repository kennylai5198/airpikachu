class CalendarsController < ApplicationController
  before_action :authenticate_user!
  include ApplicationHelper

  def host
    @rooms = current_user.rooms

    # if start date does not have any value, then assign the current date
    params[:start_date] ||= Date.current.to_s
    # if current user has a room then assign the first room's id otherwise assign nil
    params[:room_id] ||= @rooms[0] ? @rooms[0].id : nil

    if params[:q].present?
      params[:start_date] = params[:q][:start_date]
      params[:room_id] = params[:q][:room_id]
    end

    @search = Reservation.ransack(params[:q])

    if params[:room_id]
      @room = Room.find(params[:room_id])
      start_date = Date.parse(params[:start_date])

      # Get the reservations for 3-months period
      first_of_month = (start_date - 1.months).beginning_of_month
      end_of_month = (start_date + 1.months).end_of_month

      @events = @room.reservations.joins(:user)
                                  .select('reservations.*, users.fullname, users.image, users.email, users.uid')
                                  .where('(start_date BETWEEN ? and ?) AND status <> ?', first_of_month, end_of_month, 2)
      @events.each{ |e| e.image = avatar_url(e) }

    else
      @room = nil
      @events = []
    end
  end
end
