require 'rails_helper'

RSpec.describe Movie, type: :model do
  before(:each) do
    @title = "Star wars"
    @synopsis = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    @year = 2000
  end
  describe 'movie - creation' do
    it 'should create a movie when the data is correct' do
      expect(
        Movie.create(
        title: @title,
        synopsis: @synopsis,
        year: @year
        ).id
      ).not_to be_falsy
    end

    it 'should NOT create a movie when title is empty' do
      expect do
        Movie.create!(
        title: "",
        synopsis: @synopsis,
        year: @year
        )
      end.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should NOT create a movie when title is nil' do
      expect do
        Movie.create!(
        title: nil,
        synopsis: @synopsis,
        year: @year
        )
      end.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should NOT create a movie when title already exists is empty' do
      expect do
        Movie.create!(
        title: @title,
        synopsis: "",
        year: @year
        )
      end.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should NOT create a movie when synopsis is empty' do
      expect do
        Movie.create!(
        title: @title,
        synopsis: "",
        year: @year
        )
      end.to raise_error(ActiveRecord::RecordInvalid)
    end


    it 'should NOT create a movie when synopsis is nil' do
      Movie.create(
      title: @title,
      synopsis: @synopsis,
      year: @year
      )
      expect do
        Movie.create!(
        title: @title,
        synopsis: @synopsis,
        year: @year
        )
      end.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should NOT create a movie when year is nil' do
      expect do
        Movie.create!(
        title: @title,
        synopsis: @synopsis,
        year: nil
        )
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
