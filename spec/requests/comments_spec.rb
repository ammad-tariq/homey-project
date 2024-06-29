require 'rails_helper'

RSpec.describe "Comments", type: :request do
  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  let(:comment) { create(:comment, project: project, user: user) }

  before do
    sign_in user
  end

  describe "POST /create" do
    it "creates a new comment" do
      expect {
        post project_comments_path(project), params: { comment: { content: 'New Comment' } }
      }.to change(Comment, :count).by(1)
      expect(response).to redirect_to(project)
    end
  end
end
