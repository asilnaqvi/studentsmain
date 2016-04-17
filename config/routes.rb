Rails.application.routes.draw do


  devise_for :admins 
 resources :schools do
   collection do
     get 'account'
   end
 end
 
   resources :admins do 

   collection do
     get 'teacher'
   end
 end
 resources :boards
 resources :teachers
 resources :students
 root 'schools#index' 

end
