require 'rails_helper'

RSpec.describe Comment do
  subject { create :comment }

  describe "valid factory" do
    let(:comment) { build :comment }

    it { expect(comment).to be_valid }
  end

  describe "setting of secure ID" do
    let(:comment) { build :comment }

    it "sets a UUID" do
      expect(comment).to receive(:assign_uuid_id).and_call_original
      expect { comment.save }.to change { comment.id }.from(nil).to(anything)
    end
  end

  describe "associations" do
    it { is_expected.to have_one(:activity).dependent(:destroy) }
  end
end
