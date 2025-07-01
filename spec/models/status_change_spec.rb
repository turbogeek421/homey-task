require 'rails_helper'

RSpec.describe StatusChange do
  subject { create :status_change }

  describe "valid factory" do
    let(:status_change) { build :status_change }

    it { expect(status_change).to be_valid }
  end

  describe "setting of secure ID" do
    let(:status_change) { build :status_change }

    it "sets a UUID" do
      expect(status_change).to receive(:assign_uuid_id).and_call_original
      expect { status_change.save }.to change { status_change.id }.from(nil).to(anything)
    end
  end

  describe "associations" do
    it { is_expected.to have_one(:activity).dependent(:destroy) }
  end
end
