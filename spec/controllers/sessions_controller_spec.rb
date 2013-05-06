require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    let(:action) {get :new}
    it "returns http success" do
      action
      response.should be_success
    end
  end
  
  describe "create" do
    let :user do
      FactoryGirl.create(:user)
    end
    let(:action) do
      post :create, session: {email: user.email, password: user.password}
    end
    context "with valid login info" do
      it "makes user login" do
        action
        response.should redirect_to user
      end
    end
  end

  describe "DELETE 'destroy'" do
    let(:user) {FactoryGirl.create :user}
    let(:action) {delete :destroy}
    before do
      session[:user_id] = user.id
      action
    end
    it "destroy current session" do
      session[:user_id].should be_nil
    end
    it "redirects to root" do
      response.should redirect_to root_path
    end
  end
end
