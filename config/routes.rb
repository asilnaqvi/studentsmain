Rails.application.routes.draw do


  devise_for :admins 
 resources :schools do
 	resources :reviews
   collection do
     get 'account'
   end
 end
 
   resources :admins do 
   
   collection do
     get 'teacher'
   end
 end
 resources :messages do
 	resources :comments do
 		member do
 			put "like", to: 'comments#upvote'
 		end
 	end
 end
 resources :boards
  resources :teachers do
 	resources :testimonials
 end
 resources :students
 root 'schools#index' 

end
