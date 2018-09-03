require 'rails_helper'

RSpec.describe Admin::StoresController, type: :controller do

  let(:user) { FactoryBot.create(:user) }

  let(:valid_attributes) {
    attributes_for(:store)
  }

  let(:invalid_attributes) {
    { admin: true }
  }

  before { sign_in user }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Store.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      store = Store.create! valid_attributes
      get :show, params: {id: store.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      store = Store.create! valid_attributes
      get :edit, params: {id: store.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Store" do
        expect {
          post :create, params: {store: valid_attributes}, session: valid_session
        }.to change(Store, :count).by(1)
      end

      it "redirects to the created admin_store" do
        post :create, params: {store: valid_attributes}, session: valid_session
        expect(response).to redirect_to admin_stores_path
      end
    end

    context "with invalid params" do
      it "returns a success response" do
        post :create, params: {store: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {name: 'Loja teste 10'}
      }

      it "updates the requested admin_store" do
        store = Store.create! valid_attributes
        put :update, params: {id: store.to_param, store: new_attributes}, session: valid_session
        store.reload
        expect(store.name).to eq('Loja teste 10')
      end

      it "redirects to the admin_store" do
        store = Store.create! valid_attributes
        put :update, params: {id: store.to_param, store: valid_attributes}, session: valid_session
        expect(response).to redirect_to admin_stores_path
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested admin_store" do
      store = Store.create! valid_attributes
      expect {
        delete :destroy, params: {id: store.to_param}, session: valid_session
      }.to change(Store, :count).by(-1)
    end

    it "redirects to the admin_stores list" do
      store = Store.create! valid_attributes
      delete :destroy, params: {id: store.to_param}, session: valid_session
      expect(response).to redirect_to admin_stores_path
    end
  end
end
