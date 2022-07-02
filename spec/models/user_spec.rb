require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @jerry = User.create(name: 'Jerry', email: 'jerry@gmail.com', password: '123456')
  end

  it 'is valid with valid attributes' do
    expect(@jerry).to be_valid
  end

  it 'is invalid without an email' do
    @jerry.email = nil
    expect(@jerry).to_not be_valid
  end

  it 'is invalid without a password' do
    @jerry.password = ''
    expect(@jerry).to_not be_valid
  end

  it 'is invalid without a name' do
    @jerry.name = nil
    expect(@jerry).to_not be_valid
  end

  it 'is invalid if name length is more than 50 characters' do
    @jerry.name = 'a' * 52
    expect(@jerry).to_not be_valid
  end

  describe 'Associations' do
    it { should have_many(:categories) }
    it { should have_many(:exchanges).with_foreign_key('author_id') }
  end
end
