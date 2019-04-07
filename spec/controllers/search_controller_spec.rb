require 'rails_helper'

RSpec.describe SearchController do
  let(:user) { create(:user) }
  let(:vehicle) { create(:vehicle) }

  before(:each) { create(:booking, { user_id: user.id, vehicle_id: vehicle.id }) }

  describe 'failures' do
    context "GET index" do
      it 'with params' do
        get :index

        expect(response).to have_http_status(302)
      end

      it 'wrong params' do
        sign_in user

        get :index, params: {city: 'City', start_date: 'sdfjs', end_date: '123;lkjfa'}

        expect(response).to have_http_status(302)
      end
    end
  end

  describe 'success' do
    context 'GET index' do
      it 'return 200' do
        get :index, params: {city: 'City', start_date: '2019-04-10', end_date: '2019-04-15'}

        expect(response).to have_http_status(200)
      end

      it 'return 1 vehicle' do
        get :index, params: {city: 'City', start_date: '2019-04-10', end_date: '2019-04-15'}

        expect(assigns(:vehicles).count).to eq 1
      end
    end
  end
end