require 'spec_helper'

describe Tour do

  before do
    @tour = Tour.new(title: "Test Tour")
  end

  subject { @tour }

  it { should respond_to(:title) }

  it { should be_valid }

  describe "when title is not present" do
    before { @tour.title = " "}
    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { @tour.title = "a" * 101}
    it { should_not be_valid }
  end

end
