require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  subject(:user) do
    User.create!(username: "Jeff", password: "123456")
  end
  describe "GET #new" do
    it "renders the sign-up page" do
      get :new
      expect(response).to be_success
      expect(response).to render_template(:new)
    end
  end


  describe "GET #show" do
    it "renders the user's show page" do
      get :show, params: {id: user.id}
      expect(response).to be_success
      expect(response).to render_template(:show)
    end
  end

  describe "POST #create" do   
    context "with invalid params" do   
      it "renders a new template" do 
        post :create, params: {user: {username: "Jeff"}}
        expect(response).to render_template(:new)
      end
    end

    context "with valid params" do
      it "should create a new user and redirects to the user's url" do
        post :create, params: {user: {username: "Jeff", password: "123456"}}
        expect(response).to redirect_to(user_url(User.find_by(username: "Jeff"))) 
      end
    end
  end
end
