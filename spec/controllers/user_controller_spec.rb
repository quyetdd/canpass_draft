require "spec_helper"

describe UsersController do
  render_views
  before(:all) do
    FactoryGirl.create(:role_with_only_name) 
  end
  describe "index" do
    before(:each) do
      20.times {|num| FactoryGirl.create(:user, username: "name#{num}", email: "name#{num}@example.com")}
      get :index
    end
    subject {response}
    it {should render_template("index")}
  end

  describe "GET show" do
    let(:user) {FactoryGirl.create(:user)}
    it "renders user/show page" do
      get :show, id: user.id
      response.should render_template(:show)
    end
  end

  describe "GET new" do
    it "renders user/new page" do
      get :new
      response.should render_template :new
    end
  end

  describe "POST create" do
    let(:action) {post :create, user: {username: "hoangquan", email: "abc@yahoo.com", role_id: 1}}
    context "with valid params" do
      it "incleases the number of users" do
        expect {action}.to change(User, :count).by 1
      end
      it "redirect to show action" do
        action
        response.should redirect_to action: :show, id: User.last.id
      end
    end
    context "with invalid params" do
      before {User.any_instance.stub(:valid?).and_return false}
      it "doesn't inclease the number of users" do
        expect {action}.not_to change User, :count
      end
      it "renders new action" do
        action
        response.should render_template :new
      end
    end
  end

  describe "GET edit" do
    let(:user) {FactoryGirl.create :user}
    it "renders edit page" do
      get :edit, id: user.id
      response.should render_template :edit
    end
  end

  describe "PUT update" do
    let(:user) {FactoryGirl.create(:user)}
    let(:name_to_change) {"change"}
    let(:action) do
      put :update, id: user.id, user: {username: name_to_change}
    end
    context "with valid params" do
      it "redirects to show action" do
        action
        response.should redirect_to action: :show, id: user.id
      end
      it "updates a user" do
        action
        user.reload.username.should eq name_to_change
      end
    end
    context "with invalid params" do
      before(:each) {put :update, id: user.id, user: {username: nil}}
      before {User.any_instance.stub(:valid?).and_return false}
      it "renders edit template" do
        action
        response.should render_template :edit
      end
      it "doesn't update a user" do
        action
        user.reload.username.should_not eq name_to_change
      end
    end
  end

  describe "DELETE destroy" do
    let(:user) {FactoryGirl.create(:user)}
    let(:action) {delete :destroy, id: user.id}
    it "redirects to index action" do
      action
      response.should redirect_to action: :index
    end
    it "destroys a user" do
      action
      User.where(id: user.id).first.should be_nil
    end
  end
end
