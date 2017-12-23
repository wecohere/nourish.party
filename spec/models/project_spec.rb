require "rails_helper"

RSpec.describe Project, type: :model do
  subject(:project) { create(:project, members: [create(:user)]) }
  it "starts pending" do
    expect(project).to be_pending
  end

  describe "#approve" do
    it "updates the project status to approved" do
      project.approve
      expect(project).to be_approved
    end
  end
end