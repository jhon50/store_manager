require 'rails_helper'

RSpec.describe Admin::DaysController, type: :controller do

  let!(:user) { FactoryBot.create(:user) }
  let!(:store) { FactoryBot.create(:store) }
  let!(:goal) { FactoryBot.create(:goal) }
  let!(:vendor) { FactoryBot.create(:vendor) }

  let(:valid_attributes) {
    { 0 => attributes_for(:day), 1 => attributes_for(:day).merge(date: 5.days.from_now) }
  }

  let(:invalid_attributes) {
    { admin: true }
  }

  before { sign_in user }

  let(:valid_session) { {} }

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {store_id: store, goal_id: goal}, session: valid_session
      expect(response).to be_successful
    end
  end


  describe "POST #create" do
    context "with valid params" do
      it "creates goal days" do
        expect {
          post :create, params: {days: valid_attributes, store_id: store, goal_id: goal}, session: valid_session
        }.to change(Day, :count).by(2)
         .and change(DayVendor, :count).by(2)
      end

      it "redirects to the created admin_goal" do
        post :create, params: {days: valid_attributes, store_id: store, goal_id: goal}, session: valid_session
        expect(response).to redirect_to admin_stores_path
      end
    end

    context "with invalid params" do
      it "returns a success response" do
        post :create, params: {days: invalid_attributes, store_id: store, goal_id: goal}, session: valid_session
        expect(response).to be_successful
      end
    end
  end
end
