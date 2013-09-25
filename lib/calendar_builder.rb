class CalendarBuilder
  def initialize(events)
    @events = events
  end

  def build_ical
    cal = RiCal.Calendar do |cal|
      events.each do |event|
        cal.event do |e|
          e.description = description(event)
          e.dtstart = event.start_time
          e.dtend = event.end_time
          e.last_modified = event.updated_at
          e.uid = uid(event)
        end
      end
    end

    cal.to_s
  end

  private

  def uid(event)
    "appointment-#{event.id}@devbootcamp.com"
  end

  def description(event)
    "#{event.mentor.name} mentoring #{event.mentee.name}"
  end

  def events
    @events
  end
end
