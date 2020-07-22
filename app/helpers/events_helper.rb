module EventsHelper
  def past_events
    if Event.past.all.size.zero?
      render 'no_event'
       else 
      render 'event'
     end
  end 
  def upcoming_events
    if Event.future.all.size.zero?
      render 'no_upcoming_events'
    else
      render 'future_events'
    end
  end
  def attendees
     if @event.attendees.all.size.zero?
      render 'no_attendance'
       else 
        render 'attendance'
      end
  end

  def creator 
    if @event.creator == current_user
     render 'invitations/form'
    end
  end
end
