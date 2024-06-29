require 'rails_helper'

RSpec.describe StatusChange, type: :model do
  it { should belong_to(:project) }
  it { should belong_to(:user) }

  describe 'status methods' do
    let(:status_change) { build(:status_change, from_status: 0, to_status: 1) }

    it 'returns the correct from_status_humanized' do
      expect(status_change.from_status_humanized).to eq('Planning')
    end

    it 'returns the correct to_status_humanized' do
      expect(status_change.to_status_humanized).to eq('In progress')
    end
  end
end
