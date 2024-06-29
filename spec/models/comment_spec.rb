require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should belong_to(:project) }
  it { should belong_to(:user) }

  describe 'validations' do
    let(:project) { create(:project) }
    let(:user) { create(:user) }
    subject { build(:comment, project: project, user: user) }

    it { should validate_presence_of(:content) }

    it 'is invalid without content' do
      subject.content = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:content]).to include("can't be blank")
    end
  end
end
