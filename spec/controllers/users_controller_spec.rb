require "spec_helper"

describe UsersController do
  before(:all) do 
    Role.destroy_all
    FactoryGirl.create(:role_with_super)
    FactoryGirl.create(:role_with_no_super)
  end
  let(:users) do
    20.times {|num| FactoryGirl.create(:user, username: "name#{num}",
     email: "name#{num}@example.com")}
  end

  context "when user not login" do
    
    describe "GET index" do
      before(:each) {get :index}
      subject {response}
      it {should redirect_to(signin_path)}
    end
    describe "GET show" do
      let(:user) {FactoryGirl.create(:user, role_id: 1)}
      it "renders signin_path" do
        get :show, id: user.id
        response.should redirect_to(signin_path)
      end
    end
    describe "GET new" do
      it "renders signin_path " do
        get :new
        response.should redirect_to(signin_path)
      end
    end
    describe "POST create" do
      let(:action) {post :create, user: {username: "hoangquan", email: "abc@yahoo.com", role_id: 1}}
      it "redirect to signin_path" do
        action
        response.should redirect_to signin_path
      end
    end
    describe "GET edit" do
      let(:user) {FactoryGirl.create :user, role_id: 1}
      it "renders signin_path " do
        get :edit, id: user.id
        response.should redirect_to signin_path
      end
    end
    describe "PUT update" do
      let(:user) {FactoryGirl.create(:user, role_id: 1)}
      let(:name_to_change) {"change"}
      let(:action) do
        put :update, id: user.id, user: {username: name_to_change}
      end
      it "redirect to signin_path" do
        action
        response.should redirect_to signin_path
      end
    end
    describe "DELETE destroy" do
      let(:user) {FactoryGirl.create(:user)}
      let(:action) {delete :destroy, id: user.id}
      it "coun't redirects to index action" do
        action
        response.should_not redirect_to action: :index
      end
      it "destroys a user" do
        action
        User.where(id: user.id).first.should_not be_nil
      end
    end
  end
  
  context "user logged in" do
    context "user with super role" do
      let(:user) do
        FactoryGirl.create(:user, role_id: 1)
      end
      before(:each) do
        session[:user_id] = user.id
      end
      describe "GET index" do
        before(:each) {get :index}
        subject {response}
        it {should render_template :index}
      end

      describe "GET show" do
        let(:user) {FactoryGirl.create(:user, role_id: 1)}
        it "renders user/show page" do
          get :show, id: user.id
          response.should render_template :show
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
        let(:user) {FactoryGirl.create :user, role_id: 1}
        it "renders edit page" do
          get :edit, id: user.id
          response.should render_template :edit
        end
      end

      describe "PUT update" do
        let(:user) {FactoryGirl.create(:user, role_id: 1)}
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
    end

    context "user with not super role" do
      let(:user) do
        FactoryGirl.create(:user, role_id: 2)
      end
      before(:each) do
        session[:user_id] = user.id
      end
      describe "DELETE destroy" do
        let(:action) {post :create, user: {username: "hoangquan", 
          email: "abc@yahoo.com", role_id: 1}}
        let(:action) {delete :destroy, id: user.id}
        it "redirects to root_path" do
          action
          response.should redirect_to root_path
        end
      end
      describe "GET new" do
        it "renders root_path" do
          get :new
          response.should redirect_to root_path
        end
      end
      describe "POST create" do
        let(:action) {post :create, user: {username: "hoangquan", 
          email: "abc@yahoo.com", role_id: 1}}
        it "redirect to root_path" do
          action
          response.should redirect_to root_path
        end
      end
      describe "GET edit" do
        let(:action) {post :create, user: {username: "hoangquan", 
          email: "abc@yahoo.com", role_id: 1}}
        it "renders root_path " do
          get :edit, id: user.id
          response.should redirect_to root_path
        end
      end
    end
  end
end
