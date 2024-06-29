require 'rails_helper'

RSpec.describe Project, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:comments) }
  it { should have_many(:status_changes) }

  describe 'validations' do
    let(:user) { create(:user) }
    subject { build(:project, user: user) }

    it { should validate_presence_of(:title) }

    it 'is invalid without a title' do
      subject.title = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:title]).to include("can't be blank")
    end
  end
end
