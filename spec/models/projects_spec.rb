require 'rails_helper'

RSpec.describe Project do
  subject { create :project }

  describe "valid factory" do
    let(:project) { build :project }

    it { expect(project).to be_valid }
  end

  describe "setting of secure ID" do
    let(:project) { build :project }

    it "sets a UUID" do
      expect(project).to receive(:assign_uuid_id).and_call_original
      expect { project.save }.to change { project.id }.from(nil).to(anything)
    end
  end

  describe "associations" do
    it { is_expected.to have_many(:activities) }
  end
end
