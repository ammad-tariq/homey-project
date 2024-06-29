require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:projects) }
  it { should have_many(:comments) }
  it { should have_many(:status_changes) }

  describe 'validations' do
    subject { build(:user) }

    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }

    it 'is invalid without a first name' do
      subject.first_name = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:first_name]).to include("can't be blank")
    end

    it 'is invalid without a last name' do
      subject.last_name = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:last_name]).to include("can't be blank")
    end
  end
end
