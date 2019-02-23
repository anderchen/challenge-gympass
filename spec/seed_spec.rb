require_relative 'spec_helper'
require_relative '../app/models/lap'
begin
  require_relative '../app/models/pilot'
rescue LoadError
end

describe 'Seed' do
  before(:each) do
    create_db
    migrate
  end

  after(:each) { drop_db }

  def seed
    load "#{__dir__}/../db/seeds.rb"
  end

  it 'should insert laps with a pilot set. A lap with a nil pilot is not valid!' do
    seed
    if Lap.count == 0
      fail NotImplementedError, 'Seed not yet implemented'
    end
    Lap.all.each do |lap|
      expect(lap.pilot).not_to be_nil
    end
  end
end