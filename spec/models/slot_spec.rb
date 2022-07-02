require 'rails_helper'

RSpec.describe Slot, type: :model do
  before(:each) do
    @jerry = User.create(name: 'Jerry', email: 'jerry@gmail.com', password: '123456')
    expect(@jerry).to be_valid
    @food_category = Category.create(name: 'Food', icon: 'F', user_id: @jerry.id)
    @exchange = Exchange.create(name: 'Food', amount: 'F', author_id: @jerry.id)
    @slot = Slot.create(category_id: @food_category.id, exchange_id: @exchange.id)
  end

  after(:each) do
    User.destroy_all
    Slot.destroy_all
  end

  it 'is valid with valid attributes' do
    expect(@slot).to be_valid
  end

  describe 'associations' do
    it { should belong_to(:category) }
    it { should belong_to(:exchange) }
  end
end
