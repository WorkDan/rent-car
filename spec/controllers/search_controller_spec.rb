require 'rails_helper'

RSpec.describe SearchController do
  let(:user) { create(:user) }
  let(:vehicle) { create(:vehicle) }

  before(:each) { create(:booking, { user_id: user.id, vehicle_id: vehicle.id }) }

  context "GET index" do
    it 'return one car' do
      get :index

      expect(assigns(:vehicles).count).to eq 1
    end
  end
end