require 'rails_helper'
require_relative '../../app/models/organization'

describe Organization do
  it "validates the presence of the name" do
    org = Organization.new()
    org.valid?
    expect(org.errors[:name]).to include("can't be blank")
  end

  it "validates the uniqueness of the name" do
    org1 = Organization.create!(name: "my name")
    org2 = Organization.new(name: "my name")

    org2.valid?

    expect(org2.errors[:name]).to include("has already been taken")
  end
end
