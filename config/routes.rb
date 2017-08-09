Rails.application.routes.draw do
  	devise_for :admins, :skip => [:registrations]
  	root :to => redirect("/admins/sign_in")

  	namespace :startup do
 		get "/teste" => "pages#teste", as: :home
 		resources :schools
 		resources :admins, :only => [:new, :index, :create, :show, :destroy]
 	end

 	scope :profile do
 		get "/datas" => "profile#show", as: :profile_datas
 		get "/edit-password" => "profile#edit_password", as: :profile_edit_password
 		get "/edit-data" => "profile#edit_data", as: :profile_edit_data
 		patch "/edit/:id" => "profile#update", as: :profile_update
 	end

 	namespace :school, :path => "/school/:school" do
 		root "home#home"
 		resources :admins, :only => [:new, :index, :create, :show, :destroy]
 		resources :students
 		resources :quiz
 		scope "quiz/:quiz_id" do
 			resources :questions, :only => [:new, :create, :edit, :update, :destroy]
 		end
 		get "/topics/:id" => "questions#topics"
 	end

 	namespace :api do
 		post "/login.json" => "sessions#create"
 		post "/update_student" => "students#update"
 		get "/return_student.json" => "sessions#return_student"
 	end
end
