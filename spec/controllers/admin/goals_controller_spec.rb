require 'rails_helper'

RSpec.describe Admin::GoalsController, type: :controller do

  let!(:user) { FactoryBot.create(:user) }
  let!(:store) { FactoryBot.create(:store) }

  let(:valid_attributes) {
    attributes_for(:goal)
  }

  let(:invalid_attributes) {
    { admin: true }
  }

  before { sign_in user }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Goal.create! valid_attributes
      get :index, params: {store_id: store}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      goal = Goal.create! valid_attributes
      get :show, params: {id: goal.to_param, store_id: store}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    context "without having vendors created" do
      it "redirects to new vendor path" do
        get :new, params: {store_id: store}, session: valid_session
        expect(response).to redirect_to new_admin_vendor_path(store_id: 1)
      end
    end

    context "having vendors created" do
      let!(:vendor) {FactoryBot.create(:vendor)}
      it "return success response" do
        get :new, params: {store_id: store}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new goal" do
        expect {
          post :create, params: {goal: valid_attributes, store_id: store}, session: valid_session
        }.to change(Goal, :count).by(1)
      end

      it "redirects to the created admin_goal" do
        post :create, params: {goal: valid_attributes, store_id: store}, session: valid_session
        expect(response).to redirect_to new_admin_store_goal_day_path(goal_id: Goal.last)
      end
    end

    context "with invalid params" do
      it "returns a success response" do
        post :create, params: {goal: invalid_attributes, store_id: store}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested admin_goal" do
      goal = Goal.create! valid_attributes
      expect {
        delete :destroy, params: {id: goal.to_param, store_id: store}, session: valid_session
      }.to change(Goal, :count).by(-1)
    end

    it "redirects to the admin_store_goals list" do
      goal = Goal.create! valid_attributes
      delete :destroy, params: {id: goal.to_param, store_id: store}, session: valid_session
      expect(response).to redirect_to admin_store_goals_path
    end
  end
end
