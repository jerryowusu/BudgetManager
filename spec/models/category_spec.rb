require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @jerry = User.create(name: 'Jerry', email: 'jerry@gmail.com', password: '123456')
    expect(@jerry).to be_valid
    @food_category = Category.create(name: 'food', icon: 'f', user_id: @jerry.id)
  end

  after(:each) do
    User.destroy_all
    Category.destroy_all
  end

  it 'is valid with valid attributes' do
    expect(@food_category).to be_valid
  end

  it 'is invalid without a name' do
    @food_category.name = nil
    expect(@food_category).to_not be_valid
  end

  it 'is invalid without an icon' do
    @food_category.icon = nil
    expect(@food_category).to_not be_valid
  end

  it 'is invalid if name length is more than 30 characters' do
    @food_category.name = 'a' * 40
    expect(@food_category).to_not be_valid
  end

  describe 'Associations' do
    it { should belong_to(:user) }
    it { should have_many(:exchanges).through(:slots) }
  end
end
