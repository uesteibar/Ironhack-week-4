require "rails_helper"

describe Project do
  before(:each) do
    @name = "Ironhack"
  end

  describe 'project - creation' do
    it 'should create a project with the given name' do
      project = Project.create(name: @name)
      expect(project.name).to eq @name
    end

    it 'should NOT create a project with the same name' do
      Project.create(name: @name)
      expect {
        Project.create!(name: @name)
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe '#total_hours_in_month' do
    before(:each) do
      @project = Project.create(name: 'Entry counter')

      @project.entries.create(hours: 1, minutes: 30, date: 1.year.ago)
      @project.entries.create(hours: 1, minutes: 30, date: Date.current)
      @project.entries.create(hours: 1, minutes: 30, date: Date.current)
      @project.entries.create(hours: 1, minutes: 30, date: 1.year.ago)
    end

    it 'should return the total hours in the given month of the given year' do
      expect(@project.reload.total_hours_in_month(Date.current.month, Date.current.year)).to eq 3
    end

    it 'should return nil if provided month or year is nil' do
      expect(@project.reload.total_hours_in_month(nil, nil)).to be_falsy
    end
  end
end
