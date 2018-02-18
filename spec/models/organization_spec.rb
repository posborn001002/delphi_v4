# spec/models/organization_spec.rb


describe Organization do
  it "has a valid factory" do
    Factory.create(:organization).should be_valid
  end
  it "is invalid without a first name"
end