require 'rails_helper'

RSpec.describe "Projects", type: :request do
  describe "GET /index" do
    context "when projects exist" do
      let!(:project) { create(:project) }

      it "redirects to the first project's show page" do
        get projects_path
        expect(response).to redirect_to(project_path(project))
        follow_redirect! # Follow the redirect to assert on the redirected page
        expect(response).to have_http_status(:ok)
        expect(response.body).to include(project.title)
      end
    end

    context "when no projects exist" do
      before { Project.destroy_all }

      it "renders plain text message about seeding database" do
        get projects_path
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq("text/plain; charset=utf-8")
        expect(response.body).to eq("Run database seed:\n\n  rails db:seed")
      end
    end
  end

  describe "GET /show" do
    let!(:project) { create(:project) }
    let!(:user) { create(:user) }
    let!(:comment) { comment = create(:comment); create(:activity, project: project, user: user, record: comment); comment }
    let!(:status_change) { status_change = create(:status_change); create(:activity, project: project, user: user, record: status_change); status_change }

    context "when the project exists" do
      it "renders a successful response" do
        get project_path(project)
        expect(response).to have_http_status(:ok)
        expect(response.body).to include(project.title) # Check for project title
      end

      it "assigns the requested project to @project" do
        get project_path(project)
        expect(assigns(:project)).to eq(project)
      end

      it "displays activities for the project" do
        get project_path(project)
        expect(response.body).to include(comment.content)
        expect(response.body).to include(status_change.from_status)
        expect(response.body).to include(status_change.to_status)
      end
    end
  end
end
