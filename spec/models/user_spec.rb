require 'rails_helper'

RSpec.describe User do
  subject { create :user }

  describe "valid factory" do
    let(:user) { build :user }

    it { expect(user).to be_valid }
  end

  describe "setting of secure ID" do
    let(:user) { build :user }

    it "sets a UUID" do
      expect(user).to receive(:assign_uuid_id).and_call_original
      expect { user.save }.to change { user.id }.from(nil).to(anything)
    end
  end
end
