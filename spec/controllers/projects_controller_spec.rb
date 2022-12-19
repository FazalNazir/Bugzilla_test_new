# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let(:user) { create(:Manager) }
  let!(:project) { create(:project, creator: user) }

  before do
    login_user(user)
  end

  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end

    it 'tests the index method of projects controller' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET show project' do
    it 'success case show method' do
      get :show, params: { id: project }
      # expect(response).to render_template('show')
      expect(assigns(:project)).to eq(project)
    end

    it 'failure case of show' do
      get :show, params: { id: 0 }
      expect(flash[:alert]).to eq('Record not found')
    end

    it 'authorization of show' do
      login_user(create(:Developer))
      get :show, params: { id: project.id }
      expect(flash[:alert]).to eq('You are not authorized to perform this action.')
    end
  end

  describe 'GET new project' do
    it 'success case new' do
      get :new, params: { id: 0 }
      expect(response).to render_template('new')
    end

    it 'authorization of new' do
      login_user(create(:Developer))
      get :new, params: { id: 0 }
      expect(flash[:alert]).to eq('You are not authorized to perform this action.')
    end
  end

  describe 'GET create project' do
    it 'success for create' do
      expect do
        post :create, params: { project: { title: 'I am title', creator_id: project.creator_id,
                                           developer_id: project.developer_id,
                                           tester_id: project.tester_id } }
<<<<<<< HEAD
      end.to change(Project, :count).from(2)
=======
      end.to change(Project, :count).from(1)
>>>>>>> master
    end

    it 'failure case of create' do
      post :create,
           params: { project: { title: 'Hi, how are you', creator_id: 2134, developer_id: project.developer_id,
                                tester_id: project.tester_id } }
      expect(response).to render_template('new')
    end
  end

  describe 'Get edit project' do
    it 'tests the edit method of projects controller' do
      get :edit, params: { id: project.id }
      expect(response).to render_template 'edit'
    end

    it 'authorization for edit' do
      login_user(create(:Developer))
      get :edit, params: { id: project.id }
      expect(flash[:alert]).to eq('You are not authorized to perform this action.')
    end
  end

  describe 'Get update project' do
    it 'success case update method' do
      put :update, params: { id: project.id, project: { title: 'Hi, how are you', creator_id: project.creator_id,
                                                        developer_id: project.developer_id,
                                                        tester_id: project.tester_id } }
      expect(flash[:notice]).to eq('Project successfully Updated!')
    end

    it 'failure case update method' do
      put :update, params: { id: project.id, project: { title: 'Title here', creator_id: 12_345,
                                                        developer_id: project.developer_id,
                                                        tester_id: project.tester_id } }
      expect(flash[:alert]).to eq('Unable to update project try AGAIN!')
    end
  end

  describe 'Get destroy project' do
    it 'success case for destroy method' do
      expect do
        delete :destroy, params: { id: project.id }
<<<<<<< HEAD
      end.to change(Project, :count).from(2)
=======
      end.to change(Project, :count).from(1)
>>>>>>> master
    end

    it 'authorization case for destroy method' do
      login_user(create(:Developer))
      delete :destroy, params: { id: project.id }
      expect(response).to have_http_status(:found)
    end

    it 'failure case of destroy action' do
      get :show, params: { id: 789_785 }
      expect(flash[:alert]).to eq('Record not found')
    end

    it 'else case of destroy method' do
      allow_any_instance_of(Project).to receive(:destroy).and_return(false)
      delete :destroy, params: { id: project.id }
      expect(flash[:alert]).to eq('Unable to Delete!')
    end
  end
end
