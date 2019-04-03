require 'rails_helper'

RSpec.describe HomeController do
  context "GET index" do
    it 'return 200' do
      get :index

      expect(response).to have_http_status :ok
    end

    it 'render index' do
      get :index

      expect(response).to render_template(:index)
    end
  end
end