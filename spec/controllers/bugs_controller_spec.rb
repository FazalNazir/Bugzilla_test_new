# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BugsController, type: :controller do
  let(:developer) { create(:Developer) }
  let(:tester) { create(:QualityAssurance) }
  let(:project) { create(:project) }
  let(:bug) { create(:bug) }
  let(:project_bug) { create(:bug, proj: project, creator: tester, solver: developer) }

  describe 'authenticate' do
    it 'when logged in' do
      login_user(developer)
      get :index, params: { project_id: project.id }
      expect(response.status).to eq(200)
    end

    it 'when logged out' do
      get :index, params: { project_id: project.id }
      expect(response.status).to eq(302)
    end
  end

  describe 'bugs#index' do
    it 'QA login' do
      login_user(tester)
      get :index, params: { project_id: project.id }
      expect(response).to render_template('index')
    end

    it 'Developer login' do
      login_user(developer)
      get :index, params: { project_id: project.id }
      expect(response).to render_template('index')
    end

    it 'Manager login' do
      login_user(create(:Manager))
      get :index, params: { project_id: project.id }
      expect(flash[:alert]).to eq('You are not authorized to perform this action.')
    end
  end

  describe 'bugs#show' do
    it 'Developer Assigned' do
      login_user(developer)
      get :show, params: { id: project_bug.id, project_id: project.id }
      expect(response).to render_template('show')
    end

    it 'QA Assigned' do
      login_user(tester)
      get :show, params: { id: project_bug.id, project_id: project.id }
      expect(response).to render_template('show')
    end

    it 'Developer not Assigned' do
      login_user(developer)
      get :show, params: { id: bug.id, project_id: project.id }
      expect(flash[:alert]).to eq('You are not authorized to perform this action.')
    end

    it 'Failure case' do
      login_user(developer)
      get :show, params: { id: 0, project_id: project.id }
      expect(flash[:alert]).to eq('Record not found')
    end
  end

  describe 'bugs#new' do
    it 'New via QA' do
      login_user(tester)
      get :new, params: { id: bug.id, project_id: project.id }
      expect(response).to render_template('new')
    end

    it 'New via Developer' do
      login_user(developer)
      get :new, params: { id: bug.id, project_id: project.id }
      expect(flash[:alert]).to eq('You are not authorized to perform this action.')
    end
  end

  describe 'bugs#create' do
    it 'create by Dev' do
      login_user(developer)
      post :create, params: { project_id: project.id, bug: { title: 'I am title', creator_id: bug.creator_id,
                                                             solver_id: bug.solver_id,
                                                             type: bug.type, status: bug.status } }

      expect(flash[:alert]).to eq('You are not authorized to perform this action.')
    end

    it 'create by QA' do
      login_user(tester)
      post :create, params: { project_id: project.id, bug: { title: 'I am title', creator_id: bug.creator_id,
                                                             solver_id: bug.solver_id,
                                                             type: bug.type, status: bug.status } }

      expect(flash[:notice]).to eq('Bug successfully added!')
    end

    it 'Failure case' do
      login_user(tester)
      post :create,
           params: { project_id: project.id, bug: { title: 'I am title', creator_id: 2323,
                                                    solver_id: bug.solver_id, type: bug.type, status: bug.status } }
      expect(response).to render_template('new')
    end
  end

  describe 'bugs#edit' do
    it 'Edit via QA' do
      login_user(tester)
      get :edit, params: { id: project_bug.id, project_id: project.id }
      expect(response).to render_template 'edit'
    end

    it 'Edit via Dev' do
      login_user(developer)
      get :edit, params: { id: project_bug.id, project_id: project.id }
      expect(flash[:alert]).to eq('You are not authorized to perform this action.')
    end
  end

  describe 'bugs#update' do
    it 'update via QA' do
      login_user(tester)
      put :update, params: { project_id: project.id, id: project_bug.id, bug: { title: 'I am title', creator_id: bug.creator_id,
                                                                                solver_id: bug.solver_id,
                                                                                type: bug.type, status: bug.status } }
      expect(flash[:notice]).to eq('Bug successfully Updated!')
    end

    it 'update via not assigned Dev' do
      login_user(developer)
      patch :update, params: { project_id: project.id, id: bug.id, bug: { status: bug.status } }
      expect(flash[:alert]).to eq('You are not authorized to perform this action.')
    end

    it 'update via assigned Dev' do
      login_user(developer)
      patch :update, params: { project_id: project.id, id: project_bug.id, bug: { status: bug.status } }
      expect(flash[:notice]).to eq('Bug successfully Updated!')
    end

    it 'Failure of update' do
      login_user(tester)
      put :update, params: { project_id: project.id, id: project_bug.id, bug: { id: bug.id, title: 'I am title', creator_id: 2323,
                                                                                solver_id: bug.solver_id,
                                                                                type: bug.type } }
      expect(flash[:alert]).to eq('Unable to update!')
    end
  end

  describe 'bugs#destroy' do
    it 'Destroy via Developer' do
      login_user(developer)
      delete :destroy, params: { project_id: project.id, id: project_bug.id }
      expect(flash[:alert]).to eq('You are not authorized to perform this action.')
    end

    it 'Success destroy via QA' do
      login_user(tester)
      delete :destroy, params: { project_id: project.id, id: project_bug.id }
      expect(flash[:notice]).to eq('Bug successfully Deleted!')
    end

    it 'Failure of destroy' do
      login_user(tester)
      delete :destroy, params: { project_id: 345, id: 789 }
      expect(flash[:alert]).to eq('Record not found')
    end

    it 'Else case' do
      login_user(tester)
      allow_any_instance_of(Bug).to receive(:destroy).and_return(false)
      delete :destroy, params: { project_id: project.id, id: project_bug.id }
      expect(flash[:notice]).to eq('Unable to delete Bug!')
    end
  end
end
