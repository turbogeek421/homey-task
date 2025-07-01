require 'rails_helper'

RSpec.describe Activity do
  subject { create :activity }

  describe "valid factory" do
    let(:activity) { build :activity }

    it { expect(activity).to be_valid }
  end

  describe "setting of secure ID" do
    let(:activity) { build :activity }

    it "sets a UUID" do
      expect(activity).to receive(:assign_uuid_id).and_call_original
      expect { activity.save }.to change { activity.id }.from(nil).to(anything)
    end
  end

  describe "associations" do
    it { is_expected.to belong_to(:project) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:record).dependent(:destroy) }
  end
end
