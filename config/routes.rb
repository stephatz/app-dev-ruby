Rails.application.routes.draw do
  # Routes for the Question resource:

  # CREATE
  post("/insert_question", { :controller => "questions", :action => "create" })
          
  # READ
  get("/questions", { :controller => "questions", :action => "index" })
  
  get("/questions/:path_id", { :controller => "questions", :action => "show" })
  
  # UPDATE
  
  post("/modify_question/:path_id", { :controller => "questions", :action => "update" })
  
  # DELETE
  get("/delete_question/:path_id", { :controller => "questions", :action => "destroy" })

  #------------------------------

  # Routes for the Interview resource:

  # CREATE
  post("/insert_interview", { :controller => "interviews", :action => "create" })
          
  # READ
  get("/interviews", { :controller => "interviews", :action => "index" })
  
  get("/interviews/:path_id", { :controller => "interviews", :action => "show" })
  
  # UPDATE
  
  post("/modify_interview/:path_id", { :controller => "interviews", :action => "update" })
  
  # DELETE
  get("/delete_interview/:path_id", { :controller => "interviews", :action => "destroy" })

  #------------------------------

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "interviews#index"
end
