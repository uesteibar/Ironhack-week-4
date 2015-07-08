require "rails_helper"

describe Entry do
  before(:each) do
    @project = Project.create(name: "Ironhack")
  end
  describe 'entry - creation' do
    it 'should create an entry providing correct data' do
      entry = Entry.create(date: Date.current,
      hours: 1,
      minutes: 30,
      project_id: @project.reload.id)
      expect(entry.id).not_to be_falsy
    end

    it 'should NOT create an entry with incorrect minutes' do
      expect {
        Entry.create!(date: Date.current,
        hours: 1,
        minutes: 70,
        project_id: @project.reload.id)
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
