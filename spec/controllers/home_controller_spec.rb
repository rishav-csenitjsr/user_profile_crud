require 'rails_helper'

RSpec.describe HomeController, type: :controller do
    describe 'Landing Page' do
        it "should render index template" do
            get 'index'
            expect(response).to have_http_status(200)
            expect(response).to render_template :index
        end
    end
end
