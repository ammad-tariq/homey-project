require 'rails_helper'

RSpec.describe "Projects", type: :request do
  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }

  before do
    sign_in user
  end

  describe "GET /index" do
    it "returns http success" do
      get projects_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get project_path(project)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "creates a new project" do
      expect {
        post projects_path, params: { project: { title: 'New Project', status: 'planning', user_id: user.id } }
      }.to change(Project, :count).by(1)
      expect(response).to redirect_to(Project.last)
    end
  end

  describe "PATCH /update" do
    it "updates the project" do
      patch project_path(project), params: { project: { status: 'in_progress' } }
      expect(project.reload.status).to eq('in_progress')
      expect(response).to redirect_to(project)
    end
  end
end
