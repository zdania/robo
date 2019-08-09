require 'rails_helper'

describe Order do
  it "has a proper initial state" do
    expect(Order.new.current_state).to eq("new")
  end
end
