require 'rails_helper'

RSpec.describe BookingsController do

  let(:user) { create(:user) }
  let(:vehicle) { create(:vehicle) }
  let(:booking) { create(:booking, {user_id: user.id, vehicle_id: vehicle.id}) }

  context "GET new" do
    it 'return vehicle object' do
      sign_in user

      get :new, params: {vehicle_id: vehicle.id}

      expect(assigns(:vehicle)).to eq vehicle
    end

    it 'render partial' do
      sign_in user

      get :new, params: {vehicle_id: vehicle.id}

      expect(response).to render_template("new")
    end
  end

  context "GET show" do
    it 'return 200' do
      sign_in user

      get :show, params: { id: booking.id }

      expect(response).to have_http_status(200)
    end
    it 'return booking object' do
      sign_in user

      get :show, params: { id: booking.id }

      expect(assigns(:booking)).to eq booking
    end
  end

  context "POST create" do
    it 'success booking' do
      sign_in user

      post :create, params: { vehicle_id: vehicle.id, price: 10 }

      expect(response).to have_http_status(302)
    end

    it 'return status - open' do
      sign_in user

      post :create, params: { vehicle_id: vehicle.id, price: 10 }

      expect(assigns(:booking).status).to eq 'open'
    end
  end

  context "PUT update" do
    it 'success booking' do
      sign_in user

      put :update, params: { id: booking.id }

      expect(response).to have_http_status(302)
    end

    it 'return status - close' do
      sign_in user

      put :update, params: { id: booking.id }

      expect(assigns(:booking).status).to eq 'closed'
    end
  end

  context "GET index" do
    it 'return user' do
      sign_in user

      get :index

      expect(response).to render_template("index")
    end
  end
end