require 'rails_helper'

RSpec.describe MatchController, type: :controller do

  describe "GET #show" do
    it "returns http redirect" do
      get :show
      expect(response).to have_http_status(302)
    end
  end

end
