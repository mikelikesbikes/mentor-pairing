describe CalendarBuilder do
  let(:builder) { CalendarBuilder.new(events) }

  describe 'build_ical' do
    subject { builder.build_ical }

    describe "with no events" do
      let(:events) { [] }
      it { should match     /BEGIN:VCALENDAR/ }
      it { should_not match /BEGIN:VEVENT/ }
    end

    describe "with a single event" do
      let(:events) { [appointment] }
      let(:appointment) { FactoryGirl.create(:appointment) }

      it { should match /BEGIN:VEVENT/ }
      it { should match /DESCRIPTION:.*#{appointment.mentor.name}/ }
      it { should match /DESCRIPTION:.*#{appointment.mentee.name}/ }
      it { should match /DTSTART.*:#{ical_date(appointment.start_time)}/ }
      it { should match /DTEND.*:#{ical_date(appointment.end_time)}/ }
      it { should match /LAST-MODIFIED.*:#{ical_date(appointment.updated_at)}/ }
      it { should match /UID:appointment-#{appointment.id}@devbootcamp.com/ }

      def ical_date(date)
        date.iso8601.to_s.gsub(/[:-]/, '')
      end
    end
  end
end
