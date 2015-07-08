
describe Project do
  before(:each) do
    @name = "Ironhack"
  end

  describe 'project creation' do
    it 'should create a project with the given name' do
      project = Project.create(name: @name)
      expect(project.name).to eq @name
    end

    it 'should NOT create a project with the same name' do
      expect {
        Project.create(name: @name)
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
